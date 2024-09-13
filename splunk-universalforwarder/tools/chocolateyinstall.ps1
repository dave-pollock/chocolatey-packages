$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.3.1/windows/splunkforwarder-9.3.1-ee2724eb9973-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.3.1/windows/splunkforwarder-9.3.1-0b8d769cb912-x64-release.msi'
  checksum      = '4b6217153a8b04b5e4ddc96c30ae7e10b98dde9d1e9b26f6ac9d29e59ec6e041'
  checksum64    = 'db06ad3a0b05413e65f9fcccba7f12532bdb83ec8bc33f06bb2cddbf3e021949'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
