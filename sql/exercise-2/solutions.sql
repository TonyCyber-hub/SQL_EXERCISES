USE cybersecurity_lab;

-- Task 1: Malware Alert Analysis
SELECT hostname, malware_name, severity, detection_time
FROM malware_alerts WHERE detection_status = 'CONFIRMED';

-- Task 2: Critical Hosts
SELECT hostname, COUNT(*) AS critical_alerts FROM malware_alerts
WHERE severity = 'CRITICAL' GROUP BY hostname HAVING COUNT(*) >= 3;

-- Task 3: Suspicious Network Connections
SELECT * FROM network_connections WHERE destination_port IN (4444,1337,31337);

-- Task 4: High-Volume Data Transfer (>1 GB using 1,073,741,824 bytes)
SELECT hostname, destination_ip, bytes_out FROM network_connections
WHERE bytes_out > 1073741824;

-- Task 5: Threat Intelligence Matching
SELECT ne.*, ti.threat_type, ti.threat_level, ti.source AS intel_source
FROM network_events ne JOIN threat_intel ti
ON ne.source_ip = ti.ip_address OR ne.destination_ip = ti.ip_address;

-- Task 6: Incident Frequency by Type
SELECT incident_type, COUNT(*) AS incident_count FROM incidents
GROUP BY incident_type ORDER BY incident_count DESC;

-- Task 7: Response/resolution duration for resolved incidents
SELECT incident_id, incident_type, detected_at, resolved_at,
TIMESTAMPDIFF(MINUTE,detected_at,resolved_at) AS resolution_minutes
FROM incidents WHERE resolved_at IS NOT NULL;

-- Task 8: Repeat Offenders
SELECT source_ip, COUNT(*) AS incident_count FROM incidents
WHERE source_ip IS NOT NULL GROUP BY source_ip
HAVING COUNT(*) > 3 ORDER BY incident_count DESC;

-- Task 9: Employee Security Risk
SELECT e.employee_name, e.department, COUNT(i.incident_id) AS incident_count
FROM employees e JOIN incidents i ON i.username = e.username
GROUP BY e.employee_id,e.employee_name,e.department
HAVING COUNT(i.incident_id) >= 2 ORDER BY incident_count DESC;

-- Task 10: Prioritize the Investigation Queue
SELECT * FROM incidents WHERE status <> 'RESOLVED'
ORDER BY FIELD(severity,'CRITICAL','HIGH','MEDIUM','LOW'), detected_at DESC;
