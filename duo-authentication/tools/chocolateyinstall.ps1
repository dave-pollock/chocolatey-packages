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
  url           = 'https://dl.duosecurity.com/duo-win-login-4.2.2.exe'
  checksum      = '37a961f7a40f06825b4c4999adc69a9a78ca2128b0f4159439116be24410f1f6'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
