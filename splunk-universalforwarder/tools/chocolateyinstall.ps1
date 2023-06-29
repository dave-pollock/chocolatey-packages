$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.1.0/windows/splunkforwarder-9.1.0-1c86ca0bacc3-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.1.0/windows/splunkforwarder-9.1.0-1c86ca0bacc3-x64-release.msi'
  checksum      = '4df23276513bc74da9fa95cd4a0e05ab3ba7c2e46098806600871cd7b46a59a0'
  checksum64    = '66feccfb133c8db1983fee07c69d87f10b02d3edb917c37c9fa5ffb0b92ca891'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
