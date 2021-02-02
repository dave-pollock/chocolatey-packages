$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.2&product=universalforwarder&filename=splunkforwarder-8.1.2-545206cc9f70-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.2&product=universalforwarder&filename=splunkforwarder-8.1.2-545206cc9f70-x64-release.msi&wget=true'
  checksum      = '0185f6a18405fab876af058e9a5d76998bedf51608b6591e9b760cc58a9f50b4'
  checksum64    = '67a267e67089786f2166b60b23b5fb6cb1cfbbb945bea0d4dd159872b65715a8'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
