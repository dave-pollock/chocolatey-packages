﻿$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'newrelic-mssql'
  softwareName  = 'New Relic Infrastructure Integration, nri-mssql*'
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.2.20.0.msi'
  checksum      = 'f4e8d29063579372e7f5efa766aeb4c4a9fc1d6de154a5a66d3368a4ce4fd956'
  checksumType  = 'sha256'
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}

Install-ChocolateyPackage @packageArgs
