$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.1.3/windows/splunkforwarder-9.1.3-d95b3299fa65-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.1.3/windows/splunkforwarder-9.1.3-d95b3299fa65-x64-release.msi'
  checksum      = '51d09f9f9b1db3eae48f8af6fa7dc6df1d475dece824ca70701bc5542cfbb85e'
  checksum64    = '126c890a94f4167ad424017e7cbbc569d6f4d01402376f813ca08fd62fe8147c'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
