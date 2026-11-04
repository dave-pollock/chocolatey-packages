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
  url           = 'https://dl.duosecurity.com/duo-win-login-6.0.1.exe'
  checksum      = 'e5217ce869672ec818edea9afdcfbee3020eb66cee7f2d4a4586047e608f8c51'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
