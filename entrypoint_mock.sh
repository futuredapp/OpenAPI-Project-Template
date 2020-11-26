#bin/sh

echo "PORT:$PORT"

node dist/index.js mock -p "$PORT" -h 0.0.0.0 api.yaml --errors
