$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.28.0.msi'
  checksum      = 'f5fedd251f208d7ed5e2f9f0653ba18847a343c30f6cd4512b9cf4d6853662ad'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
