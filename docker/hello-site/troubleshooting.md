# Container troubleshooting (5 issues)

1. Container Exited immediately
   Check: docker ps -a --filter name=broken-nginx (container name)
   Then: docker logs NAME (container name)
   Then: docker inspect --format '{{.State.ExitCode}}' NAME (contianer name)
   or 
   Then: docker inspect --format 'Status={{.State.Status}} ExitCode={{.State.ExitCode}} Error={{.State.Error}}' NAME(container name)

2. Container Up but curl fails
   Check: docker ps (PORTS column — host port)
   Then: curl -I http://localhost:HOSTPORT
   Then: ss -tuln | grep HOSTPORT

3. Wrong process / two nginx
   Host nginx = systemctl (often :80, Server header Ubuntu)
   Docker nginx = docker ps (e.g. 8080:80, different version)

4. Data gone after compose down
   Named volume: docker volume ls
   down vs down -v ( -v deletes volumes)

5. Compose v1 recreate crash (ContainerConfig)
   Use: docker compose (v2, space) not docker-compose 1.29
