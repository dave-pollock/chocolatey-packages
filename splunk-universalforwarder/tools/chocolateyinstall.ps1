$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.4&product=universalforwarder&filename=splunkforwarder-8.1.4-17f862b42a7c-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.4&product=universalforwarder&filename=splunkforwarder-8.1.4-17f862b42a7c-x64-release.msi&wget=true'
  checksum      = 'd1d2967a8c1465e31edb54b0d4f0d2a792fa5d0756b63f4b2261f7ae0a6beaf2'
  checksum64    = '000328b62953dbf26621c7b199634aecfe9466b98e592ca621a2d627a775cbad'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
