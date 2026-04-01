$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.2.2/windows/splunkforwarder-10.2.2-979a540794c5-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.2.2/windows/splunkforwarder-10.2.2-80b90d638de6-windows-x64.msi'
  checksum      = '7f1809464945a86bd423b4e2bc3ddff7fb4b0c8b566825e9bcf529453afda95d'
  checksum64    = 'b80e8a992d3e367318dbb4a6c9843b9a2194945012c116697327a004054959cc'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
