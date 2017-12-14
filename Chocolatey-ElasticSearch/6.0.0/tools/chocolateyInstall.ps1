$packageArgs = @{
    packageName            = 'elasticsearch'
    fileType               = 'MSI'
    url                    = 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.msi'
    url64bit               = 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.msi'
    checksum               = 'CF18522ED4F81DE10E21E198632D25A6D1673F05B966F508730C5B0860054A26'
    checksum64             = 'CF18522ED4F81DE10E21E198632D25A6D1673F05B966F508730C5B0860054A26'
    checksumType           = 'sha256'
    checksumType64         = 'sha256'
    silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes         = @(0)
  }
   
  Install-ChocolateyPackage @packageArgs