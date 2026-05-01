$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.2.3/windows/splunkforwarder-10.2.3-6360f015cdfb-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.2.3/windows/splunkforwarder-10.2.3-4d61cf8a5c0c-windows-x64.msi'
  checksum      = 'b2f628d9b2401736a7a2c57849c885837d4b56af746deed096ffc6d6a6ac932f'
  checksum64    = 'd2ae6332be073844a73f114530aaa8be1cae5a896028a81dbe4e2843c8dd0eb1'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
