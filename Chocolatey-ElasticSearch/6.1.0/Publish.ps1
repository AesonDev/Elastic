# requierd :  Set API Key in $env
Get-ChildItem
choco source
choco pack
choco push .\elasticsearch.6.1.0.nupkg -source http://proget/nuget/Chocolatey/ --api-key $env:ChocoApiKey --force