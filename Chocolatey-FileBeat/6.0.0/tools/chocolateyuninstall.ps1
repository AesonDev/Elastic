$packageName= 'Filebeat'
$installationPath =  "E:\Programs\Elastic\$packageName"

Stop-Service $packageName

Import-Module Carbon

Remove-Service $packageName
Remove-Item $installationPath -Recurse -Force