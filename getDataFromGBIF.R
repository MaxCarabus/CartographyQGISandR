# install.packages('rgbif')
# https://cran.r-project.org/web/packages/rgbif/rgbif.pdf
library(rgbif)

# задаём рабочую директорию
setwd('C:/GIS/')

# taxon GBIF key - ищем через https://www.gbif.org/species
# Zizifora - 7308760
# Crataégus - 3013395
# Scabiosa - 2888800

# указываем Taxon Key
focalTaxon = 3013395

# подсчитываем число находок
numberOccs = occ_count(country = 'KZ', taxonKey = focalTaxon)

# список загружаемых терминов GBIF
terms = c('key','scientificName','taxonKey','decimalLatitude','decimalLongitude',
          'coordinateUncertaintyInMeters','datasetKey','basisOfRecord',
          'occurrenceStatus','taxonomicStatus','acceptedTaxonKey',
          'acceptedScientificName','taxonRank','iucnRedListCategory',
          'countryCode','stateProvince','county','eventDate','year','month','day',
          'locality','issues','datasetName','collectionCode','recordedBy',
          'verbatimLocality')

# загружаем находки
occs = occ_search(country = 'KZ', taxonKey = focalTaxon, limit = numberOccs, 
                  fields = terms)

nrow(occs$data) # число находок, полученных из GBIF

# записываем в файл
write.csv(occs$data, paste0(focalTaxon,'_gbif_occurrences.csv'), row.names = F)
