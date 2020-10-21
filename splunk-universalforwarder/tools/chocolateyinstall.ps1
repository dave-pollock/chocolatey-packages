$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.0&product=universalforwarder&filename=splunkforwarder-8.1.0-f57c09e87251-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.0&product=universalforwarder&filename=splunkforwarder-8.1.0-f57c09e87251-x64-release.msi&wget=true'
  checksum      = '221dcda81150306a90de8be84af437f7c26d3baf8b8ded2d23cce1fcd362b1ca'
  checksum64    = 'a088b9a55a50dd1a3bcc7948d25fbff237c91c8f2855f45d2ad96ba8ed87767e'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
