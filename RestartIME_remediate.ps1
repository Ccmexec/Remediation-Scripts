<#
Version: 1.0
Author: 
- Jorgen Nilsson (ccmexec.com)
Script: RestartIME_remediate.ps1
Description: Restart IME Service
Hint: This is a community script. There is no guarantee for this. Please check thoroughly before running.
Version 1.0: Init
Run as: Admin
Context: 64 Bit
#> 

#Restart IME service
Start-Process -FilePath powershell -ArgumentList '-Executionpolicy bypass -command "& {Start-Sleep 90 ; Restart-Service -Name IntuneManagementExtension -Force}"'

#Exit script
Exit 0 