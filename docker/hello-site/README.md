# hello-site — Docker learning project
## Architecture
Dockerfile → Image (hello-site-web) → Container (hello-web)
Compose runs: web (nginx + HTML) + redis (cache/data)
## Stack
- nginx:alpine (web server)
- redis:alpine (data store)
- Named volume: redis-data:/data
- Bind mount: ./index.html (dev only)
- Port: host 8080 → container 80
## Commands
docker compose up -d
docker compose ps
docker compose logs web
docker compose down
docker compose down -v  (deletes volumes)
## Troubleshooting
See TROUBLESHOOTING.md
