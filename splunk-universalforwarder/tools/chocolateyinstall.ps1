$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=8.2.0&product=universalforwarder&filename=splunkforwarder-8.2.0-e053ef3c985f-x86-release.msi&wget=true'
  url64bit      = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=8.2.0&product=universalforwarder&filename=splunkforwarder-8.2.0-e053ef3c985f-x64-release.msi&wget=true'
  checksum      = 'd32b90c8126bd17299616f8fa57a00554c687d0bd65d5ab57187490beaa155a7'
  checksum64    = '02eed76dab43b7469ef89ab199e15e00150b6ea622a2a733f35be223d471b011'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
