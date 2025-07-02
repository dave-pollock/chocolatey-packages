$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.19.0.msi'
  checksum      = 'd6a4a6e062d3d5c495b558606c10b720cdf35aa8f2d3996e5e513a944f3c69db'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
