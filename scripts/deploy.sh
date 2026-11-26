#!/usr/bin/env bash
# deploy.sh: install dependencies, restart the app, and verify it's healthy
set -euo pipefail

APP_DIR="/home/ubuntu/shipit"
HEALTH_URL="http://localhost/health"

echo "==> Installing dependencies"
cd "$APP_DIR"
"$APP_DIR/.venv/bin/pip" install -q -r requirements.txt

echo "==> Restarting shipit"
sudo systemctl restart shipit

echo "==> Waiting for health check"
for attempt in {1..10}; do
  if curl -fsS "$HEALTH_URL" > /dev/null; then
    echo "==> Deploy OK (attempt $attempt): $(curl -s "$HEALTH_URL")"
    exit 0
  fi
  sleep 1
done

echo "==> Deploy FAILED: app not healthy after 10s" >&2
journalctl -u shipit -n 20 --no-pager >&2
exit 1
