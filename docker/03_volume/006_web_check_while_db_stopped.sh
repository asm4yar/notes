set -euo pipefail

echo "== precheck web =="
curl -fsS -o /dev/null http://localhost/ && echo "web OK (before)" || { echo "web FAIL (before)"; exit 1; }

echo "== stopping db =="
docker compose stop db

echo "== web check while db is stopped =="
# несколько проверок, чтобы доказать доступность во время простоя db
for i in $(seq 1 20); do
  curl -fsS -o /dev/null http://localhost/ \
    && echo "[$i] web OK (db stopped)" \
    || { echo "[$i] web FAIL (db stopped)"; exit 1; }
  sleep 0.2
done

echo "== starting db =="
docker compose start db

echo "== waiting for mysql to be ready =="
# mysqladmin есть внутри mysql:5.7
for i in $(seq 1 60); do
  if docker compose exec -T db mysqladmin ping -pexample --silent; then
    echo "mysql OK"
    break
  fi
  sleep 1
  if [ "$i" -eq 60 ]; then
    echo "mysql FAIL (timeout)"
    exit 1
  fi
done

echo "== postcheck web =="
curl -fsS -o /dev/null http://localhost/ && echo "web OK (after)" || { echo "web FAIL (after)"; exit 1; }
