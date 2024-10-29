FROM eclipse-temurin:8-jdk-alpine

ARG BUILD_DATE=""
ARG VCS_REF="latest"
ARG VERSION="latest"

LABEL maintainer="https://github.com/mindfield/docker-sonarqube-scanner" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="mindfield" \
      org.label-schema.name="sonarqube" \
      org.label-schema.license="MIT" \
      org.label-schema.description="This is a dockerized sonar cli scanner" \
      org.label-schema.vcs-url="https://github.com/mindfield/docker-sonarqube-scanner" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.version=${VERSION} \
      org.label-schema.url="https://unknown" \
      org.label-schema.usage="https://github.com/mindfield/docker-sonarqube-scanner#readme"

ENV VERSION                    5.0.1.3006
ENV OS                         linux
ENV SONAR_SCANNER_WORKING_DIR  /data
ENV SONAR_SCANNER_INSTALL_DIR  /opt/sonar-scanner
ENV SONAR_SCANNER_BIN_DIR      ${SONAR_SCANNER_INSTALL_DIR}/bin
ENV SONAR_SCANNER_DOWNLOAD_URL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VERSION}-${OS}.zip
                               
ENV SONAR_SCANNER_ZIP          /tmp/sonar-scanner-cli-${VERSION}.zip
ENV SONAR_SCANNER_FOLDER       sonar-scanner-${VERSION}-${OS}
ENV SONAR_USER                 sonar
ENV SONAR_HOST                 https://sonarcloud.io

RUN adduser -D ${SONAR_USER} \
&& apk update \
&& apk add --no-cache curl unzip nodejs \
&& mkdir -p ${SONAR_SCANNER_INSTALL_DIR} \
&& curl -L --silent ${SONAR_SCANNER_DOWNLOAD_URL} -o ${SONAR_SCANNER_ZIP} \
&& unzip ${SONAR_SCANNER_ZIP} -d /tmp \
&& mv /tmp/${SONAR_SCANNER_FOLDER}/*  ${SONAR_SCANNER_INSTALL_DIR}/ \
&& rm ${SONAR_SCANNER_ZIP} \
&& rm -R /tmp/${SONAR_SCANNER_FOLDER} \
&& rm -R ${SONAR_SCANNER_INSTALL_DIR}/jre \
&& chmod -R 777 ${SONAR_SCANNER_INSTALL_DIR}/conf \
&& sed -i -- "s|use_embedded_jre=true|use_embedded_jre=false|" ${SONAR_SCANNER_INSTALL_DIR}/bin/sonar-scanner \
&& sed -i -- "s|#sonar.sourceEncoding|sonar.sourceEncoding|" ${SONAR_SCANNER_INSTALL_DIR}/conf/sonar-scanner.properties

COPY entrypoint.sh ${SONAR_SCANNER_INSTALL_DIR}/
RUN chmod 755 ${SONAR_SCANNER_INSTALL_DIR}/entrypoint.sh

USER ${SONAR_USER}
ENTRYPOINT ["/opt/sonar-scanner/entrypoint.sh"]
