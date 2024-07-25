$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.3.0/windows/splunkforwarder-9.3.0-aa2a96a59f7e-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.3.0/windows/splunkforwarder-9.3.0-51ccf43db5bd-x64-release.msi'
  checksum      = '357e4bdfa95d9a3bcaf0b3de6b5ac5e939d26e4c1383997a7678edb081da9279'
  checksum64    = 'b4abe2f4d31e56813f8b40f8c92d63d4f4309a0a8a2ba6c23f11fdc2fc194262'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
