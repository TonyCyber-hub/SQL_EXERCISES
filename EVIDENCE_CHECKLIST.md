# Evidence Checklist

Capture your own screenshots as you perform the tasks. This project contains no fabricated screenshots.

## Setup
- [ ] `00-environment-version.png` — client version in Linux terminal.
- [ ] `01-database-tables.png` — `USE cybersecurity_lab;` and `SHOW TABLES;`.
- [ ] `02-schema-authentication-logs.png` — `DESCRIBE authentication_logs;`.

## Exercise 1 — Security Logs, Authentication & Incident Investigation
- [ ] `ex1-01-failed-login-investigation.png` — username, source IP, timestamp, failure reason for failed logins.
- [ ] `ex1-02-suspicious-source-ips.png` — IPs with more than five failed attempts.
- [ ] `ex1-03-after-hours-activity.png` — successful logins outside 08:00–18:00.
- [ ] `ex1-04-privileged-account-monitoring.png` — successful ADMIN/PRIVILEGED logins.
- [ ] `ex1-05-brute-force-detection.png` — usernames with at least ten failed attempts, descending.
- [ ] `ex1-06-geographic-login-review.png` — successful logins from more than two countries.
- [ ] `ex1-07-disabled-account-activity.png` — attempts using disabled accounts.
- [ ] `ex1-08-recent-security-events.png` — HIGH/CRITICAL events newest first.
- [ ] `ex1-09-top-attack-sources.png` — up to ten source IPs ranked by event count.
- [ ] `ex1-10-analyst-investigation-summary.png` — events grouped by severity.

## Exercise 2 — Threat Hunting, Network Monitoring & Incident Analysis
- [ ] `ex2-01-malware-alert-analysis.png` — confirmed malware alerts.
- [ ] `ex2-02-critical-hosts.png` — hosts with at least three CRITICAL alerts.
- [ ] `ex2-03-suspicious-network-connections.png` — ports 4444, 1337, or 31337.
- [ ] `ex2-04-high-volume-data-transfer.png` — single outbound connections above 1 GB.
- [ ] `ex2-05-threat-intelligence-matching.png` — network events matching threat-intel IPs.
- [ ] `ex2-06-incident-frequency-by-type.png` — incident counts by type, highest first.
- [ ] `ex2-07-incident-response-time.png` — resolution duration for resolved incidents.
- [ ] `ex2-08-repeat-offenders.png` — IPs appearing in more than three incidents.
- [ ] `ex2-09-employee-security-risk.png` — employees associated with at least two incidents.
- [ ] `ex2-10-investigation-queue.png` — unresolved incidents prioritized by severity and time.

## Final repository
- [ ] `final-git-status.png` — `git status` before commit/push.
- [ ] `github-repository.png` — repository page after upload, if applicable.

Only tick items after capturing evidence. Keep query and output readable. Never expose passwords, tokens, or real sensitive logs. Empty results should be explained honestly, not edited away.
