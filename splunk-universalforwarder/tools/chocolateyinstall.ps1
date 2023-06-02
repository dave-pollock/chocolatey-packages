$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.0.5/windows/splunkforwarder-9.0.5-e9494146ae5c-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.0.5/windows/splunkforwarder-9.0.5-e9494146ae5c-x64-release.msi'
  checksum      = 'e0f957067c770b41db4f6773349493a2ce305762ef41d762fe36dbda3b5ccfb0'
  checksum64    = 'be7d0694895560ae6339bcac5318e8efe949ae67110fecd4a2459432f0a80126'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
