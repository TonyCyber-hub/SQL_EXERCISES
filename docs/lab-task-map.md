# Lab Task Map

## Exercise 1 — Security Logs, Authentication & Incident Investigation
1. Failed Login Investigation
2. Suspicious Source IPs
3. After-Hours Activity
4. Privileged Account Monitoring
5. Brute-Force Detection
6. Geographic Login Review
7. Disabled Account Activity
8. Recent Security Events
9. Top Attack Sources
10. Analyst Investigation Summary

All queries are in `sql/exercise-1/solutions.sql`, in the same order.

## Exercise 2 — Threat Hunting, Network Monitoring & Incident Analysis
1. Malware Alert Analysis
2. Critical Hosts
3. Suspicious Network Connections
4. High-Volume Data Transfer
5. Threat Intelligence Matching
6. Incident Frequency by Type
7. Mean Time to Respond / resolution duration
8. Repeat Offenders
9. Employee Security Risk
10. Prioritize the Investigation Queue

All queries are in `sql/exercise-2/solutions.sql`, in the same order.

## Implementation notes
- The PDFs allow reasonable table/column assumptions where unspecified.
- Exercise 2 calls its threat-matching source `network_events`; the setup provides a view over `network_connections`.
- Task 4 uses 1,073,741,824 bytes as the >1 GB threshold. Use 1,000,000,000 if your course expects decimal GB.
- Resolution duration is only calculable for incidents with non-NULL `resolved_at`.
- Queries may validly return empty sets depending on the dataset.
