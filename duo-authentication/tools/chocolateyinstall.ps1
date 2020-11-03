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
  url           = 'https://dl.duosecurity.com/duo-win-login-4.1.3.exe'
  checksum      = 'bc55a30d69336a482806c4da337ab8849aab59897868785d60afdc28deebb71d'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
