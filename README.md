# -Basic-System-Monitoring-with-PowerShell
Mini Project - A PowerShell-based system monitoring tool to automate daily health checks. Script collects hardware and OS information and exports reports to CSV. Scheduled with Task Scheduler for daily execution.

# 🖥️ IT Infrastructure Monitoring (Mini Project)

This project simulates a basic IT Infrastructure Support task: **automated system health monitoring using PowerShell**.

## 📌 Features

- Collects system info: CPU, RAM, Disk, IP, OS, User
- Stores reports as CSV (Excel-friendly)
- Generates logs for success/failure
- Can be scheduled with Windows Task Scheduler

## 📁 Folder Structure

IT-Support-Lab/
│
├── Scripts/
│   └── monitor.ps1               ← Your PowerShell monitoring script
│
├── Reports/
│   └── (Sample CSV files)        ← Example output from your script
│
├── Logs/
    └── monitor-log.txt           ← Sample log output
