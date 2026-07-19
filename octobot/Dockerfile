ARG BUILD_FROM=drakkarsoftware/octobot:stable
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

LABEL \
  org.opencontainers.image.title="Home Assistant Add-on: OctoBot" \
  org.opencontainers.image.source="https://github.com/drakkar-software/octobot-home-assistant" \
  org.opencontainers.image.licenses="Apache License 2.0"
