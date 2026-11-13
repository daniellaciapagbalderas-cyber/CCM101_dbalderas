sudo tee /usr/local/bin/backup_db.sh > /dev/null << 'EOF'
#!/usr/bin/env bash
# backup_db.sh - Automated DB volume backup with rotation (Disaster Recovery)
set -euo pipefail

DB_VOLUME="${DB_VOLUME:-enterprise-stack_db_data}"
BACKUP_DIR="${BACKUP_DIR:-/var/backups/db}"
LOG_FILE="${LOG_FILE:-/var/log/db_backup.log}"
RETENTION_DAYS="${RETENTION_DAYS:-7}"
LOCK_FILE="/tmp/backup_db.lock"

TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
BACKUP_FILE="${BACKUP_DIR}/db_backup_${TIMESTAMP}.tar.gz"

log()  { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
fail() { log "ERROR: $*"; rm -f "$BACKUP_FILE"; exit 1; }

# Prevent overlapping runs
exec 200>"$LOCK_FILE"
flock -n 200 || { echo "Another backup is already running."; exit 1; }

mkdir -p "$BACKUP_DIR"
touch "$LOG_FILE"
log "=== Backup started ==="

# 1. Create backup (volume mounted read-only)
docker volume inspect "$DB_VOLUME" >/dev/null 2>&1 || fail "Docker volume '$DB_VOLUME' not found"
docker run --rm -v "${DB_VOLUME}":/source:ro -v "${BACKUP_DIR}":/backup \
    alpine tar czf "/backup/$(basename "$BACKUP_FILE")" -C /source . \
    || fail "Backup failed"

# 2. Verify integrity + checksum
tar tzf "$BACKUP_FILE" >/dev/null 2>&1 || fail "Archive failed integrity check"
( cd "$BACKUP_DIR" && sha256sum "$(basename "$BACKUP_FILE")" > "$(basename "$BACKUP_FILE").sha256" )
log "Backup OK: $BACKUP_FILE ($(du -h "$BACKUP_FILE" | cut -f1))"

# 3. Rotate old backups
DELETED="$(find "$BACKUP_DIR" -name 'db_backup_*' -type f -mtime +"$RETENTION_DAYS" -print -delete | wc -l)"
log "Rotation: removed ${DELETED} file(s) older than ${RETENTION_DAYS} days"
log "=== Backup finished successfully ==="
EOF

# Make executable
sudo chmod +x /usr/local/bin/backup_db.sh

# Install cron job (daily at 2:00 AM, no duplicates)
( sudo crontab -l 2>/dev/null | grep -vF "/usr/local/bin/backup_db.sh" || true
  echo "0 2 * * * /usr/local/bin/backup_db.sh >> /var/log/db_backup_cron.log 2>&1" ) | sudo crontab -

# Test run + verify
sudo /usr/local/bin/backup_db.sh
echo "---- VERIFY ----"
ls -l /usr/local/bin/backup_db.sh
sudo crontab -l
ls -l /var/backups/db/
tail -n 5 /var/log/db_backup.log
