#bin/sh

echo "PORT:$PORT"

bundle exec rackup --host 0.0.0.0 -p "$PORT"
