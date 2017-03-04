module SequenceServer
  TITLE = 'HGD BLAST'
  BASE_URL = 'http://hymenopteragenome.org'
  APOLLO_WEBAPP_PATH = 'Apollo2'
  ORGANISMS = {
    # <Organism assembly>_<RefSeq accession> OR <Organism assembly>_<GenBank accession>
    "GCF_000002195.4_Amel_4.5" => { 'id': 26229, 'name': 'Apis mellifera', 'abbrev': 'Amel_4.5' },
    "GCF_000188095.1_BIMP_2.0" => { 'id': 1710934, 'name': 'Bombus impatiens', 'abbrev': 'Bimp_2.0' },
    "GCF_000469605.1_Apis_dorsata_1.3" => { 'id': 1896242, 'name': 'Apis dorsata', 'abbrev': 'Ador_1.3' },
    "GCF_000184785.1_Aflo_1.0" => { 'id': 1583983, 'name': 'Apis florea', 'abbrev': 'Aflo_1.0' },
    "GCF_000002325.3_Nvit_2.1" => { 'id': 1805105, 'name': 'Nasonia vitripennis', 'abbrev': 'Nvit_2.1' },
    "GCF_000214255.1_Bter_1.0" => { 'id': 3116725, 'name': 'Bombus terrestris', 'abbrev': 'Bter_1.0' },
    "GCF_000220905.1_MROT_1.0" => { 'id': 3122336, 'name': 'Megachile rotundata', 'abbrev': 'MROT_1.0' },
    "GCF_000204515.1_Aech_3.9" => { 'id': 1811476, 'name': 'Acromyrmex echinatior', 'abbrev': 'Aech_3.9' },
    "GCF_000143395.1_Attacep1.0" => { 'id': 0, 'name': 'Atta cephalotes', 'abbrev': 'Attacep1.0' },
    "GCF_000956235.1_wasmannia.A_1.0" => { 'id': 1716495, 'name': 'Wasmannia auropunctata', 'abbrev': 'wasmannia.A_1.0' },
    "GCF_000611835.1_CerBir1.0" => { 'id': 3087333, 'name': 'Cerapachys biroi', 'abbrev': 'CerBir1.0' },
    "GCF_000188075.1_Si_gnG" => { 'id': 1820465, 'name': 'Solenopsis invicta', 'abbrev': 'Si_gnG' },
    "GCF_000187915.1_Pbar_UMD_V03" => { 'id': 1825064, 'name': 'Pogonomyrmex barbatus', 'abbrev': 'Pbar_UMD_V03' },
    "GCF_000217595.1_Lhum_UMD_V04" => { 'id': 1591930, 'name': 'Linepithema humile', 'abbrev': 'Lhum_UMD_v04' },
    "GCF_000147195.1_HarSal_1.0" => { 'id': 3073857, 'name': 'Harpegnathos saltator', 'abbrev': 'HarSal_1.0' },
    "GCF_000147175.1_CamFlo_1.0" => { 'id': 0, 'name': 'Camponotus floridanus', 'abbrev': 'CamFlo_1.0' },
    "GCF_001272555.1_ASM127255v1" => { 'id': 0, 'name': 'Dufourea novaeangliae', 'abbrev': 'ASM127255v1' }
  }
end
