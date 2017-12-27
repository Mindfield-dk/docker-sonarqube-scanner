#!/bin/sh
sed -i -- "s|http://localhost:9000|${SONAR_HOST}|" ${SONAR_SCANNER_INSTALL_DIR}/conf/sonar-scanner.properties
sed -i -- "s|#sonar.host|sonar.host|" ${SONAR_SCANNER_INSTALL_DIR}/conf/sonar-scanner.properties
echo "${SONAR_SCANNER_BIN_DIR}/sonar-scanner $@"
${SONAR_SCANNER_BIN_DIR}/sonar-scanner "$@"
echo "Cleaning up..."
rm -rf '/data/?/'
rm -rf '/data/.scannerwork'
echo "Done."
