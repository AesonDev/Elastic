Configuration ServerConfig {
    Import-DscResource -ModuleName cchoco

    node localhost {
        cChocoPackageInstaller elasticsearch {
            Ensure = 'Present'
            Name = "elasticsearch"
            Version = "6.1.0"
            Source = "http://proget/nuget/Chocolatey/"
            chocoParams = " --failstderr"
        }

        cChocoPackageInstaller kibana {
            Ensure = 'Present'
            Name = "kibana"
            Version = "6.1.0"
            Source = "http://proget/nuget/Chocolatey/"
            chocoParams = " --failstderr"
        }
    }
}

$path = "E:\DSCConfig"
ServerConfig -OutputPath $path -Verbose 
Start-DscConfiguration -Path $path -Wait -Force -Verbose 