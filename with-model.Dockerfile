ARG es_version=7.5.0
FROM debian:buster-slim as downloader
ARG hanlp_data_version=1.7.5
WORKDIR /tmp
RUN apt update -yqq && apt install unar wget -yqq \
    # can't support < 1.7.5, the release file not host by github.
    && wget -q https://github.com/hankcs/HanLP/releases/download/v${hanlp_data_version}/data-for-${hanlp_data_version}.zip -O hanlp-data.zip \
    && unar -q hanlp-data.zip \
    && rm hanlp-data.zip

FROM tomczhen/elasticsearch-with-hanlp:${es_version}
COPY --from=downloader --chown=1000:1000 ["/tmp/hanlp-data/data/model","plugins/analysis-hanlp/data/model"]
