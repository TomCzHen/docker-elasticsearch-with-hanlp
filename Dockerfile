ARG ES_VER=7.5.0
ARG PLUGIN_VER=7.5.0
FROM elasticsearch:${ES_VER}
RUN elasticsearch-plugin install https://github.com/KennFalcon/elasticsearch-analysis-hanlp/releases/download/v${PLUGIN_VER}/elasticsearch-analysis-hanlp-${PLUGIN_VER}.zip