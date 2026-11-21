# Open DroneLog on Railway: the official ghcr.io/arpanghosh8453/open-dronelog:3.3.2 image (AGPL-3.0),
# app unmodified. Railway layer: nginx listens on 8080 (Railway's PORT), the Axum API stays on
# 127.0.0.1:3001, data lives on the volume at /data/drone-logbook, and logging defaults to info.
FROM ghcr.io/arpanghosh8453/open-dronelog:3.3.2
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/open-dronelog"
COPY railway/start.sh /app/railway-start.sh
RUN chmod +x /app/railway-start.sh \
 && sed -i -E 's/listen[[:space:]]+80;/listen 8080;\n    listen [::]:8080;/' /etc/nginx/conf.d/default.conf \
 && grep -n "listen" /etc/nginx/conf.d/default.conf
ENV DATA_DIR=/data/drone-logbook \
    KEEP_UPLOADED_FILES=true \
    RUST_LOG=info
EXPOSE 8080
ENTRYPOINT ["/app/railway-start.sh"]
