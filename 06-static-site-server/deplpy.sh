#!/bin/bash
# deploy.sh - Sync local static site to remote server

REMOTE_USER="user"
REMOTE_HOST="47.129.174.107"
REMOTE_PATH="/var/www/html"

rsync -avz --delete ./site/ ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}
echo "✅ Deployment completed! Visit http://${REMOTE_HOST}/"
