$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/9.4.3/windows/splunkforwarder-9.4.3-2ce54eec4eeb-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/9.4.3/windows/splunkforwarder-9.4.3-237ebbd22314-windows-x64.msi'
  checksum      = '120691f625bd9d314a2defb11fdfd8287854835cdfbf8d496c7f4ba119bbd2ba'
  checksum64    = '3d46e6cfdfd76034924875f8e3defab94b03e3bd72000662573accd5fb7f8200'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
