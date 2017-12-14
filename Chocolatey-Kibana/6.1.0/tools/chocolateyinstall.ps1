$url  = 'http://proget/endpoints/Installer/content/Kibana/kibana-6.1.0-windows-x86_64.zip'
$basePath = "E:\Programs\Elastic\Kibana"
$exist = Test-Path $basePath
if ($exist -eq $false) {
    New-Item -ItemType Directory -Path $basePath 
}
$zipPath = "$basePath\Kibana6.1.0.zip"
Invoke-WebRequest -Uri $url -OutFile $zipPath 
Write-Output "Unzipping node_module is big)"
Expand-Archive -Path $zipPath -DestinationPath "$basePath" -Force
Remove-Item $zipPath -Force
$originFolder = Get-ChildItem $basePath
Rename-Item -Path $originFolder.FullName -NewName "Kibana"
if ($Service = Get-Service "Kibana" -ErrorAction SilentlyContinue) {
    if ($Service.Status -eq "Running") {
        Stop-Service Kibana
    }  
    #Using Carbon PS Module 
    Remove-Service kibana -Verbose

}
Invoke-Expression "nssm install kibana 'e:\Programs\Elastic\kibana\bin\kibana.bat'"
Start-Service Kibana

