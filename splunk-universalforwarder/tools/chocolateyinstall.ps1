$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.6.2.5/windows/splunkforwarder-10.6.2.5-1e5965545ce6-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.6.2.5/windows/splunkforwarder-10.6.2.5-b07ce3b48d58-windows-x64.msi'
  checksum      = '571303a16dce230047b747cadbd0837979fb1c66adf54f4056c108c68e3adb37'
  checksum64    = '711f56b2dedbc7ef3e517fca25fb29df1390efd8c0cfc17a40592414881b268d'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
