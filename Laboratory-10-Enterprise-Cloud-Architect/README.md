# Laboratory-10-Enterprise-Cloud-Architect

> One-line description: a containerized service stack deployed with Docker Compose, with automated backups, hardened security, and a documented recovery process.

---

## Table of Contents

1. [Overview](#overview)
2. [Repository Content](#repository-content)
3. [Deploy](#deploy)
4. [Secure](#secure)
5. [Maintain](#maintain)
6. [Recovery](#recovery)

---

## Overview

This project provides a reproducible, self-hosted deployment of **[your application / stack name]** using Docker Compose. It is designed so that anyone can:

- **Deploy** the full stack with a single command
- **Secure** it using sensible hardening defaults
- **Maintain** it with routine, documented procedures
- **Recover** it from failure using automated backups

**Stack:** Docker, Docker Compose, [e.g. Nginx, PostgreSQL, application container]
**Target environment:** Linux server (Ubuntu/Debian recommended)

---

## Repository Content

```
.
├── docker-compose.yml        # Service definitions (the deployment blueprint)
├── backup.sh                 # Automated backup script
├── .env.example              # Template for environment variables
├── docs/
│   └── OPERATIONAL_MANUAL.md # Day-to-day operating procedures
├── FINAL_REFLECTION.md       # Lessons learned and project review
└── README.md                 # This file
```

### `docker-compose.yml` — Meaning

This file is the **blueprint of the entire system**. It declares, in one place, what runs, how it connects, and where data lives. Instead of manually starting each container, Compose reads this file and builds the whole environment consistently.

| Element | Meaning |
|---|---|
| `services` | Each container that makes up the system (e.g. web, app, database). |
| `image` / `build` | Which image a service runs, or the Dockerfile used to build it. |
| `ports` | Which container ports are exposed to the host. Expose only what is necessary. |
| `volumes` | Persistent storage so data survives container restarts and rebuilds. |
| `networks` | Private networks that let services talk to each other while staying isolated from the outside. |
| `environment` / `env_file` | Configuration and secrets passed to containers (kept in `.env`, never committed). |
| `depends_on` | Start-order between services. |
| `restart` | Restart policy (e.g. `unless-stopped`) so services recover automatically after a crash or reboot. |
| `healthcheck` | A test that tells Docker whether a service is actually working, not just running. |

### `backup.sh`

A shell script that protects the system's data. It typically:

1. Dumps the database and/or archives the persistent volumes
2. Names the backup with a timestamp (e.g. `backup-2026-11-13.tar.gz`)
3. Stores it in a backup directory (ideally off the server as well)
4. Deletes backups older than the retention period (e.g. 7 days)
5. Logs success or failure

Run manually:

```bash
chmod +x backup.sh
./backup.sh
```

Schedule daily at 2:00 AM with cron:

```bash
0 2 * * * /path/to/backup.sh >> /var/log/backup.log 2>&1
```

### Operational Manual

Located at `docs/OPERATIONAL_MANUAL.md`. It is the runbook for whoever operates the system. It covers starting and stopping services, checking logs and health, routine tasks, troubleshooting common problems, and who to contact or what to do in an incident.

### Final Reflection

Located at `FINAL_REFLECTION.md`. A written review of the project: what was built, what worked, what went wrong, what was learned, and what would be improved next time.

---

## Deploy

### Prerequisites

- Linux host with **Docker** and **Docker Compose** installed
- Git
- A user with permission to run Docker

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>

# 2. Create your environment file
cp .env.example .env
nano .env            # set passwords, ports, and other values

# 3. Start the stack in the background
docker compose up -d

# 4. Verify everything is running
docker compose ps
docker compose logs -f
```

Access the application at: `http://<server-ip>:<port>`

To stop the stack:

```bash
docker compose down
```

---

## Secure

Apply these measures before exposing the system to real users.

- **Secrets:** Store credentials in `.env`, never in `docker-compose.yml`. Add `.env` to `.gitignore`.
- **Strong passwords:** Replace every default password and rotate them periodically.
- **Minimal ports:** Publish only the ports that must be public. Keep databases on the internal Docker network only.
- **Firewall:** Allow only required ports (e.g. SSH, 80, 443).
  ```bash
  sudo ufw default deny incoming
  sudo ufw allow 22/tcp
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw enable
  ```
- **HTTPS:** Put a reverse proxy (e.g. Nginx, Traefik, Caddy) in front with a TLS certificate.
- **Least privilege:** Run containers as non-root users where possible; avoid `privileged: true`.
- **Pinned images:** Use specific image versions instead of `latest`.
- **SSH hardening:** Use key-based login and disable password authentication.
- **Backup protection:** Restrict permissions on backup files (`chmod 600`) and consider encrypting them.

---

## Maintain

| Task | Command / Action | Frequency |
|---|---|---|
| Check container status | `docker compose ps` | Daily |
| Review logs | `docker compose logs --tail=100` | Daily |
| Confirm backup ran | Check `/var/log/backup.log` and backup folder | Daily |
| Update images | `docker compose pull && docker compose up -d` | Monthly |
| Apply OS updates | `sudo apt update && sudo apt upgrade` | Monthly |
| Clean unused Docker data | `docker system prune` | Monthly |
| Check disk space | `df -h` | Weekly |
| Rotate passwords/secrets | Update `.env`, then `docker compose up -d` | Quarterly |
| Test a restore | Follow the Recovery steps on a test machine | Quarterly |

See `docs/OPERATIONAL_MANUAL.md` for full procedures and troubleshooting.

---

## Recovery

A backup is only useful if it can be restored. Follow this process after data loss, corruption, or server failure.

### 1. Prepare a clean environment

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
cp .env.example .env     # restore your original .env values
```

### 2. Stop any running services

```bash
docker compose down
```

### 3. Restore data from backup

```bash
# Example: restore volume data from an archive
tar -xzf /path/to/backup-YYYY-MM-DD.tar.gz -C /path/to/restore/location

# Example: restore a PostgreSQL dump
docker compose up -d db
cat backup.sql | docker compose exec -T db psql -U <user> <database>
```

### 4. Start the full stack

```bash
docker compose up -d
```

### 5. Verify

- All containers are `Up` / `healthy`: `docker compose ps`
- The application loads and data is present
- Logs show no errors: `docker compose logs`

### Recovery objectives

- **RPO (max data loss):** up to 24 hours with daily backups
- **RTO (target time to restore):** [e.g. under 1 hour]

---

