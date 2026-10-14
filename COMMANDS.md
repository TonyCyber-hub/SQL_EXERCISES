# Commands Reference

## Check client version
```bash
mysql --version
mariadb --version
```

## Create/reset the practice database
Run from Linux terminal:
```bash
mysql -u root -p < scripts/setup_lab.sql
```
The script drops and recreates `cybersecurity_lab`; back up an existing database first.

## Open the SQL client
```bash
mysql -u root -p
# or
mariadb -u root -p
```

## Inspect database and schema
```sql
SHOW DATABASES;
USE cybersecurity_lab;
SHOW TABLES;
DESCRIBE authentication_logs;
SELECT * FROM users LIMIT 10;
```

## Run an exercise query file
```bash
mysql -u root -p cybersecurity_lab < sql/exercise-1/solutions.sql
mysql -u root -p cybersecurity_lab < sql/exercise-2/solutions.sql
```
Or from inside the SQL prompt:
```sql
SOURCE /absolute/path/to/sql-cybersecurity-analyst-lab/sql/exercise-1/solutions.sql;
```
Replace the example path with the actual location.

## Record an interactive session with tee
Inside MySQL/MariaDB:
```sql
tee /tmp/cybersecurity-exercise-1.txt;
```
Run your queries, then stop logging:
```sql
notee;
```
From Linux:
```bash
cat /tmp/cybersecurity-exercise-1.txt
cp /tmp/cybersecurity-exercise-1.txt ~/cybersecurity-exercise-1.txt
```
`tee` records session output; reusable query source should be saved in `.sql` files.

## Export a database backup
Run from Linux:
```bash
mysqldump -u root -p cybersecurity_lab > backup/cybersecurity_lab.sql
```
Or use `mariadb-dump` if installed. Treat dumps as potentially sensitive; they are ignored by Git by default.

## Git basics
```bash
git init
git status
git add .
git commit -m "Add SQL cybersecurity analyst lab"
```
