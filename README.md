# SQL for Cybersecurity Analysts

Beginner–intermediate MySQL/MariaDB practice lab for authentication analysis, security-event monitoring, threat hunting, network monitoring, incident investigation, and SOC reporting.

## Source lab
- Exercise 1 — Security Logs, Authentication & Incident Investigation (10 tasks)
- Exercise 2 — Threat Hunting, Network Monitoring & Incident Analysis (10 tasks)

The supplied PDFs are questions-only and allow reasonable table/column names where unspecified. This repository keeps example solutions separate from the task mapping.

## Requirements
- MySQL 8.x or compatible MariaDB
- `mysql` or `mariadb` command-line client
- Linux terminal for shell commands and evidence management
- A database account permitted to create tables/databases

## Quick start
1. Review `docs/lab-task-map.md` and `docs/schema-notes.md`.
2. Create synthetic practice data:

   ```bash
   mysql -u root -p < scripts/setup_lab.sql
   ```

   This drops and recreates `cybersecurity_lab`. **Back up any existing database with that name first.**
3. Run the exercise queries:

   ```bash
   mysql -u root -p cybersecurity_lab < sql/exercise-1/solutions.sql
   mysql -u root -p cybersecurity_lab < sql/exercise-2/solutions.sql
   ```

4. Capture your own screenshots using `screenshots/README.md` and complete `EVIDENCE_CHECKLIST.md`.

## Project structure
See the folder tree in the project and README files inside important folders.

## Safety and authenticity
All included data is synthetic. No screenshots are fabricated and no tasks are claimed completed. Empty evidence folders contain `.gitkeep` placeholders. Do not commit real logs, credentials, personal information, or confidential incident details to a public repository.

## GitHub workflow
```bash
git init
git add .
git status
git commit -m "Add SQL cybersecurity analyst lab"
```

Review staged files before pushing.
