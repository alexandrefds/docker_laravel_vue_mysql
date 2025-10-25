#!/usr/bin/env bash
set -e

mkdir -p "$APP_DIR"

if [ -z "$(ls -A $APP_DIR 2>/dev/null)" ]; then
  echo "Clonando repositório..."
  if [[ "$APP_DIR" == *"admin"* ]]; then
    git clone https://github.com/alexandrefds/dashboard_admin.git "$APP_DIR"
  else
    git clone https://github.com/alexandrefds/imob.git "$APP_DIR"
  fi
else
  echo "App já existe — pulando clone."
fi

# Configura Nginx
envsubst '$APP_DIR' < /etc/nginx/nginx-site.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
