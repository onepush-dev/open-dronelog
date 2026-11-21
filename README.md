# Open DroneLog on Railway

[Open DroneLog](https://github.com/arpanghosh8453/open-dronelog) (AGPL-3.0) — a self-hosted drone flight-log analyzer and logbook: import DJI, Litchi, Airdata and other logs, see flights on a map with telemetry charts, battery health, tags and stats. Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

## What this template runs

- **open-dronelog**: `ghcr.io/onepush-dev/open-dronelog:3.3.2`, the official `ghcr.io/arpanghosh8453/open-dronelog:3.3.2` image (Rust/Axum API + React app on nginx, unmodified). nginx listens on 8080; the API stays on `127.0.0.1:3001`. A volume at `/data/drone-logbook` keeps the DuckDB databases, profiles and uploaded logs.

## Variables

| Variable | Value | Notes |
|---|---|---|
| `DEFAULT_PROFILE_PASSWORD` | generated secret | Password of the `default` profile, applied on first boot only. Without it anyone with the URL could see your flights. |
| `PROFILE_CREATION_PASS` | generated secret | Master password needed to create or delete extra profiles. |

Baked in: `DATA_DIR=/data/drone-logbook`, `KEEP_UPLOADED_FILES=true`, `RUST_LOG=info`. Optional: `DJI_API_KEY` (a free DJI developer key, needed to decrypt newer DJI logs; can also be entered in the app), `SESSION_TTL_HOURS` (default 24).

## How to use

1. Deploy, copy `DEFAULT_PROFILE_PASSWORD` from the service variables and open the domain.
2. Unlock the default profile with that password and drag in flight logs (`.txt` DJI logs, Litchi/Airdata CSV and more), or add manual flights.

Not affiliated with Open DroneLog or DJI.
