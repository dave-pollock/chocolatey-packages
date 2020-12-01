$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.1.0.1&product=universalforwarder&filename=splunkforwarder-8.1.0.1-24fd52428b5a-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.1.0.1&product=universalforwarder&filename=splunkforwarder-8.1.0.1-24fd52428b5a-x64-release.msi&wget=true'
  checksum      = 'a3c7c28037276659ab95310ce0ae95eac3dbd3bb7792b6836c3c091947edaeae'
  checksum64    = '521be97831761275959b1d46087356ca4bf450ce51a353ee76d61f3e48ecab05'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
