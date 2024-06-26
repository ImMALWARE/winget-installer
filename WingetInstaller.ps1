$wc = New-Object net.webclient
cd $env:temp
$wc.DownloadFile('https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx', "$env:temp\VCLibs.appx")
Add-AppPackage -Path VCLibs.appx -Verbose
Write-Host "Ждите, это долго, скачивается файл 200 МБ"
$wc.DownloadFile('https://github.com/microsoft/winget-cli/releases/download/v1.8.1762/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle', "$env:temp\DesktopAppInstaller.msixbundle")
$wc.DownloadFile('https://raw.githubusercontent.com/ImMALWARE/winget-installer/main/Microsoft.UI.Xaml.2.8.appx', "$env:temp\UIXaml.appx")
Add-AppxPackage -Path UIXaml.appx -Verbose
Add-AppxPackage -Path DesktopAppInstaller.msixbundle -Verbose
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.Forms.MessageBox]::Show('Winget is installed!')