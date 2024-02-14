$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.2.0.1/windows/splunkforwarder-9.2.0.1-d8ae995bf219-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.2.0.1/windows/splunkforwarder-9.2.0.1-d8ae995bf219-x64-release.msi'
  checksum      = 'af2c6432e28f103beeb63cdb541e21f6deeff9c01afb10a763e7704483532f4f'
  checksum64    = '4f85cb909a72ff05b2a3257d8199d5ceaaeddd71b9d9de92a28b30cdb13e759b'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
