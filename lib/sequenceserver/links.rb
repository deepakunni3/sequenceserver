module SequenceServer
  # Module to contain methods for generating sequence retrieval links.
  module Links
    require 'erb'

    # Provide a method to URL encode _query parameters_. See [1].
    include ERB::Util
    #
    alias_method :encode, :url_encode

    NCBI_ID_PATTERN    = /gi\|(\d+)\|/
    UNIPROT_ID_PATTERN = /sp\|(\w+)\|/

    # Link generators return a Hash like below.
    #
    # {
    #   # Required. Display title.
    #   :title => "title",
    #
    #   # Required. Generated url.
    #   :url => url,
    #
    #   # Optional. Left-right order in which the link should appear.
    #   :order => num,
    #
    #   # Optional. Classes, if any, to apply to the link.
    #   :class => "class1 class2",
    #
    #   # Optional. Class name of a FontAwesome icon to use.
    #   :icon => "fa-icon-class"
    # }
    #
    # If no url could be generated, return nil.
    #
    # Helper methods
    # --------------
    #
    # Following helper methods are available to help with link generation.
    #
    #   encode:
    #     URL encode query params.
    #
    #     Don't use this function to encode the entire URL. Only params.
    #
    #     e.g:
    #         sequence_id = encode sequence_id
    #         url = "http://www.ncbi.nlm.nih.gov/nucleotide/#{sequence_id}"
    #
    #   querydb:
    #     Returns an array of databases that were used for BLASTing.
    #
    #   whichdb:
    #     Returns the database from which the given hit came from.
    #
    #     e.g:
    #
    #         hit_database = whichdb
    #
    # Examples:
    # ---------
    # See methods provided by default for an example implementation.

    def sequence_viewer
      accession  = encode self.accession
      database_ids = encode querydb.map(&:id).join(' ')
      url = "hgd_blast/get_sequence/?sequence_ids=#{accession}" \
            "&database_ids=#{database_ids}"

      {
        :order => 0,
        :url   => url,
        :title => 'Sequence',
        :class => 'view-sequence',
        :icon  => 'fa-eye'
      }
    end

    def fasta_download
      accession  = encode self.accession
      database_ids = encode querydb.map(&:id).join(' ')
      url = "hgd_blast/get_sequence/?sequence_ids=#{accession}" \
            "&database_ids=#{database_ids}&download=fasta"

      {
        :order => 1,
        :title => 'FASTA',
        :url   => url,
        :class => 'download',
        :icon  => 'fa-download'
      }
    end

    def ncbi
      return nil unless id.match(NCBI_ID_PATTERN)
      ncbi_id = Regexp.last_match[1]
      ncbi_id = encode ncbi_id
      url = "http://www.ncbi.nlm.nih.gov/#{querydb.first.type}/#{ncbi_id}"
      {
        :order => 2,
        :title => 'NCBI',
        :url   => url,
        :icon  => 'fa-external-link'
      }
    end

    def uniprot
      return nil unless id.match(UNIPROT_ID_PATTERN)
      uniprot_id = Regexp.last_match[1]
      uniprot_id = encode uniprot_id
      url = "http://www.uniprot.org/uniprot/#{uniprot_id}"
      {
        :order => 2,
        :title => 'Uniprot',
        :url   => url,
        :icon  => 'fa-external-link'
      }
    end

    def jbrowse
      if SequenceServer::ORGANISMS.empty?
        url = ''
      elsif
        representative_database = whichdb[0].name
        organism_prefix1 = representative_database.split('/')[-1].split('_')[0,3].join("_")
        organism_id = 0

        if SequenceServer::ORGANISMS.has_key?(organism_prefix1)
          organism_id = SequenceServer::ORGANISMS.fetch(organism_prefix1)[:id]
        else
          organism_prefix2 = representative_database.split('/')[-1].split('_')[0,4].join("_")
          if SequenceServer::ORGANISMS.has_key?(organism_prefix2)
            organism_id = SequenceServer::ORGANISMS.fetch(organism_prefix2)[:id]
          end
        end

        if id.match(NCBI_ID_PATTERN)
          # NCBI Gene, mRNA or protein
          # >gi|741912808|ref|XP_010799192.1
          feature_id = id.split('|')[3]
          url = "#{SequenceServer::BASE_URL}/#{SequenceServer::APOLLO_WEBAPP_PATH}/#{organism_id}/jbrowse/index.html?loc=#{feature_id}"
        elsif id.match('^gnl\|')
          # Genomic sequence
          # >gnl|UMD3.1|SEQNAME
          seq_name = id.split(':')[1]
          fmin = hsps.map(&:sstart).min
          fmax = fmin + hsps.map(&:length).max
          location_string = "#{seq_name}:#{fmin}..#{fmax}"
          location_string = encode location_string
          url = "#{SequenceServer::BASE_URL}/#{SequenceServer::APOLLO_WEBAPP_PATH}/#{organism_id}/jbrowse/index.html?loc=#{location_string}&highlight=#{location_string}"
        elsif id.match('^ref\|')
          # >ref|NAME
          header = id.split('|')
          if header.length > 0
            feature_id = header[1]
          else
            feature_id = header[0]
          end

          url = "#{SequenceServer::BASE_URL}/#{SequenceServer::APOLLO_WEBAPP_PATH}/#{organism_id}/jbrowse/index.html?loc=#{feature_id}"
        else
          # >NAME
          feature_id = id
          url = "#{SequenceServer::BASE_URL}/#{SequenceServer::APOLLO_WEBAPP_PATH}/#{organism_id}/jbrowse/index.html?loc=#{feature_id}"
        end
      end

      {
        :order => 0,
        :url   => url,
        :title => "View in JBrowse",
        :class => 'view-jbrowse',
        :icon  => 'fa-eye'
      }
    end
  end
end

# [1]: https://stackoverflow.com/questions/2824126/whats-the-difference-between-uri-escape-and-cgi-escape
