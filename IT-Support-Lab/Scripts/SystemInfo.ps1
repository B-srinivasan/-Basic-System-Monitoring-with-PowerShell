# Collect System Info
$sysInfo = @{
    'ComputerName' = $env:COMPUTERNAME
    'UserName'     = $env:USERNAME
    'OS Version'   = (Get-CimInstance win32_operatingsystem).Caption
    'CPU'          = (Get-CimInstance Win32_Processor).Name
    'RAM (GB)'     = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    'Disk Free Space (C:)' = [math]::Round((Get-PSDrive C).Free / 1GB, 2)
    'IP Address'   = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notmatch "Loopback"}).IPAddress
    'DateTime'     = Get-Date
}

# Save Report to CSV
$csvPath = "C:\IT-Support-Lab\Reports\SystemReport_$($env:COMPUTERNAME)_$(Get-Date -Format yyyyMMdd_HHmmss).csv"
$sysInfo | ConvertTo-Csv -NoTypeInformation | Out-File $csvPath

# Convert hashtable to a custom object
$obj = New-Object PSObject -Property $sysInfo

# Save only clean system info to CSV
$obj | Export-Csv -NoTypeInformation -Path $csvPath

# Path to the log file
$logPath = "C:\IT-Support-Lab\Logs\monitor-log.txt"

# Try to collect info
try {
    # Your main monitoring code here...
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "$timestamp : System info collected successfully."
} catch {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "$timestamp : ERROR - $_"
}


# Log Success Message
Write-Host "System Report saved to: $csvPath"

Write-Host "Press any key to exit..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

