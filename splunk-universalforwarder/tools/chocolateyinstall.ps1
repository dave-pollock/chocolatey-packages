$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.3&product=universalforwarder&filename=splunkforwarder-8.1.3-63079c59e632-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.3&product=universalforwarder&filename=splunkforwarder-8.1.3-63079c59e632-x64-release.msi&wget=true'
  checksum      = '9810e24544d34e81f19e8ff811f13680313da8c8b2048aee956c4beef707ccc5'
  checksum64    = 'c407009c29af2ed0474f4b7bff950e92297f05cf631248fa0dd60c0d215d3045'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
