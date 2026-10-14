-- Synthetic practice database for both supplied exercises.
-- MySQL 8.x / MariaDB compatible. WARNING: drops/recreates cybersecurity_lab.
DROP DATABASE IF EXISTS cybersecurity_lab;
CREATE DATABASE cybersecurity_lab;
USE cybersecurity_lab;

CREATE TABLE users (
 user_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) NOT NULL UNIQUE,
 employee_name VARCHAR(100) NOT NULL, department VARCHAR(100),
 account_role ENUM('USER','ADMIN','PRIVILEGED') NOT NULL DEFAULT 'USER',
 account_status ENUM('ACTIVE','DISABLED','LOCKED') NOT NULL DEFAULT 'ACTIVE'
);
INSERT INTO users (username,employee_name,department,account_role,account_status) VALUES
('alice.johnson','Alice Johnson','Finance','USER','ACTIVE'),
('bob.smith','Bob Smith','IT','ADMIN','ACTIVE'),
('carol.williams','Carol Williams','HR','USER','ACTIVE'),
('david.brown','David Brown','Security','PRIVILEGED','ACTIVE'),
('emma.davis','Emma Davis','Finance','USER','ACTIVE'),
('frank.miller','Frank Miller','IT','ADMIN','ACTIVE'),
('grace.wilson','Grace Wilson','Sales','USER','ACTIVE'),
('henry.moore','Henry Moore','IT','PRIVILEGED','ACTIVE'),
('iris.taylor','Iris Taylor','Marketing','USER','DISABLED'),
('jack.anderson','Jack Anderson','Engineering','USER','ACTIVE');

CREATE TABLE authentication_logs (
 auth_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) NOT NULL,
 source_ip VARCHAR(45) NOT NULL, login_time DATETIME NOT NULL,
 status ENUM('SUCCESS','FAILED') NOT NULL, failure_reason VARCHAR(100),
 FOREIGN KEY (username) REFERENCES users(username)
);
INSERT INTO authentication_logs (username,source_ip,login_time,status,failure_reason) VALUES
('alice.johnson','10.10.1.20','2026-09-01 08:15:00','SUCCESS',NULL),
('bob.smith','10.10.1.30','2026-09-01 08:30:00','SUCCESS',NULL),
('carol.williams','10.10.1.40','2026-09-01 09:00:00','SUCCESS',NULL),
('alice.johnson','10.10.1.20','2026-09-01 22:45:00','SUCCESS',NULL),
('david.brown','10.10.1.50','2026-09-02 02:15:00','SUCCESS',NULL),
('bob.smith','10.10.1.30','2026-09-02 10:20:00','SUCCESS',NULL),
('david.brown','10.10.1.50','2026-09-02 11:00:00','SUCCESS',NULL),
('frank.miller','10.10.1.60','2026-09-02 14:30:00','SUCCESS',NULL),
('henry.moore','10.10.1.70','2026-09-02 16:10:00','SUCCESS',NULL),
('alice.johnson','185.220.101.10','2026-09-03 07:10:00','FAILED','INVALID_PASSWORD'),
('alice.johnson','185.220.101.10','2026-09-03 07:11:00','FAILED','INVALID_PASSWORD'),
('alice.johnson','185.220.101.10','2026-09-03 07:12:00','FAILED','INVALID_PASSWORD'),
('alice.johnson','185.220.101.10','2026-09-03 07:13:00','FAILED','INVALID_PASSWORD'),
('bob.smith','185.220.101.10','2026-09-03 07:14:00','FAILED','INVALID_PASSWORD'),
('bob.smith','185.220.101.10','2026-09-03 07:15:00','FAILED','INVALID_PASSWORD'),
('bob.smith','185.220.101.10','2026-09-03 07:16:00','FAILED','ACCOUNT_LOCKED'),
('carol.williams','45.77.21.9','2026-09-04 01:00:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:01:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:02:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:03:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:04:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:05:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:06:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:07:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:08:00','FAILED','INVALID_PASSWORD'),
('carol.williams','45.77.21.9','2026-09-04 01:09:00','FAILED','INVALID_PASSWORD'),
('iris.taylor','172.16.10.15','2026-09-05 12:00:00','FAILED','ACCOUNT_DISABLED'),
('iris.taylor','172.16.10.15','2026-09-05 12:05:00','FAILED','ACCOUNT_DISABLED'),
('emma.davis','10.10.1.80','2026-09-05 17:55:00','FAILED','INVALID_PASSWORD'),
('jack.anderson','10.10.1.90','2026-09-06 09:10:00','FAILED','MFA_FAILED');

CREATE TABLE user_logins (
 login_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) NOT NULL,
 country VARCHAR(80) NOT NULL, login_time DATETIME NOT NULL,
 status ENUM('SUCCESS','FAILED') NOT NULL, FOREIGN KEY (username) REFERENCES users(username)
);
INSERT INTO user_logins (username,country,login_time,status) VALUES
('alice.johnson','Nigeria','2026-09-01 08:15:00','SUCCESS'),
('alice.johnson','Ghana','2026-09-03 10:20:00','SUCCESS'),
('alice.johnson','United Kingdom','2026-09-05 14:00:00','SUCCESS'),
('alice.johnson','Nigeria','2026-09-06 08:00:00','SUCCESS'),
('bob.smith','Nigeria','2026-09-01 08:30:00','SUCCESS'),
('bob.smith','Ghana','2026-09-04 09:00:00','SUCCESS'),
('david.brown','Nigeria','2026-09-02 11:00:00','SUCCESS'),
('david.brown','United States','2026-09-04 15:30:00','SUCCESS'),
('david.brown','Germany','2026-09-06 17:00:00','SUCCESS'),
('carol.williams','Nigeria','2026-09-02 09:00:00','SUCCESS'),
('carol.williams','Nigeria','2026-09-03 09:00:00','FAILED');

CREATE TABLE security_events (
 event_id INT AUTO_INCREMENT PRIMARY KEY, event_type VARCHAR(100) NOT NULL,
 severity ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL, username VARCHAR(50),
 source_ip VARCHAR(45), hostname VARCHAR(100), event_time DATETIME NOT NULL,
 description VARCHAR(255), FOREIGN KEY (username) REFERENCES users(username)
);
INSERT INTO security_events (event_type,severity,username,source_ip,hostname,event_time,description) VALUES
('FAILED_LOGIN','MEDIUM','alice.johnson','185.220.101.10','FIN-PC-01','2026-09-03 07:10:00','Repeated failed authentication'),
('BRUTE_FORCE','HIGH','carol.williams','45.77.21.9','HR-PC-02','2026-09-04 01:10:00','Multiple failed login attempts'),
('MALWARE_DETECTED','CRITICAL','jack.anderson','10.10.1.90','ENG-PC-05','2026-09-05 13:20:00','Confirmed malware detection'),
('DATA_EXFILTRATION','CRITICAL','david.brown','10.10.1.50','SEC-SRV-01','2026-09-05 18:00:00','Large outbound transfer'),
('SUSPICIOUS_LOGIN','HIGH','alice.johnson','203.0.113.15','FIN-PC-01','2026-09-05 22:45:00','After-hours login'),
('PORT_SCAN','MEDIUM',NULL,'45.77.21.9','FW-01','2026-09-06 02:00:00','Port scanning activity'),
('MALWARE_DETECTED','CRITICAL','emma.davis','10.10.1.80','FIN-PC-04','2026-09-06 08:30:00','Confirmed malware detection'),
('PRIVILEGE_ESCALATION','HIGH','henry.moore','10.10.1.70','IT-SRV-02','2026-09-06 10:00:00','Unexpected privilege escalation'),
('POLICY_VIOLATION','LOW','grace.wilson','10.10.1.100','SALES-PC-01','2026-09-06 11:00:00','Non-critical policy violation'),
('FAILED_LOGIN','MEDIUM','bob.smith','185.220.101.10','IT-PC-01','2026-09-06 12:00:00','Repeated failed authentication'),
('DATA_EXFILTRATION','CRITICAL','jack.anderson','10.10.1.90','ENG-PC-05','2026-09-06 16:00:00','Large outbound transfer'),
('BRUTE_FORCE','HIGH','carol.williams','45.77.21.9','HR-PC-02','2026-09-06 20:00:00','Repeated authentication failures'),
('PORT_SCAN','HIGH',NULL,'198.51.100.40','FW-01','2026-09-07 01:00:00','Suspicious port scanning'),
('BRUTE_FORCE','HIGH',NULL,'198.51.100.41','VPN-01','2026-09-07 02:00:00','Repeated authentication failures');

CREATE TABLE malware_alerts (
 alert_id INT AUTO_INCREMENT PRIMARY KEY, hostname VARCHAR(100) NOT NULL,
 malware_name VARCHAR(150) NOT NULL, severity ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL,
 detection_status ENUM('SUSPECTED','CONFIRMED','CLEARED') NOT NULL, detection_time DATETIME NOT NULL
);
INSERT INTO malware_alerts (hostname,malware_name,severity,detection_status,detection_time) VALUES
('ENG-PC-05','Trojan.Generic','CRITICAL','CONFIRMED','2026-09-05 13:20:00'),
('FIN-PC-04','Ransomware.Locky','CRITICAL','CONFIRMED','2026-09-06 08:30:00'),
('IT-PC-03','Backdoor.Agent','CRITICAL','CONFIRMED','2026-09-06 09:00:00'),
('IT-PC-03','CredentialStealer.X','CRITICAL','CONFIRMED','2026-09-06 09:30:00'),
('HR-PC-02','Adware.Generic','MEDIUM','SUSPECTED','2026-09-06 10:00:00'),
('SALES-PC-01','PUA.Tool','LOW','CLEARED','2026-09-06 11:00:00'),
('IT-PC-03','Keylogger.Agent','CRITICAL','CONFIRMED','2026-09-06 10:00:00');

CREATE TABLE network_connections (
 connection_id INT AUTO_INCREMENT PRIMARY KEY, hostname VARCHAR(100) NOT NULL,
 source_ip VARCHAR(45) NOT NULL, destination_ip VARCHAR(45) NOT NULL,
 destination_port INT NOT NULL, protocol VARCHAR(20) NOT NULL,
 bytes_out BIGINT NOT NULL, connection_time DATETIME NOT NULL
);
INSERT INTO network_connections (hostname,source_ip,destination_ip,destination_port,protocol,bytes_out,connection_time) VALUES
('ENG-PC-05','10.10.1.90','198.51.100.20',4444,'TCP',500000,'2026-09-05 13:25:00'),
('IT-PC-03','10.10.1.110','198.51.100.30',1337,'TCP',1200000,'2026-09-06 09:40:00'),
('FIN-PC-04','10.10.1.80','203.0.113.50',31337,'TCP',2500000000,'2026-09-06 08:45:00'),
('FIN-PC-01','10.10.1.20','8.8.8.8',443,'TCP',1500000,'2026-09-06 10:00:00'),
('HR-PC-02','10.10.1.40','1.1.1.1',53,'UDP',5000,'2026-09-06 10:10:00');
CREATE VIEW network_events AS
SELECT connection_id AS network_event_id,hostname,source_ip,destination_ip,destination_port,protocol,bytes_out,connection_time AS event_time
FROM network_connections;

CREATE TABLE threat_intel (
 intel_id INT AUTO_INCREMENT PRIMARY KEY, ip_address VARCHAR(45) NOT NULL UNIQUE,
 threat_type VARCHAR(100), threat_level ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL,
 source VARCHAR(100), first_seen DATETIME
);
INSERT INTO threat_intel (ip_address,threat_type,threat_level,source,first_seen) VALUES
('185.220.101.10','BRUTE_FORCE_SOURCE','HIGH','Internal SOC Feed','2026-09-03 07:00:00'),
('45.77.21.9','ATTACKER_IP','CRITICAL','Threat Intelligence Feed','2026-09-04 00:50:00'),
('198.51.100.20','COMMAND_AND_CONTROL','CRITICAL','Threat Intelligence Feed','2026-09-05 13:00:00'),
('203.0.113.50','SUSPICIOUS_DESTINATION','HIGH','Threat Intelligence Feed','2026-09-06 08:00:00');

CREATE TABLE incidents (
 incident_id INT AUTO_INCREMENT PRIMARY KEY,
 incident_type ENUM('PHISHING','MALWARE','BRUTE_FORCE','DATA_EXFILTRATION','UNAUTHORIZED_ACCESS','OTHER') NOT NULL,
 severity ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL,
 source_ip VARCHAR(45), username VARCHAR(50), description VARCHAR(255),
 detected_at DATETIME NOT NULL, resolved_at DATETIME NULL,
 status ENUM('OPEN','IN_PROGRESS','RESOLVED') NOT NULL DEFAULT 'OPEN',
 FOREIGN KEY (username) REFERENCES users(username)
);
INSERT INTO incidents (incident_type,severity,source_ip,username,description,detected_at,resolved_at,status) VALUES
('BRUTE_FORCE','HIGH','45.77.21.9','carol.williams','Repeated failed login attempts against HR account','2026-09-04 01:10:00','2026-09-04 03:30:00','RESOLVED'),
('MALWARE','CRITICAL','10.10.1.90','jack.anderson','Confirmed malware infection on engineering host','2026-09-05 13:20:00',NULL,'IN_PROGRESS'),
('DATA_EXFILTRATION','CRITICAL','10.10.1.90','jack.anderson','Large outbound data transfer detected','2026-09-06 16:00:00',NULL,'OPEN'),
('PHISHING','MEDIUM','203.0.113.15','alice.johnson','Suspicious email link reported by employee','2026-09-05 14:00:00','2026-09-05 16:00:00','RESOLVED'),
('UNAUTHORIZED_ACCESS','HIGH','203.0.113.15','alice.johnson','After-hours login from unusual source','2026-09-05 22:45:00',NULL,'OPEN'),
('MALWARE','CRITICAL','10.10.1.80','emma.davis','Confirmed ransomware detection','2026-09-06 08:30:00',NULL,'IN_PROGRESS'),
('BRUTE_FORCE','HIGH','185.220.101.10','bob.smith','Repeated failed login attempts against admin account','2026-09-06 12:00:00',NULL,'OPEN'),
('MALWARE','CRITICAL','10.10.1.110','henry.moore','Backdoor and credential stealer alerts','2026-09-06 09:00:00','2026-09-06 12:30:00','RESOLVED'),
('DATA_EXFILTRATION','HIGH','10.10.1.50','david.brown','Suspicious outbound transfer','2026-09-05 18:00:00',NULL,'OPEN'),
('PHISHING','LOW','192.0.2.10','grace.wilson','Suspicious email reported','2026-09-06 11:00:00','2026-09-06 13:00:00','RESOLVED'),
('BRUTE_FORCE','HIGH','45.77.21.9','bob.smith','Repeated attempts against administrator','2026-09-07 03:00:00',NULL,'OPEN'),
('UNAUTHORIZED_ACCESS','HIGH','45.77.21.9','david.brown','Repeated suspicious access attempt','2026-09-07 04:00:00',NULL,'OPEN'),
('PHISHING','MEDIUM','45.77.21.9','alice.johnson','Phishing report associated with same source','2026-09-07 05:00:00','2026-09-07 06:00:00','RESOLVED');

CREATE TABLE employees (
 employee_id INT AUTO_INCREMENT PRIMARY KEY, employee_name VARCHAR(100) NOT NULL,
 username VARCHAR(50) NOT NULL UNIQUE, department VARCHAR(100), job_title VARCHAR(100),
 FOREIGN KEY (username) REFERENCES users(username)
);
INSERT INTO employees (employee_name,username,department,job_title) VALUES
('Alice Johnson','alice.johnson','Finance','Financial Analyst'),
('Bob Smith','bob.smith','IT','IT Administrator'),
('Carol Williams','carol.williams','HR','HR Officer'),
('David Brown','david.brown','Security','Security Engineer'),
('Emma Davis','emma.davis','Finance','Accountant'),
('Frank Miller','frank.miller','IT','Systems Administrator'),
('Grace Wilson','grace.wilson','Sales','Sales Executive'),
('Henry Moore','henry.moore','IT','Security Administrator'),
('Iris Taylor','iris.taylor','Marketing','Marketing Officer'),
('Jack Anderson','jack.anderson','Engineering','Software Engineer');
