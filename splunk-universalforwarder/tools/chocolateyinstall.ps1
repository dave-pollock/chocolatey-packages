$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.0.1/windows/splunkforwarder-10.0.1-51821f75b4ea-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.0.1/windows/splunkforwarder-10.0.1-c486717c322b-windows-x64.msi'
  checksum      = '58cec22ca203ccd4c1049345ba910eedd457f8e2903717b2e0bb8b8191d8b9b8'
  checksum64    = '3934bd66a8c0ad88305a41f3c4e1d27303ac8ca28d119792cd41028b70419c38'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
