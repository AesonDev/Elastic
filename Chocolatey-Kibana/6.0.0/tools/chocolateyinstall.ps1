$ErrorActionPreference = 'Stop'

$PackageName = 'kibana'
$url32       = 'https://artifacts.elastic.co/downloads/kibana/kibana-6.0.0-windows-x86_64.zip'
$checksum32  = '31B9A0F9C8942DD43752B1A9F69907B39E47A994E3DFCA9F68D02F628B73F818'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = 'C:\Program Files\Elastic\Kibana\'
}
Install-ChocolateyZipPackage @packageArgs

$ServiceName = 'kibana'

Write-Host "Installing service"

if ($Service = Get-Service $ServiceName -ErrorAction SilentlyContinue) {
    if ($Service.Status -eq "Running") {
        Start-ChocolateyProcessAsAdmin "stop $ServiceName" "sc.exe"
    }
    Start-ChocolateyProcessAsAdmin "delete $ServiceName" "sc.exe"
}

Invoke-Expression "nssm install kibana 'C:\Program Files\Elastic\Kibana\kibana-6.0.0-windows-x86_64\bin\kibana.bat'"
Start-Service kibana
