$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.4.0/windows/splunkforwarder-10.4.0-652ec96167cf-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.4.0/windows/splunkforwarder-10.4.0-f798d4d49089-windows-x64.msi'
  checksum      = '5894ba05f92307457a274ded241b8e7d848f73cb3a2af2e73554609ba3a5aaef'
  checksum64    = '2fe8d69d526c3b04071ea4cdd96262d0b235eac24d658dee31a87d2998d1d0c5'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
