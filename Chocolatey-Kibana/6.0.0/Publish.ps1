# requierd :  Set API Key in $env
Get-ChildItem
choco source
choco pack
choco push .\kibana.6.0.0.nupkg -source http://proget/nuget/Chocolatey/ --api-key $env:ChocoApiKey --force