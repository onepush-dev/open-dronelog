#!/bin/sh
# Open DroneLog on Railway. Railway injects PORT=8080, which the Axum backend would also read,
# so the backend is pinned to 127.0.0.1:3001 (where nginx proxies /api) and nginx serves on 8080.
set -e
mkdir -p "${DATA_DIR:-/data/drone-logbook}"
echo "Starting Open DroneLog API server on 127.0.0.1:3001..."
PORT=3001 HOST=127.0.0.1 /app/open-dronelog &
echo "Starting nginx on port 8080..."
exec nginx -g 'daemon off;'
