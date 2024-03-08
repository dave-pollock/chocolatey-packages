$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Inject any custom parameters into the silentArgs
$silentArgs   = '/S /V"/qn'
$pp = Get-PackageParameters
ForEach ($key in $pp.Keys) {
  $silentArgs += " $key=" + $pp[$key]
}
$silentArgs += '"'

$packageArgs = @{
  packageName   = 'duo-authentication'
  softwareName  = 'Duo Authentication for Windows Logon*'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://dl.duosecurity.com/duo-win-login-4.3.0.exe'
  checksum      = '67eb371488f23b643875fcd9274f1f8c8d184baede884caf739a90fc9a02d855'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
