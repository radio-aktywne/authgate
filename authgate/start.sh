#!/bin/sh

until [ -f /etc/certs/backend/ca.pem ]; do
  echo "Waiting for backend certificates..."
  sleep 1
done

cat /etc/certs/backend/ca.pem >>/etc/ssl/certs/ca-certificates.crt

until [ -f /etc/certs/frontend/cert.pem ] && [ -f /etc/certs/frontend/key.pem ]; do
  echo "Waiting for frontend certificates..."
  sleep 1
done

cat <<EOF >./traefik.yml
entryPoints:
  https:
    address: ":${AUTHGATE_PORT:-20000}"
    http:
      tls: { }
    forwardedHeaders:
      trustedIPs: "${AUTHGATE_TRUSTED_IPS:-127.0.0.1}"

serversTransport:
  rootCAs:
    - /etc/certs/backend/ca.pem

api:
  dashboard: true

providers:
  file:
    directory: ./conf
EOF

/entrypoint.sh traefik --configFile=./traefik.yml
