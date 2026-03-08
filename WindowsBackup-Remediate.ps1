<#
Version: 1.0
Author: 
- Jorgen Nilsson (ccmexec.com)
Script: WindowsBackup-Remediate.ps1
Description: Initiate a Windows Backup
Hint: This is a community script. There is no guarantee for this. Please check thoroughly before running.
Version 1.0: 
Run as: User
Context: 64 Bit
#> 

$tasks = @(
    @{ Path = '\Microsoft\Windows\CloudRestore\' ; Name = 'backup' }
)

foreach ($t in $tasks) {
    try {
        $task = Get-ScheduledTask -TaskPath $t.Path -TaskName $t.Name -ErrorAction Stop
        if ($task.State -ne 'Running') {
            Start-ScheduledTask -TaskPath $t.Path -TaskName $t.Name -ErrorAction Stop
            Write-Output "Started task '$($t.Path)$($t.Name)'."
        } else {
            Write-Output "Task '$($t.Path)$($t.Name)' is already running."
        }
    } catch {
        Write-Error "Failed to start task '$($t.Path)$($t.Name)': $($_.Exception.Message)"
        exit 1
    }
}