module SequenceServer
  TITLE = 'HGD BLAST'
  BASE_URL = 'http://hymenopteragenome.org'
  APOLLO_WEBAPP_PATH = 'Apollo2'
  ORGANISMS = {
    # <Organism assembly>_<RefSeq accession> OR <Organism assembly>_<GenBank accession>
    'BEEBASE' => {
      "GCF_000469605.1_Apis_dorsata_1.3" => { 'id': 3168553, 'name': 'Apis dorsata', 'abbrev': 'Ador_1.3' },
      "GCF_000184785.1_Aflo_1.0" => { 'id': 3176652, 'name': 'Apis florea', 'abbrev': 'Aflo_1.0' },
      "GCF_000002195.4_Amel_4.5" => { 'id': 26229, 'name': 'Apis mellifera', 'abbrev': 'Amel_4.5' },
      "GCF_000188095.1_BIMP_2.0" => { 'id': 3184599, 'name': 'Bombus impatiens', 'abbrev': 'Bimp_2.0' },
      "GCF_000214255.1_Bter_1.0" => { 'id': 3190160, 'name': 'Bombus terrestris', 'abbrev': 'Bter_1.0' },
      "GCF_001272555.1_ASM127255v1" => { 'id': 3211148, 'name': 'Dufourea novaeangliae', 'abbrev': 'ASM127255v1' },
      "Eufriesea_mexicana" => { 'id': 3391423, 'name': 'Eufriesea mexicana', 'abbrev': 'Emex'},
      "Habropoda_laboriosa" =>  { 'id': 3766653, 'name': 'Habropoda laboriosa', 'abbrev': 'Hlab' },
      "Lalb_OGS" => { 'id': 91165, 'name': 'Lasioglossum albipes', 'abbrev': 'Lalb' },
      "GCF_000220905.1_MROT_1.0" => { 'id': 3227255, 'name': 'Megachile rotundata', 'abbrev': 'MROT_1.0' },
      "Melipona_quadrifasciata" => { 'id': 3794222, 'name': 'Melipona quadrifasciata', 'abbrev': 'Mqua' },
    },
    'ANT_GENOMES_PORTAL' => {
      "GCF_000204515.1_Aech_3.9" => { 'id': 3164212, 'name': 'Acromyrmex echinatior', 'abbrev': 'Aech_3.9' },
      "GCF_000143395.1_Attacep1.0" => { 'id': 1935105, 'name': 'Atta cephalotes', 'abbrev': 'Attacep1.0' },
      "GCF_000147175.1_CamFlo_1.0" => { 'id': 3200352, 'name': 'Camponotus floridanus', 'abbrev': 'CamFlo_1.0' },
      "Cobs_1.4" => { 'id': 1697843, 'name': 'Cardiocondyla obscurior', 'abbrev': 'Cobs_1.4'},
      "GCF_000611835.1_CerBir1.0" => { 'id': 3195771, 'name': 'Cerapachys biroi', 'abbrev': 'CerBir1.0' },
      "GCF_000147195.1_HarSal_1.0" => { 'id': 3215328, 'name': 'Harpegnathos saltator', 'abbrev': 'HarSal_1.0' },
      "GCF_000217595.1_Lhum_UMD_V04" => { 'id': 3224223, 'name': 'Linepithema humile', 'abbrev': 'Lhum_UMD_v04' },
      "GCF_000187915.1_Pbar_UMD_V03" => { 'id': 3239625, 'name': 'Pogonomyrmex barbatus', 'abbrev': 'Pbar_UMD_V03' },
      "GCF_000188075.1_Si_gnG" => { 'id': 3244274, 'name': 'Solenopsis invicta', 'abbrev': 'Si_gnG' },
      "GCF_000956235.1_wasmannia.A_1.0" => { 'id': 3313787, 'name': 'Wasmannia auropunctata', 'abbrev': 'wasmannia.A_1.0' }
    },
    'NASONIABASE' => {
      "GCF_000002325.3_Nvit_2.1" => { 'id': 3233525, 'name': 'Nasonia vitripennis', 'abbrev': 'Nvit_2.1' }
    }
  }
end
