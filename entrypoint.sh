#!/bin/bash
SONAR_SCANNER_INSTALL_DIR=/opt/sonar-scanner
SONAR_SCANNER_BIN_DIR=${SONAR_SCANNER_INSTALL_DIR}/bin
echo "${SONAR_SCANNER_BIN_DIR}/sonar-scanner $@"
${SONAR_SCANNER_BIN_DIR}/sonar-scanner "$@"
echo "Cleaning up..."
rm -rf '/data/?/'
rm -rf '/data/.scannerwork'
echo "Done."
