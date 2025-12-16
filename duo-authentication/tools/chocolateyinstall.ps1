$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Inject any custom parameters into the silentArgs
$silentArgs   = '/S /V"REBOOT=ReallySuppress /qn /norestart'
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
  url           = 'https://dl.duosecurity.com/duo-win-login-5.2.1.exe'
  checksum      = 'b2715f00fef9a92155c3234ddc9ad797fde3800114f675cfe379b2a339d4bd19'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
