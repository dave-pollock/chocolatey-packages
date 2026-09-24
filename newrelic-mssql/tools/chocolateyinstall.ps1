$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.38.1.msi'
  checksum      = '5519d4949c4695f793887a4aeed8b654fe27f0f19d41fd7942bc2bb56fa10d90'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
