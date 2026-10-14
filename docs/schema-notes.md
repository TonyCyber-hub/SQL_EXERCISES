# Schema Notes

The PDFs allow reasonable schema assumptions. This implementation uses:
- `users`: usernames, employee names, departments, account roles/status.
- `authentication_logs`: username, source IP, login timestamp, status, failure reason.
- `user_logins`: username, country, login timestamp, status.
- `security_events`: event type, severity, username, source IP, hostname, event timestamp, description.
- `malware_alerts`: hostname, malware name, severity, detection status/time.
- `network_connections`: host, source/destination IP, destination port, protocol, outbound bytes, timestamp.
- `network_events`: view over `network_connections`, named for Exercise 2's task wording.
- `threat_intel`: IP, threat type/level, source, first-seen timestamp.
- `incidents`: type/severity, source IP, username, description, detection/resolution timestamps, status.
- `employees`: employee name, username, department, job title.

All included records are synthetic. This schema is the project's implementation, not a claim that every field is prescribed by the PDFs.
