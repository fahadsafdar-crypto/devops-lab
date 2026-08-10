#!/bin/bash

set -e


SRC="$HOME/devops-lab"
DEST="$HOME/devops-lab/backups"
STAMP=$(date +%F)
OUT="$DEST/devops-lab-backup-$STAMP.tar.gz"


mkdir -p "$DEST"

echo "Backing up $SRC -> $OUT"
tar -czf "$OUT" \
  --exclude="$DEST" \
  -C "$HOME" devops-lab

echo "Done."
ls -ls "$OUT"
exit 0
