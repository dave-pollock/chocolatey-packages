$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.6.0.5/windows/splunkforwarder-10.6.0.5-3ed43cd7f073-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.6.0.5/windows/splunkforwarder-10.6.0.5-86587d4e3b27-windows-x64.msi'
  checksum      = '9e75b0bc52bb3e4e21683e6ae392ccd39c78b1bca3a78b8b6a7c937efea78535'
  checksum64    = 'fa0cb4ce9995edaed9b9663f284406d00de8b6c458f4c9c639319d988c5516a0'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
