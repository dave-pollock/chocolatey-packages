import-module chocolatey-au
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://nr-downloads-main.s3.amazonaws.com/?delimiter=/&prefix=infrastructure_agent/windows/integrations/nri-mssql/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"= "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*fileType\s*=\s*)('.*')"   = "`$1'$($Latest.FileType)'"
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_BeforeUpdate {  }
function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $match = $download_page.Content | Select-String -Pattern '(windows/.*nri-mssql-amd64.*\.msi)'
    $url_suffix = $match.Matches[0].value

    $system_version = $url_suffix -split 'nri-mssql-amd64\.|.msi' | Select-String ^\d*\.\d*\.\d*$ | %{ new-object System.Version ($_) } | Sort-Object | Select-Object -Last 1
    $version = "$($system_version.Major).$($system_version.Minor).$($system_version.Build)"
    $url = "https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/windows/integrations/nri-mssql/nri-mssql-amd64.$($version).msi"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/microsoft-sql-server-monitoring-integration"
    }
}

update
