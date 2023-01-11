#!/usr/bin/env bash
NUXEO_PACKAGES=$NUX_PACKAGES

if [[ -e ${NUXEO_HOME}/packages/configured-pkg ]]; then
  echo "# Refresh MP from cache"
  rm -rf /opt/nuxeo/server/packages/.packages
  set -e
  /docker-entrypoint.sh nuxeoctl mp-install --relax=true --accept=true  /opt/nuxeo/server/packages/cache/*
else
  start=$(date --utc +%Y%m%d_%H%M%SZ)
  echo "# ${start}: Installing MP ${NUXEO_PACKAGES} ..."
  set -e
  /docker-entrypoint.sh nuxeoctl mp-install --relax=true --accept=true ${NUXEO_PACKAGES}
  touch ${NUXEO_HOME}/packages/configured-pkg
  # use a cache because we cannot reinstall package from the store directory
  cp -ar /opt/nuxeo/server/packages/store/ /opt/nuxeo/server/packages/cache
  end=$(date --utc +%Y%m%d_%H%M%SZ)
  echo "# ${end}: MP installed"
fi
now=$(date --utc +%Y%m%d_%H%M%SZ)
cp ${NUXEO_CONF} "/var/lib/nuxeo/nuxeo-${now}.conf"
exec /docker-entrypoint.sh "$@"
