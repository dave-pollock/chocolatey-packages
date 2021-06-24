$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.2.1&product=universalforwarder&filename=splunkforwarder-8.2.1-ddff1c41e5cf-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.2.1&product=universalforwarder&filename=splunkforwarder-8.2.1-ddff1c41e5cf-x64-release.msi&wget=true'
  checksum      = '3b0a6e0c3c9e4def10af59173d87d27c9175f004c143383332624a3635fbee6a'
  checksum64    = 'c89bf4c819e96bf1d36b375037eeb9aea125aae5ed3c737e36c28275018505c1'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
