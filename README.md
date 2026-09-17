# SRE & Production Support Automation Scripts

Bash scripts built for real-world SRE and production support scenarios — covering log analysis, system resource monitoring, and service/API health checks. Developed based on hands-on experience supporting enterprise CPaaS platforms (WhatsApp, RCS, Voice, SMS) at scale.

---

## 📁 Log Analysis

### `log_parser.sh`
Parses production log files to identify and count ERROR patterns.
- Extracts ERROR lines using `grep` and `awk`
- Reports total error count and hourly breakdown
- **Use case:** First script to run during a P1 incident to identify failure patterns

### `whatsapp_delivery_failurereport.sh`
Analyzes WhatsApp delivery logs and reports failure reasons by channel.
- Filters FAILED deliveries and groups by failure reason (TIMEOUT, INVALID_NUMBER, etc.)
- Uses `grep`, `awk`, `sort`, and `uniq -c` pipeline
- **Use case:** Post-incident RCA — identify which failure type caused the most impact

---

## 📊 System Monitoring

### `diskfreealert.sh`
Monitors root filesystem disk usage and alerts based on configurable thresholds.
- NORMAL / WARNING (>80%) / CRITICAL (>90%) classification
- Uses `df` and `awk` for real-time calculation
- **Use case:** Proactive alerting before disk-full causes service outage

### `cpumemorycheck.sh`
Monitors CPU and memory usage against configurable thresholds.
- CPU extracted from `top -bn1`, memory calculated from `free`
- Alerts when either metric exceeds the defined threshold
- **Use case:** Quick system health check during high-latency or degraded-service incidents

---

## 🔍 Service & API Health Checks

### `multiservicecheck.sh`
Checks running status of multiple critical services in one pass.
- Loops over a configurable list of services (nginx, mysql, rabbitmq, etc.)
- Uses `systemctl is-active` for accurate status reporting
- Reports RUNNING or DOWN per service
- **Use case:** First check after a server restart or during an incident triage

### `apicheckscript.sh`
Monitors HTTP API endpoint health by validating status codes in real time.
- Reports UP (200), DOWN (404), or SERVER ERROR (500)
- Uses `curl` for endpoint validation
- **Use case:** Continuous API health monitoring, webhook validation during client onboarding

---

## 🛠️ Tech Stack
- Bash Scripting
- Linux CLI: `grep`, `awk`, `sed`, `cut`, `sort`, `uniq`, `df`, `free`, `top`, `ps`, `curl`
- `systemctl` for service management
- Git & GitHub for version control

---

## 👤 Author
**Kiran Raykar**  
Senior Technical Support Engineer | SRE Enthusiast  
3.5+ years supporting enterprise CPaaS platforms at Route Mobile Limited  
[LinkedIn](https://linkedin.com/in/kiran-raykar) | [GitHub](https://github.com/kiranraykar2016)
