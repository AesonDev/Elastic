$ErrorActionPreference = 'Stop'
$installPath = "E:\Programs\Elastic\ElasticSearch"
$packageArgs = @{
    packageName            = 'elasticsearch'
    fileType               = 'MSI'
    url                    = 'http://proget/endpoints/Installer/content/ElasticSearch/elasticsearch-6.1.0.msi'
    url64bit               = 'http://proget/endpoints/Installer/content/ElasticSearch/elasticsearch-6.1.0.msi'
    checksum               = '916B9479237FFF9F522A3528DD45BC43F5B50D9B6215D1B149C012FAF902C94C'
    checksum64             = '916B9479237FFF9F522A3528DD45BC43F5B50D9B6215D1B149C012FAF902C94C'
    checksumType           = 'sha256'
    checksumType64         = 'sha256'
    silentArgs             = "/quiet INSTALLDIR=$installPath\6.1.0 DATADIRECTORY=$installPath\Data CONFIGDIRECTORY=$installPath\Config LOGSDIRECTORY=$installPath\Logs /norestart /l*v `"e:\ElasticSearchInstall.log`""
    validExitCodes         = @(0)
  }
   
  Install-ChocolateyPackage @packageArgs
