cd ~/devops-lab
git add notes.txt cheatsheet.md
git commit -m "Week 2: networking basics and site-down checklist"
git push origin main

ip a | show interfaces/IPs | identify host address
ping | reachability check | is host reachable
ss -tuln | listening ports | is service bound to a port
curl -I | HTTP status/headers | is web app responding


ssh-keygen -t ed25519 -C "engr.fs100@gmail.com" -f ~/.ssh/id_ed25519
  → create key pair

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
  → correct permissions

cat ~/.ssh/id_ed25519.pub
  → copy public key to GitHub Settings → SSH keys

ssh -T git@github.com
  → test GitHub SSH login

git remote set-url origin git@github.com:USER/REPO.git
  → switch repo to SSH

git push origin main
  → upload commits (may ask key passphrase)
