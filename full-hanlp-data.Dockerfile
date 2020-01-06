ARG es_version=7.5.0
FROM tomczhen/elasticsearch-with-hanlp:${es_version}
ARG hanlp_data_version=1.7.6
# install unzip
RUN yum install unzip -y \
    && yum clean all \
    && rm -rf /var/cache/yum
# download hanlp data and rename custome dict file
RUN curl -sL https://github.com/hankcs/HanLP/releases/download/v${hanlp_data_version}/data-for-${hanlp_data_version}.zip \
    && unzip -xq data-for-${hanlp_data_version}.zip -d plugins/analysis-hanlp \
    && rm data-for-${hanlp_data_version}.zip