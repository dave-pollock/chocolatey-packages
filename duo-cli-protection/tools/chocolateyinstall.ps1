$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'duo-cli-protection'
  softwareName  = 'Duo Command Line Protection*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://dl.duosecurity.com/duo-command-line-protection-1.0.0.msi'
  checksum      = '0a22103f7131ef5e4cc1eccd7443e2f14266fe597cae1aa57e99b4021ad7e651'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
