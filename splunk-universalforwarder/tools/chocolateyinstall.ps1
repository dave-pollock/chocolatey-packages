$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.0.2/windows/splunkforwarder-9.0.2-17e00c557dc1-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.0.2/windows/splunkforwarder-9.0.2-17e00c557dc1-x64-release.msi'
  checksum      = '77f197500bb9fc0d494a3281f08d95840dcb19ed2b610eb686ec48a37bcf6742'
  checksum64    = 'c00349255994f8aa58b64b140b87fd308606e78b32650ee0908892ad55eeaebc'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
