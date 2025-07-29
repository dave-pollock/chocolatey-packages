$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.0.0/windows/splunkforwarder-10.0.0-ea5bfadeac3a-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.0.0/windows/splunkforwarder-10.0.0-e8eb0c4654f8-windows-x64.msi'
  checksum      = 'd68e4da8d8ba02b7563598d4cf5bdd9642ad961fa57e8f0dfec998f85894d416'
  checksum64    = 'ed0f1a1733ef3f48de366027d6ea9c9f4580f0327ac0b1ee6b79db075055a447'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
