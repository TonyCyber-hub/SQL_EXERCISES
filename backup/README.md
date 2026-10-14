# Backups

Optional location for local database exports. Create one from Linux with:
```bash
mysqldump -u root -p cybersecurity_lab > backup/cybersecurity_lab.sql
```
Backups may contain sensitive data. SQL dump files are ignored by Git by default. This folder is empty in the starter project.
