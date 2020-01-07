FROM debian:buster-slim as downloader
ARG hanlp_data_version=1.7.5
WORKDIR /tmp
RUN apt update -yqq && apt install unar wget -yqq \
    && wget -q https://github.com/hankcs/HanLP/releases/download/v${hanlp_data_version}/data-for-${hanlp_data_version}.zip -O hanlp-data.zip \
    && unar -q hanlp-data.zip \
    && cd data/dictionary/custom \
    && mv 机构名词典.txt OrganizationName.txt \
    && mv 全国地名大全.txt ChinesePlaceName.txt \
    && mv 人名词典.txt PersonalName.txt \
    && mv 上海地名.txt ShanghaiPlaceNmae.txt \
    && mv 现代汉语补充词库.txt ModernChineseSupplementaryWord.txt 

ARG es_version=7.5.0
FROM elasticsearch:${es_version}
ARG plugin_version=7.5.0

RUN sh -c '/bin/echo -e "y" | elasticsearch-plugin install https://github.com/KennFalcon/elasticsearch-analysis-hanlp/releases/download/v${plugin_version}/elasticsearch-analysis-hanlp-${plugin_version}.zip'
COPY --from=downloader ["/tmp/data","plugins/analysis-hanlp/"]