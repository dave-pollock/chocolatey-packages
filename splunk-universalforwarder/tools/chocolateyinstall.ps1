$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://d7wz6hmoaavd0.cloudfront.net/products/universalforwarder/releases/8.2.2.1/windows/splunkforwarder-8.2.2.1-ae6821b7c64b-x86-release.msi'
  url64bit      = 'https://d7wz6hmoaavd0.cloudfront.net/products/universalforwarder/releases/8.2.2.1/windows/splunkforwarder-8.2.2.1-ae6821b7c64b-x64-release.msi'
  checksum      = '717E0964CECD9CA6817AE80748CF3CC66762C3612DB04D971982D463A206754A'
  checksum64    = 'FA2762A5FB8BD35D226D602AE228381B9273164551EAE1D4B157D5E29B6530F1'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
