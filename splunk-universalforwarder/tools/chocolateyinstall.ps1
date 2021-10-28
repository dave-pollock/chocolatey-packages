$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/8.2.3/windows/splunkforwarder-8.2.3-cd0848707637-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/8.2.3/windows/splunkforwarder-8.2.3-cd0848707637-x64-release.msi'
  checksum      = 'db54896fe9ea4527160549e3945a91eef2db37c0740002aa3d5e3946c7523d24'
  checksum64    = '5b5e14a75b0cf79bfb76c2b98e484f1dfe99dd34616177aeac394809764dc8f2'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
