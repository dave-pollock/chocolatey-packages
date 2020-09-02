$ErrorActionPreference = 'Stop';

$packageName   = 'newrelic-mssql'
$fileType     = 'msi'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'http://download.newrelic.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.5.1.msi'
$silentArgs   = '/qn /norestart'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = $fileType
  url           = $url
  checksum      = '8a54dc0faef9601049942b82f65edbcb7c652b47c12d8c4dab46a237554b3125'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
