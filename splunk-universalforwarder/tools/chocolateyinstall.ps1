$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.4.4/windows/splunkforwarder-10.4.4-7457b7ff93a1-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.4.4/windows/splunkforwarder-10.4.4-f0f12fcdcaa1-windows-x64.msi'
  checksum      = '74b5ae9d17e7655fc521b883be3ce40d4de988a55acdb8e6639d371e2f10f6ce'
  checksum64    = 'be31d57f5fb58c2d9e1e76f65670e6bdc86009394592d0a426504a8c8f197dee'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
