import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://duo.com/docs/checksums'

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

function global:au_BeforeUpdate { }
function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "duo-win-login-.*.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $version = $url -split '-|.exe' | select -Last 1 -Skip 1

    return @{
        URL32        = $url
        Version      = $version.Replace('v','')
        ReleaseNotes = "https://duo.com/docs/rdp-notes"
    }
}

update
