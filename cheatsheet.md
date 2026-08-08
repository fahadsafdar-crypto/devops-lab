cd ~/devops-lab
git add notes.txt cheatsheet.md
git commit -m "Week 2: networking basics and site-down checklist"
git push origin main

ip a | show interfaces/IPs | identify host address
ping | reachability check | is host reachable
ss -tuln | listening ports | is service bound to a port
curl -I | HTTP status/headers | is web app responding
