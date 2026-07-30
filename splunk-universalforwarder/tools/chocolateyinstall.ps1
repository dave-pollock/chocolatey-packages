$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.4.2/windows/splunkforwarder-10.4.2-af91675d71c9-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.4.2/windows/splunkforwarder-10.4.2-33c3bf42cd73-windows-x64.msi'
  checksum      = '7b8af84c26247cc1ad4a409ffdd84ba3b9940bb56ceea49f15b14e11063f01ad'
  checksum64    = '5ff1869fd1417d8af79e3a1b74635ae1d69ad7002563b9cad5d517023a58cb00'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
