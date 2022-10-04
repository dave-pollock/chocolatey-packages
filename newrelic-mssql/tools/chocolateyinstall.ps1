$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://download.newrelic.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.8.6.msi'
  checksum      = '7c3d8341d850ca5471979e0fbc833edc72a8123a5c1f19cfbbbd93571730c1a5'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
