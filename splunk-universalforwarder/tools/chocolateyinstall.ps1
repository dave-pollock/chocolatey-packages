$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.0.0.1/windows/splunkforwarder-9.0.0.1-9e907cedecb1-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.0.0.1/windows/splunkforwarder-9.0.0.1-9e907cedecb1-x64-release.msi'
  checksum      = '29046a25129149597c8b420da5302ae8ac690cdc89997dc9674ab97f5b9a95c7'
  checksum64    = 'bf5fbe7b14e5db57422fe6acb1ba19c531134c16807bf324fc68fe5c052901e2'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
