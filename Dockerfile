ARG TRAEFIK_IMAGE_TAG=v2.8.4

FROM traefik:$TRAEFIK_IMAGE_TAG

WORKDIR /app

COPY authgate/start.sh ./start.sh
RUN chmod +x ./start.sh

COPY ./authgate/conf/ ./conf/

ENV AUTHGATE_PORT=20000 \
    AUTHGATE_WEBAUTH_PUBLIC_URL=http://localhost:21000 \
    AUTHGATE_AUTHE_URL=http://localhost:23000 \
    AUTHGATE_AUTHO_URL=http://localhost:24000

EXPOSE 20000

ENTRYPOINT ["./start.sh"]
CMD []
