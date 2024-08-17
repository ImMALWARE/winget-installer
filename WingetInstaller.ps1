$wc = New-Object net.webclient
cd $env:temp
$wc.DownloadFile('https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx', "$env:temp\VCLibs.appx")
Add-AppPackage -Path VCLibs.appx -Verbose
Write-Host "200 MB file is downloading, this will take some minutes."
$wc.DownloadFile('https://github.com/microsoft/winget-cli/releases/download/v1.8.1762/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle', "$env:temp\DesktopAppInstaller.msixbundle")
$wc.DownloadFile('https://raw.githubusercontent.com/ImMALWARE/winget-installer/main/Microsoft.UI.Xaml.2.8.appx', "$env:temp\UIXaml.appx")
$wc.DownloadFile('https://github.com/microsoft/winget-cli/releases/download/v1.8.1762/fc2c4f481bae4326b6104907449dad99_License1.xml', "$env:temp\License1.xml")
Add-AppxPackage -Path UIXaml.appx -Verbose
Add-AppxProvisionedPackage -Online -PackagePath DesktopAppInstaller.msixbundle -LicensePath License1.xml -Verbose
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.Forms.MessageBox]::Show('Winget is installed!')