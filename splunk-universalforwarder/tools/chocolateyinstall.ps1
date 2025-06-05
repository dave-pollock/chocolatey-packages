$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.4.2/windows/splunkforwarder-9.4.2-ec45dd264916-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.4.2/windows/splunkforwarder-9.4.2-e9664af3d956-windows-x64.msi'
  checksum      = 'f85c241c44f1726465abd757cd2e9e200f5f023b2ea6bd39a550c30c2927ce54'
  checksum64    = '792971c8f8a81820f0bfe32935e50be3e7d38cc907b0540c23f599466919e8fb'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
