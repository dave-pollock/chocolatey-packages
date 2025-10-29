$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.22.0.msi'
  checksum      = '1e82b0869a738b43d3d10828d213b224165df65cb06595d979e8a633b5524ceb'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
