# devops-lab

![CI](https://github.com/fahadsafdar-crypto/devops-lab/actions/workflows/ci.yml/badge.svg)

## Week 1 — Linux Foundations

- Lab: Ubuntu 22.04 WSL2 + VS Code (`code .` from WSL)
- Created workspace: mkdir ~/devops-lab
- Permissions: 600 secrets (owner rw), 644 files (owner rw, others r), 755 scripts (owner rwx, others rx)
- Paths: / = filesystem root, /etc = configs, /var/log = logs, /var/www/html = web files
- nginx: sudo apt install nginx -y; systemctl status/start/enable; curl -I http://localhost
- Commands: apt, systemctl, cp, mv, rm, ls, cd, cat, head, tail, less, curl
- Learned: filesystem, permissions, files/dirs, service run/stop/verify with logs
- Workspace: ~/devops-lab (under home), not /devops-lab at filesystem root


## When the CI smoke test fails

If `curl` cannot reach the container, the Smoke test step exits with an error.
GitHub Actions shows a red X on that commit/PR.

Common causes:
- nginx not ready yet (fixed with a short retry/wait loop)
- container crashed — check `docker ps -a` and `docker logs ci-web` in the job log
- bad image / bad Dockerfile

A failing test is useful: it blocks a broken change from looking “done.”


## CI: GitHub Actions vs GitLab CI

- GitHub: `.github/workflows/ci.yml` — Actions tab. GitLab: `.gitlab-ci.yml` at repo root — Build → Pipelines.
- GitHub uses `jobs` / `steps` / `run:`. GitLab uses a job name and `script:`.
- Both: push to `main` → rented machine → `docker build -t hello-site:ci ./docker/hello-site`.
- GitHub also smoke-tests and pushes GHCR with git SHA. GitLab today = build only.

Jenkins / Azure DevOps = names in German job ads. We are not using them. Cloud = AWS later.

```text
push → CI reads YAML → docker build hello-site:ci → green or red
