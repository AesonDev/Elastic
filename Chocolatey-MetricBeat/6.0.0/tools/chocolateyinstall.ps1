$ErrorActionPreference = 'Stop';

$packageName= 'Metricbeat'

$_packageName = $packageName.ToLower()

$url        = "http://proget/endpoints/Installers/content/$_packageName-6.0.0-windows-x86_64.zip"

$installationPath =  "E:\Programs\Elastic\$packageName"
New-Item -ItemType Directory -Path $installationPath -Force

$zipFile = "$installationPath\$packageName.zip"

Invoke-WebRequest -Uri $url -UseBasicParsing -UseDefaultCredentials -OutFile $zipFile 

Expand-Archive -Path $zipFile -DestinationPath $installationPath -Force 

Remove-Item $zipFile

Invoke-Expression "$installationPath\install-service-$($_packageName).ps1"

Start-Service $packageName
