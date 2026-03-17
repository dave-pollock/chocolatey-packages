$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.2.1/windows/splunkforwarder-10.2.1-5ca64727f5bc-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.2.1/windows/splunkforwarder-10.2.1-c892b66d163d-windows-x64.msi'
  checksum      = 'ef6fe2aecd40f102ffaccbb6ab3c2ac96ee4e99121ad6096b4b3b70a5fdab3b7'
  checksum64    = 'd0b7d3450bfa76d89826a8aa49b5ad7bf82a89ba4f0a202de1c912508e6e17ec'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
