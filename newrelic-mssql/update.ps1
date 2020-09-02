import-module au
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*[$]packageName\s*=\s*)('.*')"= "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*[$]fileType\s*=\s*)('.*')"   = "`$1'$($Latest.FileType)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL32)"
        }
    }
}

function global:au_BeforeUpdate {  }
function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {
    [xml]$bucket_listing = Invoke-WebRequest -Uri 'https://nr-downloads-main.s3.amazonaws.com/?delimiter=/&prefix=infrastructure_agent/windows/integrations/nri-mssql/'
    $latest_release = ($bucket_listing.ListBucketResult.Contents.Key | Sort-Object -Descending)[1]
    $url = "https://download.newrelic.com/$latest_release"
    $version = ($latest_release -split 'amd64.|.msi')[1]

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/microsoft-sql-server-monitoring-integration"
    }
}

update
