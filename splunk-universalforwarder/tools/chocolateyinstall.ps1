$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/windows/splunkforwarder-9.1.0.1-77f73c9edb85-x86-release.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/windows/splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi'
  checksum      = 'b5b82fd761bb5a217efc07fcbed90b6477e3744f48eda2a11406d1ece626c63a'
  checksum64    = '113ac28ecb657dc2d1b7fb8b4ff999a15e10089a5223cdd69522a440b1c48f66'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
