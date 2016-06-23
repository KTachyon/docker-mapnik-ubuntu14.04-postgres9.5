FROM marcbachmann/libvips

### BASE DEPENDENCIES ###
RUN apt-get update && apt-get install -y curl python-software-properties software-properties-common build-essential git
RUN add-apt-repository -y  ppa:mapnik/nightly-2.3
RUN apt-get update && apt-get install -y libmapnik libmapnik-dev mapnik-utils python-mapnik
# also install datasource plugins if you need them
RUN apt-get install -y mapnik-input-plugin-gdal mapnik-input-plugin-ogr \
  mapnik-input-plugin-postgis \
  mapnik-input-plugin-sqlite \
  mapnik-input-plugin-osm

### POSTGRES CLIENT ###
RUN apt-get install -y wget
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' \
  && wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add - \
  && apt-get update \
  && apt-get install -y postgresql-client
