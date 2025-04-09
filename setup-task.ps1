# setup-task.ps1

$scriptPath = "$env:USERPROFILE\watchdog.ps1"
$taskName = "GitBlockerWatchdog"

# Delete old task if exists
schtasks /Delete /TN $taskName /F > $null 2>&1

# Create new task to run every 10 minutes
schtasks /Create /SC MINUTE /MO 10 /TN $taskName /TR "powershell.exe -NoProfile -WindowStyle Hidden -File `"$scriptPath`"" /RL HIGHEST /F
