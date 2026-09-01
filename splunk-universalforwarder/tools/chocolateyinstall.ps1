$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.4.3/windows/splunkforwarder-10.4.3-3821aa1cef74-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.4.3/windows/splunkforwarder-10.4.3-4174a2deda5d-windows-x64.msi'
  checksum      = '51802619150c612233b38261042e2d37afe96307dfe784e076f25f32b6e9246f'
  checksum64    = '177da3cadacc644772dc51a77747a21b56ba763b1f379b8ffca91f0d51cac0c3'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
