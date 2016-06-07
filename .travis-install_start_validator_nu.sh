#!/usr/bin/env sh

VALIDATOR_NU_VERSION=16.3.3
VALIDATOR_NU_PORT=8888
VALIDATOR_NU_ZIP=vnu.jar_${VALIDATOR_NU_VERSION}.zip
VALIDATOR_NU_URL="https://github.com/validator/validator/releases/download/${VALIDATOR_NU_VERSION}/${VALIDATOR_NU_ZIP}"
VALIDATOR_NU_DEST="${HOME}/validator"

if [ -d "${VALIDATOR_NU_DEST}" ]; then
  wget "${VALIDATOR_NU_URL}" -O "/tmp/${VALIDATOR_NU_ZIP}"
  unzip -d "${VALIDATOR_NU_DEST}" "/tmp/${VALIDATOR_NU_ZIP}"
  nohup java -cp "${VALIDATOR_NU_DEST}/dist/vnu.jar" nu.validator.servlet.Main \
    "${VALIDATOR_NU_PORT}" </dev/null 2>&1 &
fi
