#!/usr/bin/env sh

set -eu

accept_eula() {
  fileExists "${WORKDIR}/eula.txt" || echo "eula=true" > "${WORKDIR}/eula.txt"
}

available_memory() {
  free -m | grep Mem | awk '{ print $4 }'
}

copy() {
  local src=$1
  local dest=$2
  cp -Rf "${src}" "${dest}" >/dev/null 2>&1 || error "Failed to copy ${src}"
}

check_defaults() {
  local item
  for item in ${PACKAGE}/defaults/*.json; do
    local file="${item##*/}"
    fileExists "${WORKDIR}/${file}" || copy "${PACKAGE}/defaults/${file}" "${WORKDIR}/${file}"
  done;
}

error() {
  sleep 0.1
  local message=$@
  echo "[ERROR] ${message}" 1>&2 && exit 1
}

fileExists() {
  local file=$1
  [[ -f "${file}" ]] || return 1
}

start_server() {
  local ram=$(available_memory)
  local jvm_opt="-Xms256M -Xmx${ram}M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:+AggressiveOpts"
  local jar_opt="${JAR_OPT}"
  local server="${PACKAGE}/${JAR}"
  fileExists "${server}" || error "Failed to locate ${server}"

  # Run the server as PID 1
  exec java ${jvm_opt} -jar ${server} ${jar_opt}
}

check_defaults
accept_eula
start_server