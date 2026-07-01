$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'splunk-universalforwarder'
  softwareName  = 'UniversalForwarder*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.splunk.com/products/universalforwarder/releases/10.4.1/windows/splunkforwarder-10.4.1-248b1216129c-windows-x86.msi'
  url64bit      = 'https://download.splunk.com/products/universalforwarder/releases/10.4.1/windows/splunkforwarder-10.4.1-5a009d941268-windows-x64.msi'
  checksum      = '732589d370eff296d88763d9b51f28f64e8101648686818c34bb300a1ce4eb78'
  checksum64    = '41d0059ce81470e13bbf52c1ed6d4951d57bd1927031ff7be9f627e6e2f1e54a'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
