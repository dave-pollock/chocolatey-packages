$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.2.2/windows/splunkforwarder-9.2.2-d76edf6f0a15-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.2.2/windows/splunkforwarder-9.2.2-d76edf6f0a15-x64-release.msi'
  checksum      = 'e75930934d6ed25c643dc1e4f23e826ed058940009715fe1853caef3171654de'
  checksum64    = '4f8cd52c1e74109f86b7c06b5dc6525201b88d10a99e253031811a2573f07d87'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
