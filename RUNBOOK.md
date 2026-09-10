# Runbook — devops-lab

## Detect
How I notice: Grafana graph / Prometheus target DOWN / user says site down / CI red.

## Triage
1. Is the container running? docker compose ps
2. Logs? docker compose logs / logs prometheus / > docker compose restart
3. Metrics (if monitoring is up)? curl -I http://127.0.0.1:8080

## Fix
Smallest restart. Do not destroy AWS unless that is the problem.

## Postmortem (after it is up)
What broke, what we did, what we change (retry, alert, disk).

## GDPR (logs)
- IPs/usernames in logs = personal data
- Do not keep lab/prod logs forever without a purpose
