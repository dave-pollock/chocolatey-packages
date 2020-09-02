$ErrorActionPreference = 'Stop';

$packageName = 'duo-authentication'
$fileType = 'exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.duosecurity.com/duo-win-login-4.1.1.exe'
$silentArgs   = '/S /V"/qn'

# Inject any custom parameters into the silentArgs
$pp = Get-PackageParameters
ForEach ($key in $pp.Keys) {
  $silentArgs += " $key=" + $pp[$key]
}

$silentArgs += '"'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Duo Authentication for Windows Logon*'
  unzipLocation = $toolsDir
  fileType      = $fileType
  url           = $url
  checksum      = '5f5549d93893625c7935c6307793a8d183bb71dff68886f6634160f047e0217d'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
}

Install-ChocolateyPackage @packageArgs
