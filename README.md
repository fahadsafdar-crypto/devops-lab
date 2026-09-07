# devops-lab

![CI](https://github.com/fahadsafdar-crypto/devops-lab/actions/workflows/ci.yml/badge.svg)

<<<<<<< HEAD

Personal DevOps lab on Ubuntu 22.04 WSL2 + VS Code.  
This repository is what I built after work.
```text
~/devops-lab
  docker/hello-site     Compose app (nginx + Redis)
  .github/workflows     GitHub Actions
  .gitlab-ci.yml        GitLab CI
  terraform/s3-lab      Terraform S3
  terraform/ec2-lab     Terraform SG + EC2
  scripts/              small bash scripts


## Linux Foundations
=======
## — Linux Foundations
>>>>>>> 592d4737e4891bba63599494088852e95d165a49

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

<<<<<<< HEAD

```text
push → CI reads YAML → docker build hello-site:ci → green or red


## Docker

sudo apt update
sudo apt install -y docker.io docker-compose-v2
cd ~/devops-lab/docker/hello-site
sudo docker compose up -d
sudo docker compose ps
curl -I http://127.0.0.1:8080

## AWS (eu-central-1 / Frankfurt)

- Personal IAM user with MFA. Not SAP production / Sovereign Cloud.
- Security groups: SSH from my IP only (/32), not 0.0.0.0/0 on port 22
- EC2 Ubuntu (t3.micro), then stop or terminate
- S3 bucket, versioning, AWS CLI (aws s3 ls)
- Monthly budget alarm
- Demo deploy: copy Compose app to EC2, run it, tear the instance down
- scp -i KEY.pem -r ~/devops-lab/docker/hello-site ubuntu@PUBLIC_IP:~/
## Terraform

Infrastructure as code: describe AWS in .tf files, then apply or destroy.

- Folder	               What it does
- terraform/s3-lab       S3 bucket: init → plan → apply → destroy
- terraform/ec2-lab
- Security group (SSH /32) + EC2 t3.micro. Ubuntu AMI from SSM (not a hardcoded ami-…). Output: public IP. Then destroy.
- .tf files → terraform apply  → AWS creates resources
         → terraform destroy → AWS deletes them
- variable = input (e.g. ssh_cidr). description is a comment, not the value.
- data "aws_ssm_parameter" = look up the current Ubuntu AMI in this region.
- resource = create (SG, instance, bucket).
- output = print values after apply (e.g. public IP).
- State files (*.tfstate) and .terraform/ are gitignored.


=======
```text
push → CI reads YAML → docker build hello-site:ci → green or red

## AWS (eu-central-1 / Frankfurt)
Hands-on with a personal IAM user (MFA). Not production SAP Sovereign Cloud.
- IAM, security groups (SSH from my IP only), EC2 Ubuntu, S3 (versioning), AWS CLI, monthly budget alarm.
- Docker Compose app copied to EC2 with `scp`, `docker compose up`, then instance terminated.
- Images: GitHub Actions also pushes `hello-site` to GHCR tagged with git SHA.
## Terraform
Folders (this repo):
- `terraform/s3-lab` — S3 bucket: `init` → `plan` → `apply` → `destroy`
- `terraform/ec2-lab` — security group (SSH `/32`) + `t3.micro`, Ubuntu AMI from SSM (not a hardcoded `ami-…`), existing key pair, `outputs` public IP, then `destroy`
```text
.tf files  →  terraform apply  →  AWS creates SG + EC2
           →  terraform destroy →  AWS deletes them
>>>>>>> 592d4737e4891bba63599494088852e95d165a49
