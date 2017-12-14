$packageName= 'metricbeat'
$installationPath =  "E:\Programs\Elastic\MetricBeat"

Stop-Service $packageName

Import-Module Carbon

Remove-Service $packageName
Remove-Item $installationPath -Recurse -Force

