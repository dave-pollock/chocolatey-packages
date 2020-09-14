﻿import-module au
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"= "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_BeforeUpdate {  }
function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {

    $download_page = Invoke-WebRequest -Uri "https://www.splunk.com/en_us/download/universal-forwarder.html" -UseBasicParsing -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"

    $x86matched = $download_page.Content -match 'data-filename="(splunkforwarder-\S+-x86-release\.msi)"'
    if ($x86matched) {
        $x86_filename = $matches[1]
    }
    Else
    {
        Write-Error "Could not find x86 file"
    }

    $x64matched = $download_page.Content -match 'data-filename="(splunkforwarder-\S+-x64-release\.msi)"'
    if ($x64matched) {
        $x64_filename = $matches[1]
    }
    Else
    {
        Write-Error "Could not find x64 file"
    }

    $version = ($x64_filename -split '-')[1]

    $x86_url = "https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=$version&product=universalforwarder&filename=$x86_filename&wget=true"
    $x64_url = "https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=$version&product=universalforwarder&filename=$x64_filename&wget=true"

    $release_notes = "https://docs.splunk.com/Documentation/Forwarder/$version/Forwarder/KnownIssues"

    return @{
        URL32        = $x86_url
        URL64        = $x64_url
        Version      = $version
        ReleaseNotes = $release_notes
    }
}

update
