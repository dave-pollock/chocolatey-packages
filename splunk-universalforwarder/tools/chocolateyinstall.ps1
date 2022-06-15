$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.0.0/windows/splunkforwarder-9.0.0-6818ac46f2ec-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.0.0/windows/splunkforwarder-9.0.0-6818ac46f2ec-x64-release.msi'
  checksum      = '8c3b9fb58325f050aa0b7207f727c529f268b8227bdcb090850668d6d6093737'
  checksum64    = 'ddd750300a949969c743753eec9af3270efc687d5f86ad954dca9e2d32d97941'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
