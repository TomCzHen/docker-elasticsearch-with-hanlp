ARG es_version=7.5.1
FROM elasticsearch:${es_version}
ARG plugin_version=7.5.0
RUN elasticsearch-plugin install https://github.com/KennFalcon/elasticsearch-analysis-hanlp/releases/download/v${plugin_version}/elasticsearch-analysis-hanlp-${plugin_version}.zip