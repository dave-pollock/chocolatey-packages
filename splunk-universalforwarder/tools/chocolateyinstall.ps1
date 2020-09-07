$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-x64-release.msi&wget=true'
  checksum      = 'bbde2a7f63c22559e4d096e2f6fffe2517bf3c1e0fe1dc0e67af9b619ead2c57'
  checksum64    = 'ad2c8969d6132252bd38b10f1f75cf85bdbbf3be1f191aaa38837ce19cf72c7a'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
