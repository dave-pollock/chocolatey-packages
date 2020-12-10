$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.1&product=universalforwarder&filename=splunkforwarder-8.1.1-08187535c166-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.1&product=universalforwarder&filename=splunkforwarder-8.1.1-08187535c166-x64-release.msi&wget=true'
  checksum      = '4685626a2122d3708b6d03f04006215f8d11fa727a0747165e7464336b1a0123'
  checksum64    = '547bb6732a6e05ebd98bbdc3a88b03522c278c9c2bfa4018802e16c1cdd745db'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
