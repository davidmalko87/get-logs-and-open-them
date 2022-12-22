Write-Host 'The script in progress...' -ForegroundColor Blue
Write-Host 'Lets make some noise' -ForegroundColor Red
Get-EventLog -LogName System -EntryType Error, Warning -After 01/12/2022 | Out-File C:\Users\david\Downloads\result1.txt
Write-Host 'Im opening System logs' -ForegroundColor Blue
Invoke-Item C:\Users\david\Downloads\result1.txt
Get-EventLog -LogName Application -EntryType Error, Warning -After 01/12/2022 | Out-File C:\Users\david\Downloads\result2.txt
Write-Host 'Im opening Application logs' -ForegroundColor Blue
Invoke-Item C:\Users\david\Downloads\result2.txt
Write-Host 'The script was completed' -ForegroundColor Yellow
Start-Sleep -Seconds 5
