$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.0.4/windows/splunkforwarder-9.0.4-de405f4a7979-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.0.4/windows/splunkforwarder-9.0.4-de405f4a7979-x64-release.msi'
  checksum      = '9554095619f58f13c8ca8431a9ea514c69802b943180f6b701f9d67f26bc21c8'
  checksum64    = 'c71e3e45b0c185b8493254be5c5b802bdc6c4b81141b19092fe21071f5b995a9'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
