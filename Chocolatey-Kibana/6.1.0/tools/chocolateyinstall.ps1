$ErrorActionPreference = 'Stop'

$PackageName = 'kibana'
$url32       = 'http://proget/endpoints/Installer/content/Kibana/kibana-6.1.0-windows-x86_64.zip'
$checksum32  = '3B204BF43667E1DC0AB17EFDF706235ECF712544602B43B30E4061C2FC725FA4'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = 'E:\Programs\Elastic\Kibana'
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

Invoke-Expression "nssm install kibana 'e:\Programs\Elastic\Kibana\kibana-6.1.0-windows-x86_64\bin\kibana.bat'"
Start-Service kibana
