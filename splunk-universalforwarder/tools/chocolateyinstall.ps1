$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.0.2/windows/splunkforwarder-10.0.2-6293d562290e-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.0.2/windows/splunkforwarder-10.0.2-e2d18b4767e9-windows-x64.msi'
  checksum      = '89d0b8e42d340db6c953f8407fc63bbf284e34a5d52975d04ee0f57d0156be47'
  checksum64    = '04a1effd0d2846eec4ffa74d4e09ec41a69ead3e798c6f7cae6bb0ddfaf63dd0'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
