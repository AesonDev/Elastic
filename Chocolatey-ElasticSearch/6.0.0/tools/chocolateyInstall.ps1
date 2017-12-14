$installPath = "E:\Programs\Elastic\ElasticSearch"
$packageArgs = @{
    packageName            = 'elasticsearch'
    fileType               = 'MSI'
    url                    = 'http://proget/endpoints/Installer/content/ElasticSearch/elasticsearch-6.0.0.msi'
    url64bit               = 'http://proget/endpoints/Installer/content/ElasticSearch/elasticsearch-6.0.0.msi'
    checksum               = 'CF18522ED4F81DE10E21E198632D25A6D1673F05B966F508730C5B0860054A26'
    checksum64             = 'CF18522ED4F81DE10E21E198632D25A6D1673F05B966F508730C5B0860054A26'
    checksumType           = 'sha256'
    checksumType64         = 'sha256'
    silentArgs             = "/quiet INSTALLDIR=$installPath\6.0.0 DATADIRECTORY=$installPath\Data CONFIGDIRECTORY=$installPath\Config LOGSDIRECTORY=$installPath\Logs /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes         = @(0)
  }
   
  Install-ChocolateyPackage @packageArgs