ARG es_version=7.5.0
FROM tomczhen/elasticsearch-with-hanlp:${es_version}
ARG hanlp_data_version=1.7.5
# install unzip
RUN yum install unzip wget -y \
    && yum clean all \
    && rm -rf /var/cache/yum
# download hanlp data and rename custome dict file

RUN wget -q https://github.com/hankcs/HanLP/releases/download/v${hanlp_data_version}/data-for-${hanlp_data_version}.zip -O hanlp-data.zip \
    && unzip -uq hanlp-data.zip -d plugins/analysis-hanlp \
    && rm full-hanlp-data.zip