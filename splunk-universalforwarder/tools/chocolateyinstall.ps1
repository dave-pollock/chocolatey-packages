$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/8.2.6/windows/splunkforwarder-8.2.6-a6fe1ee8894b-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/8.2.6/windows/splunkforwarder-8.2.6-a6fe1ee8894b-x64-release.msi'
  checksum      = 'b077e26c0f1537e6487b9f3fd03eb915633619b09b725bc22fbf03901c91b8bf'
  checksum64    = '50bbc0aed4614a1aad169c7745dd4138c99f6e07b1d909c0988645d29a8896f2'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
