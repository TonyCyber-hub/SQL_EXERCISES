USE cybersecurity_lab;

-- Task 1: Failed Login Investigation
SELECT username, source_ip, login_time, failure_reason
FROM authentication_logs WHERE status = 'FAILED';

-- Task 2: Suspicious Source IPs
SELECT source_ip, COUNT(*) AS failed_attempts
FROM authentication_logs WHERE status = 'FAILED'
GROUP BY source_ip HAVING COUNT(*) > 5 ORDER BY failed_attempts DESC;

-- Task 3: After-Hours Activity (normal hours 08:00–18:00)
SELECT username, source_ip, login_time
FROM authentication_logs
WHERE status = 'SUCCESS'
  AND (TIME(login_time) < '08:00:00' OR TIME(login_time) >= '18:00:00');

-- Task 4: Privileged Account Monitoring
SELECT a.username, a.source_ip, a.login_time
FROM authentication_logs a JOIN users u ON u.username = a.username
WHERE a.status = 'SUCCESS' AND u.account_role IN ('ADMIN','PRIVILEGED');

-- Task 5: Brute-Force Detection
SELECT username, COUNT(*) AS failed_attempts
FROM authentication_logs WHERE status = 'FAILED'
GROUP BY username HAVING COUNT(*) >= 10
ORDER BY failed_attempts DESC;

-- Task 6: Geographic Login Review
SELECT username, COUNT(DISTINCT country) AS country_count
FROM user_logins WHERE status = 'SUCCESS'
GROUP BY username HAVING COUNT(DISTINCT country) > 2;

-- Task 7: Disabled Account Activity
SELECT a.username, a.source_ip, a.login_time AS attempt_time, a.status AS login_result
FROM authentication_logs a JOIN users u ON u.username = a.username
WHERE u.account_status = 'DISABLED';

-- Task 8: Recent Security Events
SELECT * FROM security_events
WHERE severity IN ('HIGH','CRITICAL') ORDER BY event_time DESC;

-- Task 9: Top Attack Sources (up to 10)
SELECT source_ip, COUNT(*) AS event_count
FROM security_events WHERE source_ip IS NOT NULL
GROUP BY source_ip ORDER BY event_count DESC LIMIT 10;

-- Task 10: Analyst Investigation Summary
SELECT severity, COUNT(*) AS event_count FROM security_events
GROUP BY severity ORDER BY FIELD(severity,'LOW','MEDIUM','HIGH','CRITICAL');
