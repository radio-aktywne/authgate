#!/bin/sh

cat <<EOF >./traefik.yml
entryPoints:
  http:
    address: ":${AUTHGATE_PORT:-20000}"

api:
  dashboard: true

providers:
  file:
    directory: ./conf
EOF

/entrypoint.sh traefik --configFile=./traefik.yml
