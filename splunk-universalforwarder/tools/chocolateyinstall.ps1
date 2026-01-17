$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.2.0/windows/splunkforwarder-10.2.0-11d9b4866399-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.2.0/windows/splunkforwarder-10.2.0-d749cb17ea65-windows-x64.msi'
  checksum      = '35a91c5447830bc0693162b82a75a27eb1a86b59f180547e02bc02ca087c3a85'
  checksum64    = '54cc10d7b25ebb22ee71f36a63db5cdbfb5d3a4d4644ea5e1fb8791ad370fcb3'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
