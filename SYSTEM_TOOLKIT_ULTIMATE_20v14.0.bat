@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Define colors
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "GREEN=%ESC%[92m"
set "BLUE=%ESC%[94m"
set "RESET=%ESC%[0m"

:: Auto-elevate (keep your existing code)
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo ============================================
    echo   Requesting Administrator Privileges...
    echo ============================================
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
cscript //nologo "%temp%\getadmin.vbs" >nul
del "%temp%\getadmin.vbs" 2>nul
exit /b

:gotAdmin
if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" 2>nul
CD /D "%~dp0"
title *SIRUS08254 SYSTEM TOOLKIT ULTIMATE v14.0* (Admin)

:MAIN_MENU
cls
echo %BLUE%
echo     ╔══════════════════════════════════════════════╗
echo     ║                                              ║
echo     ║         *SYSTEM TOOLKIT ULTIMATE v14.0*      ║
echo     ║            RUNNING AS ADMINISTRATOR          ║
echo     ║                                              ║
echo     ╠,.¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸.,╣
echo     ║                                              ║
echo     ║                                              ║
echo     ║ %GREEN%[1] SCANS ------------------------------ [1]%BLUE% ║
echo     ║ %GREEN%[2] NETWORK ---------------------------- [2]%BLUE% ║
echo     ║ %GREEN%[3] HARDWARE SERIALS ------------------- [3]%BLUE% ║
echo     ║ %GREEN%[4] SYSTEM ----------------------------- [4]%BLUE% ║
echo     ║ %GREEN%[5] SECURITY --------------------------- [5]%BLUE% ║
echo     ║ %GREEN%[6] MAINTENANCE ------------------------ [6]%BLUE% ║
echo     ║ %GREEN%[7] POWER ------------------------------ [7]%BLUE% ║
echo     ║ %GREEN%[8] TOOLS ------------------------------ [8]%BLUE% ║
echo     ║                                              ║
echo     ║ %GREEN%[0] Exit%BLUE%                                     ║
echo     ║                                              ║
echo     ╚▫▪.,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,.▪▫╝%RESET%
echo.

set "choice="
set /p "choice=Select section (0-8): "
if "%choice%"=="1" goto SCAN_MENU
if "%choice%"=="2" goto NETWORK_MENU
if "%choice%"=="3" goto HARDWARE_MENU
if "%choice%"=="4" goto SYSTEM_MENU
if "%choice%"=="5" goto SECURITY_MENU
if "%choice%"=="6" goto MAINTENANCE_MENU
if "%choice%"=="7" goto POWER_MENU
if "%choice%"=="8" goto TOOLS_MENU
if "%choice%"=="0" goto EXIT
echo Invalid selection. Press any key to continue...
pause >nul
goto MAIN_MENU

:: =========================
:: SCANS MENU (Submenu)
:: =========================
:SCAN_MENU
cls
echo ============================================
echo        SCANS SECTION
echo ============================================
echo.
echo   [1] MRT Scan (Malware Removal Tool)
echo   [2] Windows Defender Quick Scan
echo   [3] Windows Defender Full Scan
echo   [4] System File Checker (SFC)
echo   [5] DISM Health Check
echo   [6] Check Disk Health
echo   [7] Performance Monitor Report
echo.
echo   [0] Back to Main Menu
echo.

set "scanopt="
set /p scanopt="Select option (0-7): "
if "%scanopt%"=="1" goto MRT_SCAN
if "%scanopt%"=="2" goto DEFENDER_QUICK
if "%scanopt%"=="3" goto DEFENDER_FULL
if "%scanopt%"=="4" goto SFC_SCAN
if "%scanopt%"=="5" goto DISM_CHECK
if "%scanopt%"=="6" goto DISK_HEALTH
if "%scanopt%"=="7" goto PERFMON_REPORT
if "%scanopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto SCAN_MENU

:: =========================
:: NETWORK MENU (Submenu)
:: =========================
:NETWORK_MENU
cls
echo ============================================
echo        NETWORK SECTION
echo ============================================
echo.
echo   [1] Network Connections
echo   [2] DNS Cache
echo   [3] Flush DNS Cache
echo   [4] IP Configuration
echo   [5] Ping Test
echo   [6] Traceroute
echo   [7] WiFi Passwords
echo   [8] Network Shares
echo   [9] ARP Table
echo  [10] Routing Table
echo  [11] Network Adapters (MAC Addresses)
echo  [12] Network Speed Test
echo  [13] Reset TCP/IP Stack
echo  [14] Pathping Diagnostic
echo.
echo  [0] Back to Main Menu
echo.

set "netopt="
set /p netopt="Select option (0-14): "
if "%netopt%"=="1" goto NETSTAT_CHECK
if "%netopt%"=="2" goto DNS_CACHE
if "%netopt%"=="3" goto FLUSH_DNS
if "%netopt%"=="4" goto IP_CONFIG
if "%netopt%"=="5" goto PING_TEST
if "%netopt%"=="6" goto TRACEROUTE
if "%netopt%"=="7" goto WIFI_PASSWORDS
if "%netopt%"=="8" goto NETWORK_SHARES
if "%netopt%"=="9" goto ARP_TABLE
if "%netopt%"=="10" goto ROUTING_TABLE
if "%netopt%"=="11" goto NETWORK_ADAPTERS
if "%netopt%"=="12" goto SPEED_TEST
if "%netopt%"=="13" goto TCP_IP_RESET
if "%netopt%"=="14" goto PATHPING_DIAGNOSTIC
if "%netopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto NETWORK_MENU

:: =========================
:: HARDWARE MENU (Submenu)
:: =========================
:HARDWARE_MENU
cls
echo ============================================
echo      HARDWARE SERIALS SECTION
echo ============================================
echo.
echo   [1] Motherboard ^& CPU Serial Numbers
echo   [2] BIOS Information
echo   [3] Network Adapters Details
echo   [4] Disk Drive Serials
echo   [5] Full Hardware Report
echo.
echo   [0] Back to Main Menu
echo.

set "hwopt="
set /p hwopt="Select option (0-5): "
if "%hwopt%"=="1" goto HARDWARE_SERIALS
if "%hwopt%"=="2" goto BIOS_INFO
if "%hwopt%"=="3" goto NETWORK_ADAPTERS
if "%hwopt%"=="4" goto DISK_SERIALS
if "%hwopt%"=="5" goto FULL_HARDWARE_REPORT
if "%hwopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto HARDWARE_MENU

:: =========================
:: SYSTEM MENU (Submenu)
:: =========================
:SYSTEM_MENU
cls
echo ============================================
echo        SYSTEM SECTION
echo ============================================
echo.
echo   [1] Processes and Services
echo   [2] System Information
echo   [3] User Accounts
echo   [4] Startup Programs
echo   [5] Installed Programs
echo   [6] Disk Space
echo   [7] Environment Variables
echo   [8] Driver List
echo   [9] Scheduled Tasks
echo  [10] Running Services
echo  [11] CPU Information
echo  [12] RAM Information
echo  [13] GPU Information
echo  [14] System Benchmark
echo  [15] Windows Activation Status
echo  [16] Bluetooth Devices
echo  [17] Printer Management
echo  [18] Motherboard Information
echo  [19] Power Efficiency Report
echo  [20] Full Driver Export
echo.
echo  [0] Back to Main Menu
echo.

set "sysopt="
set /p sysopt="Select option (0-20): "
if "%sysopt%"=="1" goto PROCESS_LIST
if "%sysopt%"=="2" goto SYSTEM_INFO
if "%sysopt%"=="3" goto USER_ACCOUNTS
if "%sysopt%"=="4" goto STARTUP_PROGRAMS
if "%sysopt%"=="5" goto INSTALLED_PROGRAMS
if "%sysopt%"=="6" goto DISK_SPACE
if "%sysopt%"=="7" goto ENV_VARIABLES
if "%sysopt%"=="8" goto DRIVER_LIST
if "%sysopt%"=="9" goto SCHEDULED_TASKS
if "%sysopt%"=="10" goto RUNNING_SERVICES
if "%sysopt%"=="11" goto CPU_INFO
if "%sysopt%"=="12" goto RAM_INFO
if "%sysopt%"=="13" goto GPU_INFO
if "%sysopt%"=="14" goto SYSTEM_BENCHMARK
if "%sysopt%"=="15" goto ACTIVATION_STATUS
if "%sysopt%"=="16" goto BLUETOOTH_DEVICES
if "%sysopt%"=="17" goto PRINTER_MANAGEMENT
if "%sysopt%"=="18" goto MOTHERBOARD_INFO
if "%sysopt%"=="19" goto POWER_EFFICIENCY
if "%sysopt%"=="20" goto FULL_DRIVER_EXPORT
if "%sysopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto SYSTEM_MENU

:: =========================
:: SECURITY MENU (Submenu)
:: =========================
:SECURITY_MENU
cls
echo ============================================
echo       SECURITY SECTION
echo ============================================
echo.
echo   [1] Firewall Status
echo   [2] Check Open Ports
echo   [3] Recent Security Events
echo   [4] Failed Login Attempts
echo   [5] USB Device History
echo   [6] Password Policy
echo   [7] Audit Policy
echo   [8] Local Security Policy
echo   [9] Antivirus Status
echo  [10] BitLocker Status
echo  [11] Malware Quarantine Viewer
echo  [12] Remote Desktop Settings
echo  [13] Toggle Defender Real-Time Protection
echo.
echo  [0] Back to Main Menu
echo.

set "secopt="
set /p secopt="Select option (0-13): "
if "%secopt%"=="1" goto FIREWALL_STATUS
if "%secopt%"=="2" goto OPEN_PORTS
if "%secopt%"=="3" goto SECURITY_EVENTS
if "%secopt%"=="4" goto FAILED_LOGINS
if "%secopt%"=="5" goto USB_HISTORY
if "%secopt%"=="6" goto PASSWORD_POLICY
if "%secopt%"=="7" goto AUDIT_POLICY
if "%secopt%"=="8" goto LOCAL_SECURITY
if "%secopt%"=="9" goto ANTIVIRUS_STATUS
if "%secopt%"=="10" goto BITLOCKER_STATUS
if "%secopt%"=="11" goto QUARANTINE_VIEWER
if "%secopt%"=="12" goto REMOTE_DESKTOP
if "%secopt%"=="13" goto TOGGLE_DEFENDER
if "%secopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto SECURITY_MENU

:: =========================
:: MAINTENANCE MENU (Submenu)
:: =========================
:MAINTENANCE_MENU
cls
echo ============================================
echo       MAINTENANCE SECTION
echo ============================================
echo.
echo   [1] Clear Temp Files
echo   [2] Clear DNS Cache
echo   [3] Clear Recycle Bin
echo   [4] Disk Cleanup (Automated)
echo   [5] Defragment Drive
echo   [6] Windows Updates
echo   [7] Restore Points
echo   [8] Create Restore Point
echo   [9] Backup Scheduler
echo  [10] Log Rotation Manager
echo.
echo   [0] Back to Main Menu
echo.

set "maintopt="
set /p maintopt="Select option (0-10): "
if "%maintopt%"=="1" goto CLEAR_TEMP
if "%maintopt%"=="2" goto FLUSH_DNS
if "%maintopt%"=="3" goto CLEAR_RECYCLE
if "%maintopt%"=="4" goto DISK_CLEANUP_AUTO
if "%maintopt%"=="5" goto DEFRAG
if "%maintopt%"=="6" goto WINDOWS_UPDATES
if "%maintopt%"=="7" goto RESTORE_POINTS
if "%maintopt%"=="8" goto CREATE_RESTORE
if "%maintopt%"=="9" goto BACKUP_SCHEDULER
if "%maintopt%"=="10" goto LOG_ROTATION
if "%maintopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto MAINTENANCE_MENU

:: =========================
:: POWER MENU (Submenu)
:: =========================
:POWER_MENU
cls
echo ============================================
echo         POWER SECTION
echo ============================================
echo.
echo   [1] Battery Health Report
echo   [2] Power Configuration List
echo   [3] Sleep Settings
echo  [4] Power Plan Switcher
echo.
echo   [0] Back to Main Menu
echo.

set "powopt="
set /p powopt="Select option (0-4): "
if "%powopt%"=="1" goto BATTERY_HEALTH
if "%powopt%"=="2" goto POWER_CONFIG_LIST
if "%powopt%"=="3" goto SLEEP_SETTINGS
if "%powopt%"=="4" goto SWITCH_POWER_PLAN
if "%powopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto POWER_MENU

:: =========================
:: TOOLS MENU (Submenu)
:: =========================
:TOOLS_MENU
cls
echo ============================================
echo          TOOLS SECTION
echo ============================================
echo.
echo   [1] Run All Checks
echo   [2] Export Results
echo   [3] Open Task Manager
echo   [4] Open Event Viewer
echo   [5] Open Device Manager
echo   [6] Open Control Panel
echo   [7] Open System Properties
echo   [8] Open Network Connections
echo   [9] Open Windows Firewall
echo  [10] Open Programs and Features
echo  [11] Open Disk Management
echo  [12] Open Services
echo  [13] Open Registry Editor
echo  [14] Open Group Policy Editor
echo  [15] Open Computer Management
echo  [16] Open Resource Monitor
echo  [17] Open Performance Monitor
echo  [18] Hosts File Editor
echo  [19] Registry Backup Tool
echo  [20] Full System Report Generator
echo  [21] Command Prompt
echo  [22] PowerShell
echo  [23] Windows Terminal
echo  [24] Check Pending Reboot
echo.
echo  [0] Back to Main Menu
echo.

set "toolopt="
set /p toolopt="Select option (0-24): "
if "%toolopt%"=="1" goto ALL_CHECKS
if "%toolopt%"=="2" goto EXPORT_RESULTS
if "%toolopt%"=="3" goto TASK_MANAGER
if "%toolopt%"=="4" goto EVENT_VIEWER
if "%toolopt%"=="5" goto DEVICE_MANAGER
if "%toolopt%"=="6" goto CONTROL_PANEL
if "%toolopt%"=="7" goto SYSTEM_PROPERTIES
if "%toolopt%"=="8" goto NETWORK_CONNECTIONS
if "%toolopt%"=="9" goto WINDOWS_FIREWALL
if "%toolopt%"=="10" goto PROGRAMS_FEATURES
if "%toolopt%"=="11" goto DISK_MANAGEMENT
if "%toolopt%"=="12" goto SERVICES
if "%toolopt%"=="13" goto REGISTRY_EDITOR
if "%toolopt%"=="14" goto GROUP_POLICY
if "%toolopt%"=="15" goto COMPUTER_MANAGEMENT
if "%toolopt%"=="16" goto RESOURCE_MONITOR
if "%toolopt%"=="17" goto PERFORMANCE_MONITOR
if "%toolopt%"=="18" goto HOSTS_EDITOR
if "%toolopt%"=="19" goto REGISTRY_BACKUP
if "%toolopt%"=="20" goto FULL_SYSTEM_REPORT
if "%toolopt%"=="21" goto CMD_PROMPT
if "%toolopt%"=="22" goto POWERSHELL
if "%toolopt%"=="23" goto TERMINAL
if "%toolopt%"=="24" goto CHECK_PENDING_REBOOT
if "%toolopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto TOOLS_MENU

:: =========================
:: SCANS SECTION (Keep as is)
:: =========================
:MRT_SCAN
cls
echo ============================================
echo        RUNNING MRT MALWARE SCAN
echo ============================================
echo.
echo Starting Microsoft Malicious Software Removal Tool...
echo.
mrt
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:DEFENDER_QUICK
cls
echo ============================================
echo        WINDOWS DEFENDER QUICK SCAN
echo ============================================
echo.
echo Starting Windows Defender Quick Scan...
echo This may take several minutes...
echo.
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo.
echo Quick scan complete!
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:DEFENDER_FULL
cls
echo ============================================
echo        WINDOWS DEFENDER FULL SCAN
echo ============================================
echo.
echo WARNING: A full scan can take 1-3 hours!
echo.
set "confirm="
set /p confirm="Start Full Scan? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Starting Windows Defender Full Scan...
    echo You can continue using your computer...
    "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
    echo.
    echo Full scan complete!
) else (
    echo Scan cancelled.
)
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:SFC_SCAN
cls
echo ============================================
echo        SYSTEM FILE CHECKER (SFC)
echo ============================================
echo.
echo This scan checks for corrupted Windows files.
echo It may take 10-15 minutes to complete.
echo.
set "confirm="
set /p confirm="Start SFC scan? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Running System File Checker...
    echo.
    sfc /scannow
    echo.
    echo SFC scan complete!
) else (
    echo Scan cancelled.
)
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:DISM_CHECK
cls
echo ============================================
echo        DISM HEALTH CHECK
echo ============================================
echo.
echo This tool repairs the Windows image.
echo.
echo [1] Check Health (Quick)
echo [2] Scan Health (Medium)
echo [3] Restore Health (Full - Requires Internet)
echo [4] Cancel
echo.
set "dismoption="
set /p dismoption="Select option (1-4): "
if "%dismoption%"=="1" (
    echo.
    echo Checking health...
    DISM /Online /Cleanup-Image /CheckHealth
) else if "%dismoption%"=="2" (
    echo.
    echo Scanning health (this may take a while^)...
    DISM /Online /Cleanup-Image /ScanHealth
) else if "%dismoption%"=="3" (
    echo.
    echo Restoring health (this may take a long time^)...
    DISM /Online /Cleanup-Image /RestoreHealth
) else (
    echo Cancelled.
)
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:DISK_HEALTH
cls
echo ============================================
echo        CHECK DISK HEALTH
echo ============================================
echo.
echo Checking disk health status...
echo.
echo === DISK DRIVES ===
powershell -command "Get-CimInstance -ClassName Win32_DiskDrive | Format-Table Status,Model,Size,MediaType,InterfaceType -AutoSize"
echo.
echo === DISK PARTITIONS ===
powershell -command "Get-CimInstance -ClassName Win32_DiskPartition | Format-Table Name,Size,Type -AutoSize"
echo.
echo === CHECKING FOR ERRORS ===
echo.
for /f "skip=1 tokens=1" %%d in ('wmic logicaldisk where "drivetype=3" get deviceid') do chkdsk %%d /scan
echo.
echo Disk health check complete!
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:: =========================
:: PERFORMANCE MONITOR REPORT (NEW)
:: =========================
:PERFMON_REPORT
cls
echo ============================================
echo        PERFORMANCE MONITOR REPORT
echo ============================================
echo.
echo Generating detailed system health report...
echo This will automatically detect hardware, software, and performance issues.
echo Report will be saved to: %TEMP%\perfmon_report.html
echo.
set "confirm="
set /p confirm="Generate Performance Report? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Running perfmon /report...
    start "" perfmon /report >nul
    timeout /t 30 /nobreak >nul
    if exist "%TEMP%\perfmon_report.html" (
        echo Report generated successfully!
        echo Opening report in browser...
        start "" "%TEMP%\perfmon_report.html"
    ) else (
        echo Report generation may still be in progress.
        echo Please check %TEMP%\perfmon_report.html manually.
    )
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to scans menu...
pause >nul
goto SCAN_MENU

:: =========================
:: NETWORK SECTION (Keep as is)
:: =========================
:NETSTAT_CHECK
cls
echo ============================================
echo        CHECKING NETWORK CONNECTIONS
echo ============================================
echo.
echo All active connections:
echo.
netstat -ano
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:DNS_CACHE
cls
echo ============================================
echo        DNS CACHE ENTRIES
echo ============================================
echo.
ipconfig /displaydns
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:FLUSH_DNS
cls
echo ============================================
echo        FLUSH DNS CACHE
echo ============================================
echo.
echo Flushing DNS cache...
ipconfig /flushdns
echo.
echo DNS cache cleared!
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:IP_CONFIG
cls
echo ============================================
echo        IP CONFIGURATION
echo ============================================
echo.
ipconfig /all
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:PING_TEST
cls
echo ============================================
echo        PING TEST
echo ============================================
echo.
echo Common targets:
echo   google.com - General internet
echo   8.8.8.8 - Google DNS
echo   1.1.1.1 - Cloudflare DNS
echo   Your router IP - Local network
echo.
set "target="
set /p target="Enter address to ping (default=google.com): "
if "!target!"=="" set target=google.com
set "target=!target:&=!"
set "target=!target:|=!"
set "target=!target:>=!"
set "target=!target:<=!"
echo.
echo Pinging !target!...
echo.
ping !target!
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:TRACEROUTE
cls
echo ============================================
echo        TRACEROUTE
echo ============================================
echo.
set "target="
set /p target="Enter address to trace (default=google.com): "
if "!target!"=="" set target=google.com
set "target=!target:&=!"
set "target=!target:|=!"
set "target=!target:>=!"
set "target=!target:<=!"
echo.
echo Tracing route to !target!...
echo This may take a few minutes...
echo.
tracert !target!
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:WIFI_PASSWORDS
cls
echo ============================================
echo        SAVED WIFI PASSWORDS
echo ============================================
echo.
echo Listing all saved WiFi networks and passwords...
echo.
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "Profile"') do (
    set "ssid=%%a"
    call :SHOW_WIFI_PASS
)
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:SHOW_WIFI_PASS
set "ssid=!ssid:~1!"
for /f "tokens=* delims= " %%s in ("!ssid!") do set "ssid=%%s"
echo ============================================
echo Network: !ssid!
netsh wlan show profile name="!ssid!" key=clear 2>nul | findstr "Key Content"
if errorlevel 1 echo   (no password stored or open network)
echo.
goto :eof

:NETWORK_SHARES
cls
echo ============================================
echo        NETWORK SHARES
echo ============================================
echo.
echo === LOCAL SHARES ===
net share
echo.
echo === MAPPED DRIVES ===
net use
echo.
echo === CONNECTED SESSIONS ===
net session 2>nul
if errorlevel 1 echo No active sessions.
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:ARP_TABLE
cls
echo ============================================
echo        ARP TABLE
echo ============================================
echo.
echo Devices on your local network:
echo.
arp -a
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:ROUTING_TABLE
cls
echo ============================================
echo        ROUTING TABLE
echo ============================================
echo.
route print
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:NETWORK_ADAPTERS
cls
echo ============================================
echo        NETWORK ADAPTER DETAILS (MAC ADDRESSES)
echo ============================================
echo.
:: Show all active network adapters with MAC addresses
echo === ALL ACTIVE NETWORK ADAPTERS WITH MAC ADDRESSES ===
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Where-Object {$_.NetConnectionStatus -eq 1} | Format-Table Name,MACAddress,Manufacturer,Speed,NetConnectionStatus -AutoSize"
echo.
:: Show IP configuration with MAC addresses
echo === IP CONFIGURATION WITH MAC ADDRESSES ===
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | Format-List Description,MACAddress,IPAddress,DHCPEnabled"
echo.
echo [1] Show All Adapters (including disabled)
echo [2] Export MAC Addresses to File
echo [3] Copy Active MAC Address to Clipboard
echo [4] Return to Network Menu
echo.
set "netopt="
set /p netopt="Select option (1-4): "
if "%netopt%"=="1" (
    cls
    echo === ALL NETWORK ADAPTERS (including disabled) ===
    powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Format-Table Name,MACAddress,Manufacturer,Speed,NetConnectionStatus,Description -AutoSize"
) else if "%netopt%"=="2" (
    cls
    echo === EXPORTING MAC ADDRESSES ===
    set "exportfile="
    set /p exportfile="Enter filename to save: "
    if "!exportfile!"=="" set exportfile=mac_addresses.txt
    
    powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Select-Object Name,MACAddress,Manufacturer,Speed,NetConnectionStatus | Export-Csv '%TEMP%\!exportfile!' -NoTypeInformation"
    explorer /select,"%TEMP%\!exportfile!"
) else if "%netopt%"=="3" (
    cls
    echo === COPYING MAC ADDRESSES TO CLIPBOARD ===
    powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Where-Object {$_.NetConnectionStatus -eq 1} | Select-Object Name,MACAddress | Format-Table -AutoSize | Out-String | Set-Clipboard; Write-Host 'MAC addresses copied to clipboard!' -ForegroundColor Green"
) else (
    goto NETWORK_MENU
)
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:SPEED_TEST
cls
echo ============================================
echo        NETWORK SPEED TEST
echo ============================================
echo.
echo [1] Quick Latency Test (Ping multiple servers)
echo [2] Download Speed Test (Small file - 1MB)
echo [3] Download Speed Test (Large file - 10MB)
echo [4] Full Network Diagnostics
echo [5] Test DNS Response Time
echo [6] Cancel
echo.
set "speedopt="
set /p speedopt="Select option (1-6): "
if "%speedopt%"=="1" (
    echo.
    echo Testing latency to multiple servers...
    echo.
    echo --- Google DNS ---
    ping -n 4 8.8.8.8
    echo.
    echo --- Cloudflare DNS ---
    ping -n 4 1.1.1.1
    echo.
    echo --- Microsoft ---
    ping -n 4 microsoft.com
    echo.
    echo --- Amazon AWS ---
    ping -n 4 aws.amazon.com
    echo.
    echo Latency test complete!
) else if "%speedopt%"=="2" (
    echo.
    echo Testing download speed with small file...
    echo.
    powershell -NoProfile -command "$start = Get-Date; $wc = New-Object System.Net.WebClient; $wc.DownloadFile('http://speedtest.tele2.net/1MB.zip', (Join-Path $env:TEMP 'speedtest.tmp')); $end = Get-Date; $time = ($end - $start).TotalSeconds; $speed = [math]::Round(1 / $time, 2); Write-Host ('Downloaded 1MB in {0} seconds' -f $time); Write-Host ('Approximate speed: {0} MB/s' -f $speed); Remove-Item (Join-Path $env:TEMP 'speedtest.tmp') -ErrorAction SilentlyContinue"
    echo.
    echo Download test complete!
) else if "%speedopt%"=="3" (
    echo.
    echo Testing download speed with large file...
    echo This may take a minute...
    echo.
    powershell -NoProfile -command "$start = Get-Date; $wc = New-Object System.Net.WebClient; $wc.DownloadFile('http://speedtest.tele2.net/10MB.zip', (Join-Path $env:TEMP 'speedtest.tmp')); $end = Get-Date; $time = ($end - $start).TotalSeconds; $speed = [math]::Round(10 / $time, 2); Write-Host ('Downloaded 10MB in {0} seconds' -f $time); Write-Host ('Approximate speed: {0} MB/s' -f $speed); Remove-Item (Join-Path $env:TEMP 'speedtest.tmp') -ErrorAction SilentlyContinue"
    echo.
    echo Download test complete!
) else if "%speedopt%"=="4" (
    echo.
    echo Running full network diagnostics...
    echo.
    echo --- Network Adapter Status ---
    powershell -command "Get-NetAdapter | Format-Table Name,Status,LinkSpeed -AutoSize"
    echo.
    echo --- Current Connection ---
    powershell -command "Get-NetConnectionProfile | Format-List Name,NetworkCategory,IPv4Connectivity,IPv6Connectivity"
    echo.
    echo --- TCP Connections ---
    netstat -e
    echo.
    echo Network diagnostics complete!
) else if "%speedopt%"=="5" (
    echo.
    echo Testing DNS response times...
    echo.
    echo --- Google DNS (8.8.8.8) ---
    powershell -command "$time = Measure-Command { Resolve-DnsName google.com -Server 8.8.8.8 }; Write-Host ('Response time: {0} ms' -f $time.TotalMilliseconds)"
    echo.
    echo --- Cloudflare DNS (1.1.1.1) ---
    powershell -command "$time = Measure-Command { Resolve-DnsName google.com -Server 1.1.1.1 }; Write-Host ('Response time: {0} ms' -f $time.TotalMilliseconds)"
    echo.
    echo --- Default DNS ---
    powershell -command "$time = Measure-Command { Resolve-DnsName google.com }; Write-Host ('Response time: {0} ms' -f $time.TotalMilliseconds)"
    echo.
    echo DNS test complete!
) else (
    goto NETWORK_MENU
)
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:: =========================
:: TCP/IP RESET (NEW)
:: =========================
:TCP_IP_RESET
cls
echo ============================================
echo        RESET TCP/IP STACK
echo ============================================
echo.
echo WARNING: This will reset your network stack!
echo You may need to restart after this operation.
echo.
set "confirm="
set /p confirm="Continue with TCP/IP Reset? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Flushing and resetting TCP/IP stack...
    netsh int ip reset
    ipconfig /release >nul 2>&1
    ipconfig /renew >nul 2>&1
    echo.
    echo TCP/IP Reset complete!
    echo Please restart your computer for changes to take effect.
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:: =========================
:: PATHPING DIAGNOSTIC (NEW)
:: =========================
:PATHPING_DIAGNOSTIC
cls
echo ============================================
echo        PATHPING DIAGNOSTIC
echo ============================================
echo.
echo Combines ping and traceroute for better diagnostics...
echo.
set "target="
set /p target="Enter address to test (default=google.com): "
if "!target!"=="" set target=google.com
set "target=!target:&=!"
set "target=!target:|=!"
set "target=!target:>=!"
set "target=!target:<=!"
echo.
echo Running pathping !target!...
echo This may take several minutes...
echo.
pathping !target!
echo.
echo Press any key to return to network menu...
pause >nul
goto NETWORK_MENU

:: =========================
:: HARDWARE SERIALS SECTION (Keep as is)
:: =========================
:HARDWARE_SERIALS
cls
echo ============================================
echo    HARDWARE SERIAL NUMBERS ^& IDs
echo ============================================
echo.
:: Motherboard Information
echo === MOTHERBOARD INFORMATION ===
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer,Product,Version,SerialNumber"
echo.
:: BIOS Serial Number
echo === BIOS SERIAL NUMBER ===
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | Select-Object Manufacturer,Name,Version,SerialNumber"
echo.
:: Processor Information ^& ID (Escaped Ampersand)
echo === PROCESSOR INFORMATION ^& ID ===
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name,Manufacturer,ProcessorId,Cores,Threads,MaxClockSpeed"
echo.
:: System Serial Number (if available)
echo === SYSTEM SERIAL NUMBER (IF AVAILABLE) ===
powershell -NoProfile -Command "Get-CimInstance Win32_ComputerSystem | Select-Object SerialNumber"
echo.
echo [1] Export All Hardware IDs to File
echo [2] Copy System Serial Number to Clipboard
echo [3] Return to Main Menu
echo.
set "hwopt="
set /p hwopt="Select option (1-3): "
if "%hwopt%"=="1" (
    cls
    echo === EXPORTING HARDWARE INFORMATION ===
    set "hwfile="
    set /p hwfile="Enter filename: "
    if "!hwfile!"=="" set hwfile=hardware_ids.txt
    
    powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer,Product,Version,SerialNumber; Get-CimInstance Win32_BIOS | Select-Object Manufacturer,Name,Version,SerialNumber; Get-CimInstance Win32_Processor | Select-Object Name,Manufacturer,ProcessorId,Cores,Threads,MaxClockSpeed; Get-CimInstance Win32_ComputerSystem | Select-Object SerialNumber" > "%TEMP%\!hwfile!"
    explorer /select,"%TEMP%\!hwfile!"
) else if "%hwopt%"=="2" (
    cls
    echo === COPYING SYSTEM SERIAL NUMBER ===
    powershell -NoProfile -Command "(Get-CimInstance Win32_ComputerSystem).SerialNumber | Set-Clipboard; Write-Host 'Serial Number copied to clipboard!' -ForegroundColor Green"
) else (
    goto HARDWARE_MENU
)
echo.
echo Press any key to return to hardware menu...
pause >nul
goto HARDWARE_MENU

:BIOS_INFO
cls
echo ============================================
echo        BIOS INFORMATION
echo ============================================
echo.
echo === BIOS DETAILS ===
powershell -command "Get-CimInstance Win32_BIOS | Format-List Manufacturer,Name,Version,ReleaseDate,SMBIOSBIOSVersion"
echo.
echo [1] Show BIOS Serial Number (if available)
echo [2] Export to File
echo [3] Return to Hardware Menu
echo.
set "biopt="
set /p biopt="Select option (1-3): "
if "%biopt%"=="1" (
    cls
    echo === BIOS SERIAL NUMBER ===
    powershell -command "Get-CimInstance Win32_BIOS | Select-Object SerialNumber,Manufacturer,Name"
) else if "%biopt%"=="2" (
    cls
    echo === EXPORTING BIOS INFORMATION ===
    set "biosfile="
    set /p biosfile="Enter filename: "
    if "!biosfile!"=="" set biosfile=biostxt.txt
    
    powershell -command "Get-CimInstance Win32_BIOS | Export-CSV '%TEMP%\!biosfile!' -NoTypeInformation"
    explorer /select,"%TEMP%\!biosfile!"
) else (
    goto HARDWARE_MENU
)
echo.
echo Press any key to return to hardware menu...
pause >nul
goto HARDWARE_MENU

:: =========================
:: DISK SERIALS (NEW)
:: =========================
:DISK_SERIALS
cls
echo ============================================
echo        DISK DRIVE SERIAL NUMBERS
echo ============================================
echo.
echo Retrieving full disk serial numbers...
echo.
echo === ALL DISK DRIVES WITH SERIALIZERS ===
powershell -NoProfile -Command "Get-WmiObject Win32_DiskDrive | Select-Object Model,SerialNumber,Size,InterfaceType,DeviceID | Format-Table -AutoSize"
echo.
echo [1] Export Disk Serial Numbers to File
echo [2] Copy All Serials to Clipboard
echo [3] Return to Hardware Menu
echo.
set "diskopt="
set /p diskopt="Select option (1-3): "
if "%diskopt%"=="1" (
    cls
    echo === EXPORTING DISK SERIAL NUMBERS ===
    set "diskfile="
    set /p diskfile="Enter filename: "
    if "!diskfile!"=="" set diskfile=disk_serials.txt
    
    powershell -NoProfile -Command "Get-WmiObject Win32_DiskDrive | Select-Object Model,SerialNumber,Size,InterfaceType,DeviceID" > "%TEMP%\!diskfile!"
    explorer /select,"%TEMP%\!diskfile!"
) else if "%diskopt%"=="2" (
    cls
    echo === COPYING DISK SERIAL NUMBERS TO CLIPBOARD ===
    powershell -NoProfile -Command "Get-WmiObject Win32_DiskDrive | Select-Object Model,SerialNumber,Size | Out-String | Set-Clipboard; Write-Host 'Disk serial numbers copied to clipboard!' -ForegroundColor Green"
) else (
    goto HARDWARE_MENU
)
echo.
echo Press any key to return to hardware menu...
pause >nul
goto HARDWARE_MENU

:: =========================
:: FULL HARDWARE REPORT (NEW)
:: =========================
:FULL_HARDWARE_REPORT
cls
echo ============================================
echo        FULL HARDWARE INFORMATION REPORT
echo ============================================
echo.
set "hwreportfile="
set /p hwreportfile="Enter filename for report (default=full_hardware_report.txt): "
if "!hwreportfile!"=="" set hwreportfile=full_hardware_report.txt
cls
echo Generating comprehensive hardware report...
echo Report will be saved to: %TEMP%\!hwreportfile!
echo.
powershell -NoProfile -Command @"
Write-Output '=== HARDWARE INFORMATION REPORT ===' | Out-File '%TEMP%\\!hwreportfile!'
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output 'Generated: (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== SYSTEM ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_ComputerSystem | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== MOTHERBOARD ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_BaseBoard | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== BIOS ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_BIOS | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== PROCESSOR ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_Processor | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== MEMORY ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_PhysicalMemory | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== DISK DRIVES ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_DiskDrive | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!hwreportfile!' -Append
Write-Output '=== VIDEO CONTROLLERS ===' | Out-File '%TEMP%\\!hwreportfile!' -Append
Get-CimInstance Win32_VideoController | Format-List * | Out-File '%TEMP%\\!hwreportfile!' -Append
"@
echo.
echo Report generated successfully!
echo Opening report...
start "" "%TEMP%\!hwreportfile!"
pause >nul
goto HARDWARE_MENU

:: =========================
:: SYSTEM SECTION (Keep as is)
:: =========================
:PROCESS_LIST
cls
echo ============================================
echo        LISTING PROCESSES AND SERVICES
echo ============================================
echo.
echo [1] All processes
echo [2] Processes with services
echo [3] Processes by memory usage
echo [4] Processes by CPU usage
echo [5] Search for specific process
echo.
set "procoption="
set /p procoption="Select option (1-5): "
if "%procoption%"=="1" (
    tasklist
) else if "%procoption%"=="2" (
    tasklist /svc
) else if "%procoption%"=="3" (
    powershell -command "Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 20 Name,@{N='Memory(MB)';E={[math]::Round($_.WorkingSet64/1MB,2)}} | Format-Table -AutoSize"
) else if "%procoption%"=="4" (
    echo.
    echo Top processes by CPU (opening Resource Monitor^)...
    start resmon
) else if "%procoption%"=="5" (
    set "procname="
    set /p procname="Enter process name: "
    tasklist | findstr /i "!procname!"
)
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:SYSTEM_INFO
cls
echo ============================================
echo        GATHERING SYSTEM INFORMATION
echo ============================================
echo.
systeminfo
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:USER_ACCOUNTS
cls
echo ============================================
echo        VERIFYING USER ACCOUNTS
echo ============================================
echo.
echo === LOCAL USERS ===
net user
echo.
echo === ADMINISTRATOR ACCOUNTS ===
net localgroup administrators
echo.
echo === USER GROUPS ===
net localgroup
echo.
echo === CURRENT USER INFO ===
whoami /all
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:STARTUP_PROGRAMS
cls
echo ============================================
echo        STARTUP PROGRAMS
echo ============================================
echo.
echo === STARTUP LIST ===
powershell -command "Get-CimInstance -ClassName Win32_StartupCommand | Format-Table Caption,Command,Location -AutoSize"
echo.
echo === REGISTRY STARTUP (HKLM) ===
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" 2>nul
echo.
echo === REGISTRY STARTUP (HKCU) ===
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" 2>nul
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:INSTALLED_PROGRAMS
cls
echo ============================================
echo        INSTALLED PROGRAMS
echo ============================================
echo.
echo This may take a moment...
echo.
echo === INSTALLED APPLICATIONS ===
powershell -command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName,DisplayVersion,Publisher | Sort-Object DisplayName | Format-Table -AutoSize"
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:DISK_SPACE
cls
echo ============================================
echo        DISK SPACE USAGE
echo ============================================
echo.
echo === DISK OVERVIEW ===
powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table Name,@{N='Size(GB)';E={[math]::Round($_.Size/1GB,2)}},@{N='FreeSpace(GB)';E={[math]::Round($_.FreeSpace/1GB,2)}},FileSystem,Description -AutoSize"
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:ENV_VARIABLES
cls
echo ============================================
echo        ENVIRONMENT VARIABLES
echo ============================================
echo.
set
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:DRIVER_LIST
cls
echo ============================================
echo        INSTALLED DRIVERS
echo ============================================
echo.
echo === ALL DRIVERS ===
driverquery /fo table
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:SCHEDULED_TASKS
cls
echo ============================================
echo        SCHEDULED TASKS
echo ============================================
echo.
schtasks /query /fo table
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:RUNNING_SERVICES
cls
echo ============================================
echo        RUNNING SERVICES
echo ============================================
echo.
echo [1] All services
echo [2] Running services only
echo [3] Stopped services only
echo [4] Search for specific service
echo.
set "srvoption="
set /p srvoption="Select option (1-4): "

if "%srvoption%"=="1" (
    cls
    echo === ALL SERVICES ===
    sc query state= all
) else if "%srvoption%"=="2" (
    cls
    echo === RUNNING SERVICES ONLY ===
    sc query state= running
) else if "%srvoption%"=="3" (
    cls
    echo === STOPPED SERVICES ONLY ===
    sc query state= stopped
) else if "%srvoption%"=="4" (
    set "srvname="
    set /p srvname="Enter service name: "
    cls
    echo === SEARCHING FOR SERVICE: !srvname! ===
    sc query "!srvname!"
) else (
    goto RUNNING_SERVICES
)

echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU



:CPU_INFO
cls
echo ============================================
echo        CPU INFORMATION
echo ============================================
echo.
echo === PROCESSOR DETAILS ===
powershell -command "Get-CimInstance -ClassName Win32_Processor | Format-List Name,Manufacturer,MaxClockSpeed,NumberOfCores,NumberOfLogicalProcessors"
echo.
echo === PROCESSOR STATUS ===
powershell -command "Get-CimInstance -ClassName Win32_Processor | Format-List Status,LoadPercentage"
echo.
echo === CACHE INFO ===
powershell -command "Get-CimInstance -ClassName Win32_Processor | Format-List L2CacheSize,L3CacheSize"
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:RAM_INFO
cls
echo ============================================
echo                RAM INFORMATION
echo ============================================
echo.
echo === MEMORY OVERVIEW ===
powershell -NoProfile -Command "('{0:N2} GB Total Installed RAM' -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB))"
echo.
echo === MEMORY MODULES ===
powershell -NoProfile -Command "Get-CimInstance Win32_PhysicalMemory | Select BankLabel,@{n='Capacity(GB)';e={[math]::Round($_.Capacity/1GB,2)}},Manufacturer,Speed,PartNumber | Format-Table -AutoSize"
echo.
echo === CURRENT MEMORY USAGE ===
powershell -NoProfile -Command "$os=Get-CimInstance Win32_OperatingSystem; $t=$os.TotalVisibleMemorySize/1MB; $f=$os.FreePhysicalMemory/1MB; $u=$t-$f; '{0:N2} GB Total  |  {1:N2} GB Used  |  {2:N2} GB Free' -f $t,$u,$f"
echo.
echo ============================================
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:GPU_INFO
cls
echo ============================================
echo        GPU INFORMATION
echo ============================================
echo.
echo === VIDEO CARD DETAILS ===
powershell -command "Get-CimInstance -ClassName Win32_VideoController | Format-List Name,AdapterRAM,DriverVersion,VideoProcessor"
echo.
echo === DISPLAY INFO ===
powershell -command "Get-CimInstance -ClassName Win32_VideoController | Format-List CurrentHorizontalResolution,CurrentVerticalResolution,CurrentRefreshRate"
echo.
echo === DRIVER INFO ===
powershell -command "Get-CimInstance -ClassName Win32_VideoController | Format-List DriverDate,DriverVersion,Status"
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:SYSTEM_BENCHMARK
cls
echo ============================================
echo        SYSTEM BENCHMARK
echo ============================================
echo.
echo This will run the official Windows System Assessment Tool.
echo It benchmarks CPU, RAM, Disk, and Graphics.
echo This will take approximately 2-5 minutes.
echo.
echo Do not use your computer during the benchmark for accurate results.
echo.
set "confirm="
set /p confirm="Start benchmark? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Running Windows System Assessment Tool...
    echo.
    winsat formal
    echo.
    echo ============================================
    echo        BENCHMARK RESULTS
    echo ============================================
    echo.
    powershell -command "Get-CimInstance -ClassName Win32_WinSAT | Format-List CPUScore,D3DScore,DiskScore,GraphicsScore,MemoryScore,WinSPRLevel"
    echo.
    echo Benchmark complete!
) else (
    echo Benchmark cancelled.
)
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:ACTIVATION_STATUS
cls
echo ============================================
echo        WINDOWS ACTIVATION STATUS
echo ============================================
echo.
echo === LICENSE STATUS ===
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /dli
echo.
echo === DETAILED LICENSE INFO ===
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /dlv
echo.
echo === EXPIRATION DATE ===
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /xpr
echo.
echo === PRODUCT KEY ===
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault 2^>nul') do echo Product Key: %%b
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU   

:BLUETOOTH_DEVICES
cls
echo ============================================
echo        BLUETOOTH DEVICES
echo ============================================
echo.
echo === ALL BLUETOOTH DEVICES ===
powershell -command "Get-PnpDevice -Class Bluetooth | Format-Table FriendlyName,Status,InstanceId -AutoSize"
echo.
echo === CONNECTED BLUETOOTH DEVICES ===
powershell -command "Get-PnpDevice -Class Bluetooth | Where-Object {$_.Status -eq 'OK'} | Format-Table FriendlyName,Status -AutoSize"
echo.
echo === BLUETOOTH RADIO INFO ===
powershell -command "Get-PnpDevice | Where-Object {$_.Class -eq 'Bluetooth' -and $_.FriendlyName -like '*Radio*'} | Format-List FriendlyName,Status,InstanceId"
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:PRINTER_MANAGEMENT
cls
echo ============================================
echo        PRINTER MANAGEMENT
echo ============================================
echo.
echo === INSTALLED PRINTERS ===
powershell -command "Get-Printer | Format-Table Name,DriverName,PortName,Shared,Published -AutoSize"
echo.
echo === DEFAULT PRINTER ===
powershell -command "Get-CimInstance -ClassName Win32_Printer | Where-Object {$_.Default -eq $true} | Format-List Name,PortName,DriverName"
echo.
echo === PRINT JOBS ===
powershell -command "Get-PrintJob -PrinterName * 2>$null | Format-Table PrinterName,DocumentName,JobStatus -AutoSize"
echo.
echo [1] Open Printer Settings
echo [2] Add New Printer
echo [3] Return to System Menu
echo.
set "printopt="
set /p printopt="Select option (1-3): "
if "%printopt%"=="1" (
    start ms-settings:printers
) else if "%printopt%"=="2" (
    rundll32 printui.dll,PrintUIEntry /il
) else (
    goto SYSTEM_MENU
)
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:: =========================
:: MOTHERBOARD INFO (NEW)
:: =========================
:MOTHERBOARD_INFO
cls
echo ============================================
echo        MOTHERBOARD INFORMATION
echo ============================================
echo.
echo === BASE BOARD DETAILS ===
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Format-List Manufacturer,Product,Version,SerialNumber,Location,Slot"
echo.
echo === SYSTEM MANUFACTURER ===
powershell -NoProfile -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer,Model,SystemType"
echo.
echo === BIOS DETAILS (Motherboard Related) ===
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | Format-List Manufacturer,Name,Version,BiosCharacteristics,SMBIOSBIOSVersion"
echo.
echo [1] Export Motherboard Info to File
echo [2] Copy All Information to Clipboard
echo [3] Check for BIOS Updates
echo [4] Return to System Menu
echo.
set "mbopt="
set /p mbopt="Select option (1-4): "
if "%mbopt%"=="1" goto MOTHERBOARD_EXPORT
if "%mbopt%"=="2" goto MOTHERBOARD_COPY
if "%mbopt%"=="3" goto CHECK_BIOS_UPDATES
if "%mbopt%"=="0" goto MAIN_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto HARDWARE_MENU

:: =========================
:: EXPORT MOTHERBOARD INFO (NEW)
:: =========================
:MOTHERBOARD_EXPORT
cls
echo ============================================
echo        EXPORT MOTHERBOARD INFORMATION
echo ============================================
echo.
set "mbfile="
set /p mbfile="Enter filename for export (default=motherboard_info.txt): "
if "!mbfile!"=="" set mbfile=motherboard_info.txt
cls
echo Exporting motherboard information...
echo File will be saved to: %TEMP%\!mbfile!
echo.
powershell -NoProfile -Command @"
Write-Output '=== MOTHERBOARD INFORMATION ===' | Out-File '%TEMP%\\!mbfile!'
Write-Output '' | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output 'Exported: (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')' | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '=== BASE BOARD ===' | Out-File '%TEMP%\\!mbfile!' -Append
Get-CimInstance Win32_BaseBoard | Format-List * | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '=== SYSTEM ===' | Out-File '%TEMP%\\!mbfile!' -Append
Get-CimInstance Win32_ComputerSystem | Format-List Manufacturer,Model,SystemType | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '' | Out-File '%TEMP%\\!mbfile!' -Append
Write-Output '=== BIOS ===' | Out-File '%TEMP%\\!mbfile!' -Append
Get-CimInstance Win32_BIOS | Format-List Manufacturer,Name,Version,BiosCharacteristics,SMBIOSBIOSVersion | Out-File '%TEMP%\\!mbfile!' -Append
"@
if exist "%TEMP%\!mbfile!" (
    echo Export complete!
    start "" "%TEMP%\!mbfile!"
) else (
    echo Export failed. Please try again.
)
echo.
pause >nul
goto HARDWARE_MENU

:: =========================
:: COPY MOTHERBOARD INFO (NEW)
:: =========================
:MOTHERBOARD_COPY
cls
echo ============================================
echo        COPY MOTHERBOARD INFORMATION
echo ============================================
echo.
echo Copying motherboard information to clipboard...
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Format-List Manufacturer,Product,Version,SerialNumber,Location,Slot; Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer,Model,SystemType; Get-CimInstance Win32_BIOS | Select-Object Manufacturer,Name,Version,SMBIOSBIOSVersion" | Out-String -Stream | Set-Clipboard
echo.
echo Motherboard information copied to clipboard!
echo.
pause >nul
goto HARDWARE_MENU

:: =========================
:: CHECK BIOS UPDATES (NEW)
:: =========================
:CHECK_BIOS_UPDATES
cls
echo ============================================
echo        CHECK FOR BIOS UPDATES
echo ============================================
echo.
echo This will check your current BIOS version and manufacturer.
echo You can visit the manufacturer's website to check for updates.
echo.
powershell -NoProfile -Command "Write-Output '=== CURRENT BIOS INFO ==='; Get-CimInstance Win32_BIOS | Format-List Manufacturer,Name,Version,BiosReleaseDate,SMBIOSBIOSVersion"
echo.
set "manufacturer="
set /p manufacturer="Press Enter to open manufacturer website for your motherboard..."
start "" "https://www.google.com/search?q=motherboard+bios+updates"
echo.
echo Opening browser...
pause >nul
goto HARDWARE_MENU

:: =========================
:: POWER EFFICIENCY REPORT (NEW)
:: =========================
:POWER_EFFICIENCY
cls
echo ============================================
echo        POWER EFFICIENCY REPORT
echo ============================================
echo.
echo Generating power efficiency report...
echo Report will be saved as: energy-report.html
echo.
set "confirm="
set /p confirm="Generate Power Efficiency Report? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Running powercfg /energy...
    powercfg /energy >nul 2>&1
    timeout /t 60 /nobreak >nul
    if exist "%SystemRoot%\System32\energy-report.html" (
        echo Report generated successfully!
        start "" "%SystemRoot%\System32\energy-report.html"
    ) else (
        echo Report generation may still be in progress.
        echo Please check C:\Windows\System32\energy-report.html manually.
    )
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to system menu...
pause >nul
goto SYSTEM_MENU

:: =========================
:: FULL DRIVER EXPORT (NEW)
:: =========================
:FULL_DRIVER_EXPORT
cls
echo ============================================
echo        FULL DRIVER EXPORT
echo ============================================
echo.
set "driverfile="
set /p driverfile="Enter filename for driver export (default=drivers_full.txt): "
if "!driverfile!"=="" set driverfile=drivers_full.txt
echo.
echo Exporting detailed driver list to: %TEMP%\!driverfile!
echo.
driverquery /v > "%TEMP%\!driverfile!" 2>nul
echo.
echo Driver export complete!
echo Opening exported file...
start "" "%TEMP%\!driverfile!"
pause >nul
goto SYSTEM_MENU

:: =========================
:: SECURITY SECTION (Keep as is)
:: =========================
:FIREWALL_STATUS
cls
echo ============================================
echo        FIREWALL STATUS
echo ============================================
echo.
echo === ALL PROFILES ===
netsh advfirewall show allprofiles
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:OPEN_PORTS
cls
echo ============================================
echo        OPEN PORTS (LISTENING)
echo ============================================
echo.
echo Ports currently listening for connections:
echo.
echo === LISTENING PORTS ===
netstat -an | findstr "LISTENING"
echo.
echo === ESTABLISHED CONNECTIONS ===
netstat -an | findstr "ESTABLISHED"
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:SECURITY_EVENTS
cls
echo ============================================
echo        RECENT SECURITY EVENTS
echo ============================================
echo.
echo Last 20 security events:
echo.
wevtutil qe Security /c:20 /f:text /rd:true
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:FAILED_LOGINS
cls
echo ============================================
echo        FAILED LOGIN ATTEMPTS
echo ============================================
echo.
echo Checking for failed login attempts (Event ID 4625)...
echo.
wevtutil qe Security /q:"*[System[EventID=4625]]" /c:10 /f:text /rd:true 2>nul
echo.
echo If no results appear, there are no recent failed logins.
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:USB_HISTORY
cls
echo ============================================
echo        USB DEVICE HISTORY
echo ============================================
echo.
echo USB storage devices that have been connected:
echo.
echo === USB STORAGE DEVICES ===
reg query HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR /s 2>nul | findstr "FriendlyName"
echo.
echo === ALL USB DEVICES ===
reg query HKLM\SYSTEM\CurrentControlSet\Enum\USB /s 2>nul | findstr "DeviceDesc"
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:PASSWORD_POLICY
cls
echo ============================================
echo        PASSWORD POLICY
echo ============================================
echo.
net accounts
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:AUDIT_POLICY
cls
echo ============================================
echo        AUDIT POLICY
echo ============================================
echo.
echo Running auditpol /get /category:*...
echo.
auditpol /get /category:*
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:LOCAL_SECURITY
cls
echo ============================================
echo        LOCAL SECURITY POLICY
echo ============================================
echo.
echo Opening Local Security Policy Editor...
start secpol.msc
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:ANTIVIRUS_STATUS
cls
echo ============================================
echo        ANTIVIRUS STATUS
echo ============================================
echo.
echo === WINDOWS DEFENDER STATUS ===
powershell -command "Get-MpComputerStatus | Format-List AntivirusEnabled,RealTimeProtectionEnabled,AntivirusSignatureLastUpdated,QuickScanAge,FullScanAge"
echo.
echo === DEFENDER PREFERENCES ===
powershell -command "Get-MpPreference | Format-List DisableRealtimeMonitoring,ScanScheduleDay,ScanScheduleTime"
echo.
echo === THIRD PARTY ANTIVIRUS ===
powershell -command "Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct 2>$null | Format-List displayName,productState"
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:BITLOCKER_STATUS
cls
echo ============================================
echo        BITLOCKER STATUS
echo ============================================
echo.
manage-bde -status
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:QUARANTINE_VIEWER
cls
echo ============================================
echo        MALWARE QUARANTINE VIEWER
echo ============================================
echo.
echo === QUARANTINED THREATS ===
powershell -command "Get-MpThreat | Format-Table ThreatID,ThreatName,SeverityID,IsActive -AutoSize"
echo.
echo === THREAT DETECTION HISTORY ===
powershell -command "Get-MpThreatDetection | Format-Table ThreatID,ProcessName,DomainUser,DetectionSourceTypeID,ActionSuccess -AutoSize"
echo.
echo === QUARANTINE ACTIONS ===
echo.
echo [1] View detailed threat info
echo [2] Open Windows Security for threat remediation
echo [3] Open Windows Security
echo [4] Return to Menu
echo.
set "quaropt="
set /p quaropt="Select option (1-4): "
if "%quaropt%"=="1" (
    echo.
    powershell -command "Get-MpThreat | Format-List *"
) else if "%quaropt%"=="2" (
    echo.
    echo For safety, review detections and take remediation actions in Windows Security.
    echo This toolkit will not attempt an unsupported bulk threat-removal command.
    start windowsdefender:
) else if "%quaropt%"=="3" (
    start windowsdefender:
) else (
    goto SECURITY_MENU
)
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:REMOTE_DESKTOP
cls
echo ============================================
echo        REMOTE DESKTOP SETTINGS
echo ============================================
echo.
echo === CURRENT STATUS ===
powershell -command "$rdp = Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections'; if ($rdp.fDenyTSConnections -eq 0) { Write-Host 'Remote Desktop: ENABLED' -ForegroundColor Green } else { Write-Host 'Remote Desktop: DISABLED' -ForegroundColor Red }"
echo.
echo === REMOTE DESKTOP USERS ===
net localgroup "Remote Desktop Users"
echo.
echo === OPTIONS ===
echo.
echo [1] Enable Remote Desktop
echo [2] Disable Remote Desktop
echo [3] Open Remote Desktop Settings
echo [4] Add user to Remote Desktop Users
echo [5] Return to Menu
echo.
set "rdpopt="
set /p rdpopt="Select option (1-5): "
if "%rdpopt%"=="1" (
    echo.
    echo Enabling Remote Desktop...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
    netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
    echo Remote Desktop has been ENABLED.
) else if "%rdpopt%"=="2" (
    echo.
    echo Disabling Remote Desktop...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
    netsh advfirewall firewall set rule group="remote desktop" new enable=No
    echo Remote Desktop has been DISABLED.
) else if "%rdpopt%"=="3" (
    start ms-settings:remotedesktop
) else if "%rdpopt%"=="4" (
    set "rdpuser="
    set /p rdpuser="Enter username to add: "
    net localgroup "Remote Desktop Users" "!rdpuser!" /add
    echo User added to Remote Desktop Users group.
) else (
    goto SECURITY_MENU
)
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:TOGGLE_DEFENDER
cls
echo ============================================
echo        TOGGLE DEFENDER REAL-TIME PROTECTION
echo ============================================
echo.
echo Current status:
powershell -NoProfile -Command "Get-MpComputerStatus | Format-List AntivirusEnabled,RealTimeProtectionEnabled,AntivirusSignatureLastUpdated,QuickScanAge,FullScanAge"
echo.
echo [1] Enable Real-Time Protection
echo [2] Disable Real-Time Protection
echo [3] Return to Security Menu
echo.
set "defopt="
set /p defopt="Select option (1-3): "
if "%defopt%"=="1" (
    echo Enabling Windows Defender real-time protection...
    powershell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
    echo Real-time protection enabled.
) else if "%defopt%"=="2" (
    echo Disabling Windows Defender real-time protection...
    powershell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
    echo Real-time protection disabled.
) else (
    goto SECURITY_MENU
)
echo.
echo Press any key to return to security menu...
pause >nul
goto SECURITY_MENU

:: =========================
:: MAINTENANCE SECTION (Keep as is)
:: =========================
:CLEAR_TEMP
cls
echo ============================================
echo        CLEAR TEMPORARY FILES
echo ============================================
echo.
echo This will delete temporary files from:
echo   - Windows Temp folder
echo   - User Temp folder
echo   - Prefetch folder
echo   - Recent files list
echo   - Thumbnail cache
echo.
set "confirm="
set /p confirm="Continue? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Creating a timestamped backup of the hosts file is handled by the Hosts Editor.
    echo Clearing Windows Temp contents (locked files will be skipped)...
    if exist "%WINDIR%\Temp\." del /q /f /s "%WINDIR%\Temp\*" 2>nul
    echo Clearing User Temp contents (the Temp directory itself is preserved)...
    if defined TEMP if exist "%TEMP%\." del /q /f /s "%TEMP%\*" 2>nul
    echo Clearing Prefetch contents (Windows may recreate these files)...
    if exist "%WINDIR%\Prefetch\." del /q /f /s "%WINDIR%\Prefetch\*" 2>nul
    echo Clearing Recent-file shortcuts...
    if exist "%APPDATA%\Microsoft\Windows\Recent\." del /q /f "%APPDATA%\Microsoft\Windows\Recent\*" 2>nul
    echo Clearing thumbnail cache files...
    if exist "%LOCALAPPDATA%\Microsoft\Windows\Explorer\." del /q /f "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
    echo.
    echo Cleanup commands completed. Some in-use files may have been skipped; review any errors above.
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:CLEAR_RECYCLE
cls
echo ============================================
echo        CLEAR RECYCLE BIN
echo ============================================
echo.
set "confirm="
set /p confirm="Empty the Recycle Bin for all drives? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Emptying Recycle Bin...
    powershell -command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
    echo.
    echo Recycle Bin emptied!
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:DISK_CLEANUP_AUTO
cls
echo ============================================
echo        DISK CLEANUP (AUTOMATED)
echo ============================================
echo.
echo This will run automated disk cleanup with settings from cleanmgr /sagerun:1
echo Configure your preferences first using: cleanmgr /sageset:1
echo.
set "confirm="
set /p confirm="Run Automated Disk Cleanup? (Y/N): "
if /i "%confirm%"=="Y" (
    echo.
    echo Running automated disk cleanup...
    cleanmgr /sagerun:1 >nul 2>&1
    if errorlevel 1 (
        echo Could not run automated cleanup. Please configure with: cleanmgr /sageset:1 first
    ) else (
        echo Automated disk cleanup complete!
    )
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:DEFRAG
cls
echo ============================================
echo        DEFRAGMENT / OPTIMIZE DRIVE
echo ============================================
echo.
echo Available drives:
powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table Name,Description -AutoSize"
echo.
set "defdrive="
set /p defdrive="Enter drive letter to optimize (e.g., C): "
if "!defdrive!"=="" set defdrive=C
echo.
echo [1] Analyze only
echo [2] Optimize (Defragment/TRIM)
echo [3] Cancel
echo.
set "defopt="
set /p defopt="Select option (1-3): "
if "%defopt%"=="1" (
    echo.
    echo Analyzing drive !defdrive!:...
    defrag !defdrive!: /A
) else if "%defopt%"=="2" (
    echo.
    echo Optimizing drive !defdrive!:...
    echo This may take a while...
    defrag !defdrive!: /O
) else (
    echo Cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:WINDOWS_UPDATES
cls
echo ============================================
echo        WINDOWS UPDATES
echo ============================================
echo.
echo [1] Check for updates (Opens Settings)
echo [2] View update history
echo [3] View installed updates
echo [4] Cancel
echo.
set "updopt="
set /p updopt="Select option (1-4): "
if "%updopt%"=="1" (
    echo.
    echo Opening Windows Update settings...
    start ms-settings:windowsupdate
) else if "%updopt%"=="2" (
    echo.
    echo Opening update history...
    start ms-settings:windowsupdate-history
) else if "%updopt%"=="3" (
    echo.
    echo Installed updates:
    powershell -command "Get-HotFix | Sort-Object InstalledOn -Descending | Format-Table HotFixID,Description,InstalledOn -AutoSize"
) else (
    echo Cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:RESTORE_POINTS
cls
echo ============================================
echo        SYSTEM RESTORE POINTS
echo ============================================
echo.
echo Available restore points:
echo.
powershell -command "Get-ComputerRestorePoint | Format-Table SequenceNumber,Description,CreationTime -AutoSize"
echo.
echo Opening System Restore...
start rstrui
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:CREATE_RESTORE
cls
echo ============================================
echo        CREATE RESTORE POINT
echo ============================================
echo.
set "restorename="
set /p restorename="Enter name for restore point (default=ManualBackup): "
if "!restorename!"=="" set restorename=ManualBackup
set "restorename=!restorename:'=!"
echo.
echo Creating restore point: !restorename!
echo.
powershell -NoProfile -Command "try { Checkpoint-Computer -Description '!restorename!' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction Stop; Write-Host 'Restore point creation command completed.' -ForegroundColor Green; exit 0 } catch { Write-Error $_; exit 1 }"
if errorlevel 1 (
    echo.
    echo Restore point creation FAILED. Check the error above and confirm System Protection is enabled.
) else (
    echo.
    echo Restore point command completed. Verify it in the Restore Points menu if needed.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:: =========================
:: BACKUP SCHEDULER (FIXED)
:: =========================
:BACKUP_SCHEDULER
cls
echo ============================================
echo        BACKUP SCHEDULER
echo ============================================
echo.
echo === CURRENT BACKUP CONFIGURATION ===
echo.
:: Check Windows Backup Policy (may not exist on all systems)
powershell -NoProfile -Command "if (Get-Command Get-WBPolicy -ErrorAction SilentlyContinue) { Write-Output 'Windows Backup Policy: Available' } else { Write-Output 'Windows Backup Policy: Not Available on this system' }" 2>nul
echo.
echo === BACKUP HISTORY ===
echo Checking for backup history...
wbadmin get versions >nul 2>&1
if errorlevel 1 (
    echo No previous backups found or wbadmin not configured.
) else (
    echo Backup history available:
    wbadmin get versions 2>nul | findstr "ITEM_TYPE" || wbadmin get versions 2>nul
)
echo.
echo === OPTIONS ===
echo.
echo [1] Open Windows Backup Settings
echo [2] Open File History Settings  
echo [3] Open Backup and Restore (Windows 7)
echo [4] Create System Image
echo [5] Return to Menu
echo.
set "backopt="
set /p backopt="Select option (1-5): "
if "%backopt%"=="1" goto WINDOWS_BACKUP_SETTINGS
if "%backopt%"=="2" goto FILE_HISTORY_SETTINGS  
if "%backopt%"=="3" goto BACKUP_AND_RESTORE_WIN7
if "%backopt%"=="4" goto CREATE_SYSTEM_IMAGE
if "%backopt%"=="5" goto MAINTENANCE_MENU
echo Invalid selection. Press any key to continue...
pause >nul
goto BACKUP_SCHEDULER

:: Subsection handlers for cleaner menu flow
:WINDOWS_BACKUP_SETTINGS
cls
echo ============================================
echo        WINDOWS BACKUP SETTINGS
echo ============================================
echo.
start ms-settings:backup
echo.
echo Opening Windows Backup settings...
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:FILE_HISTORY_SETTINGS
cls
echo ============================================
echo        FILE HISTORY SETTINGS
echo ============================================
echo.
start ms-settings:backup
echo.
echo Opening File History settings...
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:BACKUP_AND_RESTORE_WIN7
cls
echo ============================================
echo        BACKUP AND RESTORE (Windows 7)
echo ============================================
echo.
control /name Microsoft.BackupAndRestore
echo.
echo Opening Backup and Restore...
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:CREATE_SYSTEM_IMAGE
cls
echo ============================================
echo        CREATE SYSTEM IMAGE
echo ============================================
echo.
echo This will launch the System Image Backup wizard.
echo You can create a complete system image backup.
echo.
set "confirm="
set /p confirm="Launch System Image Wizard? (Y/N): "
if /i "%confirm%"=="Y" (
    sdclt /BLBBACKUPWIZARD >nul 2>&1
    if errorlevel 1 (
        echo Could not launch wizard. Please try again.
    ) else (
        echo System Image Backup Wizard launched!
    )
) else (
    echo Operation cancelled.
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:: =========================
:: LOG ROTATION MANAGER (NEW)
:: =========================
:LOG_ROTATION
cls
echo ============================================
echo        LOG ROTATION MANAGER
echo ============================================
echo.
echo Automatically save logs with timestamps to prevent file overwrites...
echo.
set "logdir="
set /p logdir="Enter log directory path (default=%TEMP%): "
if "!logdir!"=="" set logdir=%TEMP%
echo.
echo [1] Create Timestamped Log File
echo [2] Rotate Existing Logs
echo [3] View All Timestamped Logs
echo [4] Return to Maintenance Menu
echo.
set "logopt="
set /p logopt="Select option (1-4): "
if "%logopt%"=="1" (
    cls
    echo === CREATE TIMESTAMPED LOG FILE ===
    set "logname="
    set /p logname="Enter base filename: "
    
    :: Generate timestamp in format YYYYMMDD_HHMMSS
    for /f "tokens=2 delims==/:" %%i in ('wmic OS Get localdatetime /value') do set datetime=%%i
    set timestamp=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%_%datetime:~8,2%%datetime:~10,2%%datetime:~12,2%
    
    echo Log file created with timestamp.
    echo Press any key to continue...
    pause >nul
) else if "%logopt%"=="2" (
    cls
    echo === ROTATE EXISTING LOGS ===
    echo Rotating logs in: !logdir!
    for %%f in (!logdir!\*.txt) do (
        if exist "%%~nf_%date:~-4,4%%date:~-7,2%%date:~-10,2%.txt" (
            ren "%%~nf.txt" "%%~nf_%date:~-4,4%%date:~-7,2%%date:~-10,2%.txt"
        ) else (
            ren "%%~nf.txt" "%%~nf_%date:~-4,4%%date:~-7,2%%date:~-10,2%.txt"
        )
    )
    echo Log rotation complete!
) else if "%logopt%"=="3" (
    cls
    echo === TIMESTAMPED LOGS IN !logdir! ===
    dir /b "!logdir!\*_*.txt" 2>nul
    echo.
    echo Press any key to continue...
    pause >nul
) else (
    goto MAINTENANCE_MENU
)
echo.
echo Press any key to return to maintenance menu...
pause >nul
goto MAINTENANCE_MENU

:: =========================
:: POWER SECTION (Keep as is)
:: =========================
:BATTERY_HEALTH
cls
echo ============================================
echo        BATTERY HEALTH REPORT
echo ============================================
echo.
echo Generating battery report...
echo Report will be saved to: %USERPROFILE%\battery-report.html
echo.
powercfg /batteryreport /output "%USERPROFILE%\battery-report.html"
echo.
echo Opening battery report...
start "" "%USERPROFILE%\battery-report.html"
echo.
echo Press any key to return to power menu...
pause >nul
goto POWER_MENU

:POWER_CONFIG_LIST
cls
echo ============================================
echo        POWER CONFIGURATION LIST
echo ============================================
echo.
echo === ALL AVAILABLE POWER SCHEMES ===
powercfg /list
echo.
echo === ACTIVE POWER SCHEME ===
powercfg /getactivescheme
echo.
echo [1] Switch to Different Power Plan
echo [2] Show Detailed Settings
echo [3] Return to Power Menu
echo.
set "powoptlist="
set /p powoptlist="Select option (1-3): "
if "%powoptlist%"=="1" goto SWITCH_POWER_PLAN
if "%powoptlist%"=="2" goto POWER_CONFIG_DETAILS
if "%powoptlist%"=="0" goto MAIN_MENU
echo.
echo Press any key to return to power menu...
pause >nul
goto POWER_MENU

:POWER_CONFIG_DETAILS
cls
echo ============================================
echo        POWER SCHEME DETAILS
echo ============================================
echo.
powercfg /query
echo.
echo Press any key to return to power menu...
pause >nul
goto POWER_MENU

:SLEEP_SETTINGS
cls
echo ============================================
echo        SLEEP SETTINGS
echo ============================================
echo.
echo === DEVICES THAT CAN WAKE COMPUTER ===
powercfg /devicequery wake_armed
echo.
echo === LAST WAKE SOURCE ===
powercfg /lastwake
echo.
echo === SLEEP STATES AVAILABLE ===
powercfg /availablesleepstates
echo.
echo === WAKE TIMERS ===
powercfg /waketimers
echo.
echo Press any key to return to power menu...
pause >nul
goto POWER_MENU

:: =========================
:: SWITCH POWER PLAN (NEW)
:: =========================
:SWITCH_POWER_PLAN
cls
echo ============================================
echo        SWITCH POWER PLAN
echo ============================================
echo.
echo Available Power Plans:
powercfg /list
echo.
set "newplan="
set /p newplan="Enter GUID to switch to:"
if "!newplan!"=="" (
    for /f "tokens=4" %%g in ('powercfg /getactivescheme') do set "newplan=%%g"
)
echo.
echo Switching power plan...
powercfg /SETACTIVE !newplan! >nul 2>&1
if errorlevel 1 (
    echo Error: Invalid GUID or insufficient permissions.
) else (
    echo Power plan switched successfully!
)
echo.
echo Press any key to return to power menu...
pause >nul
goto POWER_MENU

:: =========================
:: TOOLS SECTION (Keep as is)
:: =========================
:ALL_CHECKS
cls
echo ============================================
echo        RUNNING ALL SECURITY CHECKS
echo ============================================
echo.
echo This will run a comprehensive scan of your system.
echo Results can be exported after completion.
echo.
set "confirm="
set /p confirm="Continue? (Y/N): "
if /i NOT "%confirm%"=="Y" goto TOOLS_MENU
echo.
echo [1/20] Network Connections...
netstat -an
echo.
echo [2/20] IP Configuration...
ipconfig /all
echo.
echo [3/20] Processes...
tasklist /svc
echo.
echo [4/20] System Information...
systeminfo
echo.
echo [5/20] User Accounts...
net user
echo.
echo [6/20] Firewall Status...
netsh advfirewall show allprofiles state
echo.
echo [7/20] Open Ports...
netstat -an | findstr "LISTENING"
echo.
echo [8/20] Startup Programs...
powershell -command "Get-CimInstance -ClassName Win32_StartupCommand | Format-Table Caption,Command -AutoSize"
echo.
echo [9/20] Disk Space...
powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table Name,@{N='Size(GB)';E={[math]::Round($_.Size/1GB,2)}},@{N='Free(GB)';E={[math]::Round($_.FreeSpace/1GB,2)}} -AutoSize"
echo.
echo [10/20] Disk Health...
powershell -command "Get-CimInstance -ClassName Win32_DiskDrive | Format-Table Status,Model -AutoSize"
echo.
echo [11/20] CPU Information...
powershell -command "Get-CimInstance -ClassName Win32_Processor | Format-List Name,NumberOfCores,MaxClockSpeed"
echo.
echo [12/20] RAM Information...
powershell -command "Get-CimInstance -ClassName Win32_PhysicalMemory | Format-Table @{N='Capacity(GB)';E={[math]::Round($_.Capacity/1GB,2)}},Speed -AutoSize"
echo.
echo [13/20] GPU Information...
powershell -command "Get-CimInstance -ClassName Win32_VideoController | Format-List Name,AdapterRAM"
echo.
echo [14/20] BIOS Information...
powershell -command "Get-CimInstance -ClassName Win32_BIOS | Format-List Manufacturer,Name,Version"
echo.
echo [15/20] Installed Drivers...
driverquery /fo table | more
echo.
echo [16/20] Running Services...
sc query state= running | findstr "SERVICE_NAME"
echo.
echo [17/20] Scheduled Tasks...
schtasks /query /fo list | findstr "TaskName"
echo.
echo [18/20] Password Policy...
net accounts
echo.
echo [19/20] Network Shares...
net share
echo.
echo [20/20] Antivirus Status...
powershell -command "Get-MpComputerStatus | Format-List AntivirusEnabled,RealTimeProtectionEnabled"
echo.
echo ============================================
echo   ALL CHECKS COMPLETED!
echo ============================================
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:EXPORT_RESULTS
cls
echo ============================================
echo        EXPORTING RESULTS
echo ============================================
echo.
echo Available Drives:
echo.
powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table Name,Description -AutoSize"
echo.
echo ============================================
echo.
set "drive="
set /p drive="Enter drive letter (e.g., C, D, E): "
if "!drive!"=="" set drive=C
echo.
set "folder="
set /p folder="Enter folder path (e.g., Users\John\Desktop or SecurityScans): "
if "!folder!"=="" set folder=SecurityScans
echo.
for /f "tokens=*" %%i in ('powershell -command "Get-Date -Format 'yyyyMMdd_HHmmss'"') do set datetime=%%i
set filename=security_report_%datetime%
set "inputname="
set /p inputname="Enter filename (default=%filename%): "
if not "!inputname!"=="" set filename=!inputname!
set "fullpath=!drive!:\!folder!"
echo.
echo Creating directory if it doesn't exist...
if not exist "!fullpath!" mkdir "!fullpath!"
if not exist "!fullpath!" (
    echo.
    echo ERROR: Could not create directory: !fullpath!
    echo Please check the path and try again.
    echo.
    echo Press any key to return to tools menu...
    pause >nul
    goto TOOLS_MENU
)
echo.
echo Exporting to: !fullpath!\!filename!.txt
echo.
echo ============================================ > "!fullpath!\!filename!.txt"
echo   SECURITY CHECK ULTIMATE REPORT >> "!fullpath!\!filename!.txt"
echo   Generated: %date% %time% >> "!fullpath!\!filename!.txt"
echo   Computer: %COMPUTERNAME% >> "!fullpath!\!filename!.txt"
echo   User: %USERNAME% >> "!fullpath!\!filename!.txt"
echo ============================================ >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [1/20] Exporting network connections...
echo === NETWORK CONNECTIONS === >> "!fullpath!\!filename!.txt"
netstat -ano >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [2/20] Exporting IP configuration...
echo === IP CONFIGURATION === >> "!fullpath!\!filename!.txt"
ipconfig /all >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [3/20] Exporting processes...
echo === PROCESSES AND SERVICES === >> "!fullpath!\!filename!.txt"
tasklist /svc >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [4/20] Exporting system information...
echo === SYSTEM INFORMATION === >> "!fullpath!\!filename!.txt"
systeminfo >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [5/20] Exporting user accounts...
echo === USER ACCOUNTS === >> "!fullpath!\!filename!.txt"
net user >> "!fullpath!\!filename!.txt"
net localgroup administrators >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [6/20] Exporting firewall status...
echo === FIREWALL STATUS === >> "!fullpath!\!filename!.txt"
netsh advfirewall show allprofiles >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [7/20] Exporting open ports...
echo === OPEN PORTS === >> "!fullpath!\!filename!.txt"
netstat -an | findstr "LISTENING" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [8/20] Exporting startup programs...
echo === STARTUP PROGRAMS === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_StartupCommand | Format-Table Caption,Command,Location -AutoSize" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [9/20] Exporting disk space...
echo === DISK SPACE === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table Name,@{N='Size(GB)';E={[math]::Round($_.Size/1GB,2)}},@{N='FreeSpace(GB)';E={[math]::Round($_.FreeSpace/1GB,2)}},FileSystem -AutoSize" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [10/20] Exporting disk health...
echo === DISK HEALTH === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_DiskDrive | Format-Table Status,Model,Size,MediaType -AutoSize" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [11/20] Exporting CPU information...
echo === CPU INFORMATION === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_Processor | Format-List Name,Manufacturer,MaxClockSpeed,NumberOfCores,NumberOfLogicalProcessors" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [12/20] Exporting RAM information...
echo === RAM INFORMATION === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_PhysicalMemory | Format-Table @{N='Capacity(GB)';E={[math]::Round($_.Capacity/1GB,2)}},Manufacturer,Speed,PartNumber -AutoSize" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [13/20] Exporting GPU information...
echo === GPU INFORMATION === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_VideoController | Format-List Name,AdapterRAM,DriverVersion" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [14/20] Exporting BIOS information...
echo === BIOS INFORMATION === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_BIOS | Format-List Manufacturer,Name,Version,ReleaseDate" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [15/20] Exporting motherboard information...
echo === MOTHERBOARD INFORMATION === >> "!fullpath!\!filename!.txt"
powershell -command "Get-CimInstance -ClassName Win32_BaseBoard | Format-List Manufacturer,Product,Version" >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [16/20] Exporting drivers...
echo === INSTALLED DRIVERS === >> "!fullpath!\!filename!.txt"
driverquery /fo table >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [17/20] Exporting services...
echo === RUNNING SERVICES === >> "!fullpath!\!filename!.txt"
sc query state= running >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [18/20] Exporting scheduled tasks...
echo === SCHEDULED TASKS === >> "!fullpath!\!filename!.txt"
schtasks /query /fo table >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [19/20] Exporting password policy...
echo === PASSWORD POLICY === >> "!fullpath!\!filename!.txt"
net accounts >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo [20/20] Exporting network shares...
echo === NETWORK SHARES === >> "!fullpath!\!filename!.txt"
net share >> "!fullpath!\!filename!.txt"
echo. >> "!fullpath!\!filename!.txt"
echo ============================================ >> "!fullpath!\!filename!.txt"
echo   END OF REPORT >> "!fullpath!\!filename!.txt"
echo ============================================ >> "!fullpath!\!filename!.txt"
echo.
echo ============================================
echo   EXPORT COMPLETE!
echo ============================================
echo.
echo   File saved to:
echo   !fullpath!\!filename!.txt
echo.
echo ============================================
echo.
set "openfile="
set /p openfile="Would you like to open the file? (Y/N): "
if /i "!openfile!"=="Y" (
    notepad "!fullpath!\!filename!.txt"
)
set "openfolder="
set /p openfolder="Would you like to open the folder? (Y/N): "
if /i "!openfolder!"=="Y" (
    explorer "!fullpath!"
)
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:TASK_MANAGER
cls
echo ============================================
echo        OPENING TASK MANAGER
echo ============================================
echo.
start taskmgr
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:EVENT_VIEWER
cls
echo ============================================
echo        OPENING EVENT VIEWER
echo ============================================
echo.
start eventvwr
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:DEVICE_MANAGER
cls
echo ============================================
echo        OPENING DEVICE MANAGER
echo ============================================
echo.
start devmgmt.msc
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:CONTROL_PANEL
cls
echo ============================================
echo        OPENING CONTROL PANEL
echo ============================================
echo.
start control
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:SYSTEM_PROPERTIES
cls
echo ============================================
echo        OPENING SYSTEM PROPERTIES
echo ============================================
echo.
start sysdm.cpl
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:NETWORK_CONNECTIONS
cls
echo ============================================
echo        OPENING NETWORK CONNECTIONS
echo ============================================
echo.
start ncpa.cpl
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:WINDOWS_FIREWALL
cls
echo ============================================
echo        OPENING WINDOWS FIREWALL
echo ============================================
echo.
start firewall.cpl
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:PROGRAMS_FEATURES
cls
echo ============================================
echo        OPENING PROGRAMS AND FEATURES
echo ============================================
echo.
start appwiz.cpl
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:DISK_MANAGEMENT
cls
echo ============================================
echo        OPENING DISK MANAGEMENT
echo ============================================
echo.
start diskmgmt.msc
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:SERVICES
cls
echo ============================================
echo        OPENING SERVICES
echo ============================================
echo.
start services.msc
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:REGISTRY_EDITOR
cls
echo ============================================
echo        OPENING REGISTRY EDITOR
echo ============================================
echo.
echo WARNING: Be careful when editing the registry!
echo Incorrect changes can cause system problems.
echo.
set "confirm="
set /p confirm="Continue? (Y/N): "
if /i "%confirm%"=="Y" (
    start regedit
)
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:GROUP_POLICY
cls
echo ============================================
echo        OPENING GROUP POLICY EDITOR
echo ============================================
echo.
echo Note: This may not be available on Windows Home editions.
echo.
start gpedit.msc
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:COMPUTER_MANAGEMENT
cls
echo ============================================
echo        OPENING COMPUTER MANAGEMENT
echo ============================================
echo.
start compmgmt.msc
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:RESOURCE_MONITOR
cls
echo ============================================
echo        OPENING RESOURCE MONITOR
echo ============================================
echo.
start resmon
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:PERFORMANCE_MONITOR
cls
echo ============================================
echo        OPENING PERFORMANCE MONITOR
echo ============================================
echo.
start perfmon
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: HOSTS FILE EDITOR (NEW)
:: =========================
:HOSTS_EDITOR
cls
echo ============================================
echo        HOSTS FILE EDITOR
echo ============================================
echo.
echo Toggle ad-blocking entries in hosts file...
echo.
echo === CURRENT HOSTS FILE STATUS ===
type %SystemRoot%\System32\drivers\etc\hosts 2>nul | findstr "0.0.0.0" >nul
if errorlevel 1 (
    echo No ad-blocking entries detected.
) else (
    echo Ad-blocking entries found in hosts file.
)
echo.
echo [1] Add Sample Ad-Blocking Entries (limited demo list)
echo [2] Remove Ad-Blocking Entries
echo [3] Open Hosts File for Manual Editing
echo [4] Return to Tools Menu
echo.
set "hostsopt="
set /p hostsopt="Select option (1-4): "
if "%hostsopt%"=="1" (
    cls
    echo === ADDING AD-BLOCKING ENTRIES ===
    echo.
    echo NOTE: This is only a tiny demonstration list, not a maintained ad-blocking solution.
    set "hostsfile=%SystemRoot%\System32\drivers\etc\hosts"
    set "hostsbak=%SystemRoot%\System32\drivers\etc\hosts.toolkit.bak"
    if not exist "!hostsfile!" (
        echo Hosts file not found. No changes made.
    ) else (
        if not exist "!hostsbak!" copy /y "!hostsfile!" "!hostsbak!" >nul
        findstr /i /x /c:"0.0.0.0 adserver.com" "!hostsfile!" >nul || echo 0.0.0.0 adserver.com>>"!hostsfile!"
        findstr /i /x /c:"0.0.0.0 ads.google.com" "!hostsfile!" >nul || echo 0.0.0.0 ads.google.com>>"!hostsfile!"
        findstr /i /x /c:"0.0.0.0 doubleclick.net" "!hostsfile!" >nul || echo 0.0.0.0 doubleclick.net>>"!hostsfile!"
        findstr /i /x /c:"0.0.0.0 analytics.google.com" "!hostsfile!" >nul || echo 0.0.0.0 analytics.google.com>>"!hostsfile!"
        echo Sample entries added where missing. Backup: !hostsbak!
    )
) else if "%hostsopt%"=="2" (
    cls
    echo === REMOVING AD-BLOCKING ENTRIES ===
    echo.
    echo Removing only the four exact sample entries managed by this menu...
    set "hostsfile=%SystemRoot%\System32\drivers\etc\hosts"
    set "hostsbak=%SystemRoot%\System32\drivers\etc\hosts.toolkit.bak"
    if not exist "!hostsfile!" (
        echo Hosts file not found. No changes made.
    ) else (
        if not exist "!hostsbak!" copy /y "!hostsfile!" "!hostsbak!" >nul
        powershell -NoProfile -Command "$p=$env:SystemRoot+'\System32\drivers\etc\hosts'; $remove=@('0.0.0.0 adserver.com','0.0.0.0 ads.google.com','0.0.0.0 doubleclick.net','0.0.0.0 analytics.google.com'); $lines=Get-Content -LiteralPath $p; $kept=$lines | Where-Object { $remove -notcontains $_.Trim() }; Set-Content -LiteralPath $p -Value $kept -Encoding ascii"
        if errorlevel 1 (echo Hosts-file cleanup failed. Check permissions and the backup.) else echo Exact sample entries removed; unrelated lines were preserved.
    )
) else if "%hostsopt%"=="3" (
    notepad "%SystemRoot%\System32\drivers\etc\hosts"
) else (
    goto TOOLS_MENU
)
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: REGISTRY BACKUP TOOL (NEW)
:: =========================
:REGISTRY_BACKUP
cls
echo ============================================
echo        REGISTRY BACKUP TOOL
echo ============================================
echo.
echo Create registry backups for safe system recovery...
echo.
set "regpath="
set /p regpath="Enter Registry Path to Backup (default=HKLM\SOFTWARE): "
if "!regpath!"=="" set regpath=HKLM\SOFTWARE
set "backupname="
set /p backupname="Enter filename for backup (default=registry_backup.reg): "
if "!backupname!"=="" set backupname=registry_backup.reg
echo.
echo Backing up registry to: %TEMP%\!backupname!
reg export "!regpath!" "%TEMP%\!backupname!" >nul 2>&1
if errorlevel 1 (
    echo ERROR: Could not create registry backup. Please check path and permissions.
) else (
    echo Registry backup created successfully!
    start "" "%TEMP%\!backupname!"
)
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: FULL SYSTEM REPORT GENERATOR (FIXED)
:: =========================
:FULL_SYSTEM_REPORT
cls
echo ============================================
echo        FULL SYSTEM REPORT GENERATOR
echo ============================================
echo.
set "fullreportfile=full_system_report.txt"
set /p fullreportfile="Enter filename for report (default=%fullreportfile%): "
if "!fullreportfile!"=="" set fullreportfile=full_system_report.txt
cls
echo Generating comprehensive system report...
echo Report will be saved to: %TEMP%\!fullreportfile!
echo.
echo Please wait while the report is being generated...
echo.
:: Start fresh file
( echo ============================================
  echo        FULL SYSTEM REPORT
  echo ============================================
) > "%TEMP%\!fullreportfile!"
:: Add system info
systeminfo >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: Add IP config
ipconfig /all >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: Add network adapters
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Format-Table Name,MACAddress,Manufacturer,Speed,NetConnectionStatus -AutoSize" >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: Add drivers
driverquery /fo table >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: Add top processes by memory
powershell -NoProfile -Command "Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 10 Name,Id,@{N='Memory(MB)';E={[math]::Round($_.WorkingSet64/1MB,2)}} | Format-Table -AutoSize" >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: Add power plan status
powercfg /getactivescheme >> "%TEMP%\!fullreportfile!" 2>&1
echo. >> "%TEMP%\!fullreportfile!"
:: End file
( echo ============================================
  echo        END OF SYSTEM REPORT
  echo ============================================
) >> "%TEMP%\!fullreportfile!"
if exist "%TEMP%\!fullreportfile!" (
    cls
    echo ============================================
    echo   SUCCESS: Report Generated!
    echo ============================================
    echo.
    echo File saved to: %TEMP%\!fullreportfile!
    echo.
    set "open="
    set /p open="Open report now? (Y/N): "
    if /i "!open!"=="Y" start "" "%TEMP%\!fullreportfile!"
) else (
    cls
    echo ============================================
    echo   ERROR: Report Generation Failed!
    echo ============================================
    echo.
    echo Please check your permissions and try again.
    echo Press any key to continue...
    pause >nul
)
goto TOOLS_MENU

:: =========================
:: CMD PROMPT
:: =========================
:CMD_PROMPT
cls
echo ============================================
echo        OPENING COMMAND PROMPT
echo ============================================
echo.
echo Opening new CMD window as Administrator...
start cmd
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: POWERSHELL
:: =========================
:POWERSHELL
cls
echo ============================================
echo        OPENING POWERSHELL
echo ============================================
echo.
echo Opening PowerShell as Administrator...
start powershell
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: WINDOWS TERMINAL
:: =========================
:TERMINAL
cls
echo ============================================
echo        OPENING WINDOWS TERMINAL
echo ============================================
echo.
echo Opening Windows Terminal as Administrator...
start wt
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: CHECK PENDING REBOOT
:: =========================
:CHECK_PENDING_REBOOT
cls
echo ============================================
echo        CHECK PENDING REBOOT
echo ============================================
echo.
echo Checking for pending reboot...
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v PendingUpdateOrReboot >nul 2>&1
if %errorlevel%==0 (
    echo A pending reboot was detected. Updates may be waiting to install.
) else (
    echo No pending reboot detected.
)
echo.
echo Press any key to return to tools menu...
pause >nul
goto TOOLS_MENU

:: =========================
:: EXIT SECTION
:: =========================
:EXIT
cls
echo.
echo ============================================
echo   THANK YOU FOR USING SECURITY CHECK!
echo.
echo   Ultimate Edition v14.0
echo.
echo   90+ Features - All Built-In Windows Tools
echo   No Dependencies - No Downloads Required
echo.
echo   Stay safe and keep scanning! tjc0d3d
echo ============================================
echo.
echo Press any key to exit...
pause >nul
exit
