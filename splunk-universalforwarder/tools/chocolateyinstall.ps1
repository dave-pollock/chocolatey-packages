$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.1.1/windows/splunkforwarder-9.1.1-64e843ea36b1-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.1.1/windows/splunkforwarder-9.1.1-64e843ea36b1-x64-release.msi'
  checksum      = '7dc8367502f74a5970720d320701b5c54f1f077e9a9b1dfc05aab074f2d01fde'
  checksum64    = '6d8f5772f35f69215a302843c451845b336cbf222f61ae3a78d6c00929bd3994'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
