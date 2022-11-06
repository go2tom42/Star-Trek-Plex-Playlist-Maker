<# MUST CHANGE #>
$DefaultPlexServer = [pscustomobject]@{
    Username="Username";
    Token="Token";
    UserToken= ""; <#Only needed if you use Managed Accounts#>
    PlexServer="Smeghead";
    PlexServerHostname="192.168.11.188";
    Protocol="http";
    Port="32400";
    Default="True";
}

$ENTLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Enterprise#>
$STSLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Shorts#>
$TOSLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek#>
$DISLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Discovry#>
$SNWLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Stange New Worlds#>
$TASLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Animated#>
$TOS_FILMSLibrary = "4K"; <#Name of Plex Library that contains Star Trek TOS Films#>
$TNGLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: The Next Generation#>
$DS9Library = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Deep Space Nine#>
$VOYLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Voyager#>
$TNG_FILMSLibrary = "Movies Normalized"; <#Name of Plex Library that contains Star Trek TNG Films#>
$LDLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Lower Decks#>
$PROLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Prodigy#>
$ALT_FILMSLibrary = "Movies Normalized"; <#Name of Plex Library that contains Star Trek ALT Tine line films:#>
$PICLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Picard#>

<# CAN CHANGE #>
$00Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/00.png";
$01Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/01.png";
$02Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/02.png";
$03Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/03.png";
$04Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/04.png";
$05Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/05.png";
$06Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/06.png";
$07Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/07.png";
$08Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/08.png";
$09Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/09.png";
$10Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/10.png";
$11Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/11.png";
$12Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/12.png";
$13Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/13.png";
$14Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/14.png";
$15Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/15.png";
$16Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/16.png";
$17Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/17.png";
$18Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/18.png";


<# NEVER CHANGE#>
$PSDefaultParameterValues["Invoke-RestMethod:UseBasicParsing"] = $true
$PSDefaultParameterValues["Invoke-RestMethod:Headers"] = @{"Accept" = "application/json, text/plain, */*" }
$PSDefaultParameterValues["Invoke-RestMethod:ErrorAction"] = "Stop"
$PSDefaultParameterValues["Invoke-WebRequest:UseBasicParsing"] = $true
$PSDefaultParameterValues["Invoke-WebRequest:Headers"] = @{"Accept" = "application/json, text/plain, */*" }
$PSDefaultParameterValues["Invoke-WebRequest:ErrorAction"] = "Stop"

function Find-PlexItem {
    <#
		.SYNOPSIS
			This function uses the search ability of Plex find items on your Plex server.
		.DESCRIPTION
			This function uses the search ability of Plex find items on your Plex server.
			As objects returned have different properties depending on the type, there is
			an option to refine this by type.
		.PARAMETER ItemName
			Name of what you wish to find.
		.PARAMETER ItemType
			Refines the output by type.
		.PARAMETER Year
			Refine by year.
		.PARAMETER ExactNameMatch
			Return only items matching exactly what is specified as ItemName.
		.EXAMPLE
			# Find only 'movies' from the Plex server that (fuzzy)match 'The Dark Knight'.
			Find-PlexItem -ItemName 'The Dark Knight' -ItemType 'movie'
		.EXAMPLE
			# Find items that match exactly 'The Dark Knight' from the library 'Films'.
			Find-PlexItem -ItemName 'The Dark Knight' -ExactNameMatch -LibraryTitle 'Films'
		.EXAMPLE
			# Find items that (fuzzy)match 'Spider' from the library 'TV'.
			Find-PlexItem -ItemName 'spider' -LibraryTitle 'TV'
	#>

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true)]
        [String]
        $ItemName,

        [Parameter(Mandatory = $false)]
        [ValidateSet('movie', 'episode')]
        [String]
        $ItemType,

        [Parameter(Mandatory = $false)]
        [String]
        $LibraryTitle,

        [Parameter(Mandatory = $false)]
        [Int]
        $Year,

        [Parameter(Mandatory = $false)]
        [Switch]
        $ExactNameMatch
    )


    $RestEndpoint = "hubs/search/"

    # URLEncode the title, otherwise we'll get '400 bad request' errors when searching for things like: Bill and Ted's ...
    $ItemNameEncoded = [System.Web.HttpUtility]::UrlEncode($ItemName)


    #############################################################################
    Write-Verbose -Message "Searching for $ItemName."
    try {
        [array]$Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/$RestEndpoint`?`includeCollections=0&sectionId=&query=$($ItemNameEncoded)&limit=50&X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET -ErrorAction Stop
    }
    catch {
        throw $_
    }


    #############################################################################
    # Refine by type:
    if ($ItemType) {
        $Results = ($Data.MediaContainer.Hub | Where-Object { $_.type -eq $ItemType -and $_.Size -gt 0 }).Metadata
    }
    else {
        $Results = ($Data.MediaContainer.Hub | Where-Object { $_.Size -gt 0 }).Metadata
    }

    if ($Results.Count -gt 0) {
        # Refine by the ItemName to attempt an exact match:
        if ($ExactNameMatch) {
            [Array]$Results = $Results | Where-Object { $_.title -eq $ItemName }
            # There could still be more than one result with an exact title match due to the same item being in multiple libraries
            # or even in the same library!
            if ($Results.count -gt 1) {
                Write-Warning -Message "Exact match was specified but there was more than 1 result for $ItemName."
            }
        }

        # Refine by library name:
        if ($LibraryTitle) {
            # Sometimes they come back with 'reasonTitle'. Makes sense, not.
            Write-Verbose "Refining multiple results by library"
            [Array]$Results = $Results | Where-Object { $_.librarySectionTitle -eq $LibraryTitle -or $_.reasonTitle -eq $LibraryTitle }
        }

        if ($Year) {
            #[Array]$Results = $Results | Where-Object { ($_.originallyAvailableAt.split('-')[0]) -match $Year }
            Write-Verbose "Refining results by Year: $Year"
            [Array]$Results = $Results | Where-Object { ($_.originallyAvailableAt.split('-')[0]) -match $Year }
        }

        # Add datetime objects so we don't have to work with unixtimes...
        $Results | ForEach-Object {
            if ($Null -ne $_.lastViewedAt) { $_ | Add-Member -NotePropertyName 'lastViewedAtDateTime' -NotePropertyValue (ConvertFrom-UnixTime $_.lastViewedAt) -Force }
            if ($Null -ne $_.addedAt) { $_ | Add-Member -NotePropertyName 'addedAtDateTime' -NotePropertyValue (ConvertFrom-UnixTime $_.addedAt) -Force }
            if ($Null -ne $_.updatedAt) { $_ | Add-Member -NotePropertyName 'updatedAtDateTime' -NotePropertyValue (ConvertFrom-UnixTime $_.updatedAt) -Force }
        }

        return $Results
    }
    else {
        Write-Verbose -Message "No result found."
        return
    }
}
Function ConvertFrom-UnixTime($UnixDate) {
    [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($UnixDate))
}
function Get-PlexItem {
    <#
		.SYNOPSIS
			Get a specific item from Plex.
		.DESCRIPTION
			Get a specific item from Plex.
		.EXAMPLE
			# Get a single item by Id:
			Get-PlexItem -ItemID 204
		.EXAMPLE
			# Get all items from the library called 'Films'.
			# NOTE: Not all data for an item is returned this way.
			$Items = Get-PlexItem -LibraryTitle Films

			# Get all data for the above items:
			$AllData = $Items | % { Get-PlexItem -Id $_.ratingKey }
	#>

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Id')]
        [String]
        $Id,

        [Parameter(Mandatory = $true, ParameterSetName = 'Library')]
        [String]
        $LibraryTitle
    )

    if ($Id) {
        Write-Verbose -Message "Get item by Id"
        $RestEndpoint = "library/metadata/$Id"
    }
    elseif ($LibraryTitle) {
        Write-Verbose -Message "Get items in library"
        $Library = Get-PlexLibrary | Where-Object { $_.title -eq $LibraryTitle }
        if (!$Library) {
            throw "No such library. Run Get-PlexLibrary to see a list."
        }
        else {
            if ($Library.key) {
                $RestEndPoint = "library/sections/$($Library.key)/all"
                if ($Library.Type -eq 'movie') {
                    $Params = [Ordered]@{
                        type                 = 1
                        sort                 = 'titleSort'
                        includeCollections   = 1
                        includeExternalMedia = 1
                        includeGuids         = 1
                    }
                }
                elseif ($Library.type -eq 'show') {
                    $Params = [Ordered]@{
                        sort         = 'titleSort'
                        includeGuids = 1
                    }
                }
            }
            elseif ($Library.librarySectionID) {
                $RestEndPoint = "library/sections/$($Library.librarySectionID)/all"
                $Params = [Ordered]@{
                    sort         = 'titleSort'
                    includeGuids = 1
                }
            }
            else {
                throw "Unable to determine library key/id/sectionId"
            }

            [String]$ExtraParamString = (($Params.GetEnumerator() | ForEach-Object { $_.Name + '=' + $_.Value }) -join '&') + "&"
        }
    }
    else {

    }


    #############################################################################
    try {
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/$RestEndpoint`?$($ExtraParamString)X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET

        # The metadata returned from Plex often contains duplicate values which breaks the conversion into JSON. Known cases:
        # guid and Guid
        # rating and Rating
        # The uppercase versions seem to be arrays of richer data, e.g. Guid contains IDs from various other metadata sources, as does Rating.

        # Let's go with renaming the lowercase keys. Using .Replace rather than -replace as it should be faster.
        $Data = $Data.toString().Replace('"guid"', '"_guid"').Replace('"rating"', '"_rating"')
        # Convert back into JSON:
        $Data = $Data | ConvertFrom-Json
        # Return the required subproperty:
        return $Data.Mediacontainer.Metadata
    }
    catch {
        throw $_
    }

}

function Get-PlexServer {
	

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $false)]
        [String]
        $Name
    )

    #Region Get Servers
    try {
        $Data = Invoke-RestMethod -Uri "https://plex.tv/api/servers`?`X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET -UseBasicParsing
        if ($Name) {
            [array]$Results = $Data.MediaContainer.Server | Where-Object { $_.name -eq $Name }
        }
        else {
            [array]$Results = $Data.MediaContainer.Server
        }
    }
    catch {
        throw $_
    }
    #EndRegion

    return $Results
}

function Add-PlexItemToPlaylist {
    [CmdletBinding(SupportsShouldProcess)]
    <#
		.SYNOPSIS
			Copies a single item to a playlist.
		.DESCRIPTION
			Copies a single item to a playlist.
		.PARAMETER PlaylistId
			The id of the playlist.
		.PARAMETER ItemId
			The id of the item.
		.EXAMPLE
			# Add an item to a playlist on the default plex server
			Add-PlexItemToPlaylist -PlaylistId 12345 -ItemId 7204
	#>

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true)]
        [String]
        $PlaylistId,

        [Parameter(Mandatory = $true)]
        [String]
        $ItemId
    )

    Write-Verbose -Message "Function: $($MyInvocation.MyCommand): Getting list of Plex servers (to get machine identifier)"
    try {
        $CurrentPlexServer = Get-PlexServer -Name $DefaultPlexServer.PlexServer -ErrorAction Stop
        if (!$CurrentPlexServer) {
            throw "Could not find $CurrentPlexServer in $($Servers -join ', ')"
        }
    }
    catch {
        throw $_
    }


    #############################################################################
    $RestEndpoint = "playlists/$PlaylistID/items?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemID"


    #############################################################################
    Write-Verbose -Message "Function: $($MyInvocation.MyCommand): Adding item to playlist."
    try {
        Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/$RestEndpoint`?&X-Plex-Token=$($DefaultPlexServer.Token)" -Method PUT -ErrorAction Stop | Out-Null
    }
    catch {
        throw $_
    }
}

function Get-PlexPlaylist {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $false)]
        [String]
        $Id,

        [Parameter(Mandatory = $false)]
        [Switch]
        $IncludeItems,

        [Parameter(Mandatory = $false)]
        [String]
        $AlternativeToken
    )

    $RestEndpoint = "playlists/$Id"


    #############################################################################
    Write-Verbose -Message "Function: $($MyInvocation.MyCommand): Getting playlist(s)"
    try {
        if ($AlternativeToken) {
            $Token = $AlternativeToken
        }
        else {
            $Token = $DefaultPlexServer.Token
        }


        # Plex decided to automatically create Playlists with heart emojis in for music playlists.
        # When calling Invoke-RestMethod, PowerShell ends up converting these to squiggly a characters.
        # To work around this, we have to use Invoke-WebRequest and take the RawContentStream property
        # and use that.
        $Data = Invoke-WebRequest -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/$RestEndpoint`?`X-Plex-Token=$($Token)" -ErrorAction Stop
        if ($Data) {
            $UTF8String = [system.Text.Encoding]::UTF8.GetString($Data.RawContentStream.ToArray())
            [array]$Results = ($UTF8String | ConvertFrom-Json).MediaContainer.Metadata
        }
        else {
            return
        }
    }
    catch {
        throw $_
    }


    #############################################################################
    if ($IncludeItems) {
        foreach ($Playlist in $Results) {
            $RestEndpoint = "playlists/$($Playlist.ratingKey)/items"
            Write-Verbose -Message "Function: $($MyInvocation.MyCommand): Getting and appending playlist item(s)"
            try {
                [array]$Items = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/$RestEndpoint`?`X-Plex-Token=$($DefaultPlexServer.Token)" -ErrorAction Stop
                $Playlist | Add-Member -NotePropertyName 'Items' -NotePropertyValue $Items.MediaContainer.Metadata
            }
            catch {
                throw $_
            }
        }
    }

    #############################################################################
    # Append type and return results
    $Results | ForEach-Object { $_.psobject.TypeNames.Insert(0, "PSPlex.Playlist") }
    return $Results
}

function Show-TrekArt {
    Clear-Host
    Write-Host "                                         .                                   "
    Write-Host "                                        .:.                                  "
    Write-Host "                                       .:::.                                 "
    Write-Host "                                      .:::::.                                "
    Write-Host "                                  ***.:::::::.***                            "
    Write-Host "                             *******.:::::::::.*******                       "
    Write-Host "                           ********.:::::::::::.********                     "
    Write-Host "                          ********.:::::::::::::.********                    "
    Write-Host "                          *******.::::::'***`::::.*******                    "
    Write-Host "                          ******.::::'*********`::.******                    "
    Write-Host "                           ****.:::'*************`:.****                     "
    Write-Host "                             *.::'*****************`.*                       "
    Write-Host "                             .:'  ***************    .                       "
    Write-Host "                            .                                                "
    Write-Host "                                                                             "
    Write-Host "            ______ _______ ______ ______    _______ ______  ______ __  __    "
    Write-Host "           / __  //__  __// __  // __  /   /__  __// __  / / ____// / / /    "
    Write-Host "          / / /_/   / /  / /_/ // /_/ /      / /  / /_/ / / /__  / //'/'     "
    Write-Host "          _\ \     / /  / __  //   __/      / /  /   __/ / __ / /  '/'       "
    Write-Host "        / /_/ /   / /  / / / // /\ \       / /  / /\ \  / /___ / /\ \        "
    Write-Host "       /_____/   /_/  /_/ /_//_/  \_\     /_/  /_/  \_\/_____//_/  \_\       "
    Write-Host "                                                                             "
    Write-Host "                                                                             "
    Write-Host "                                              _____                          "
    Write-Host "                                     __...---'-----`---...__                 "
    Write-Host "                                _===============================             "
    Write-Host "               ______________,/'      `---..._______...---'                  "
    Write-Host "              (____________LL). .    ,--'                                    "
    Write-Host "               /    /.---'       `. /                                        "
    Write-Host "              '--------_  - - - - _/                                         "
    Write-Host "                        `~~~~~~~~'                                           "
}

function Show-KlingArt {
    Clear-Host
    Write-Host "                                     _                                 "
    Write-Host "                                   _|_|_                               "
    Write-Host "                                 ^/ . ..\^                             "
    Write-Host "                             ___[=========]___                         "
    Write-Host '                  ___-==++""" .  /. . .  \ .  """++==-___              '
    Write-Host '            __-+"" __\   .. . .  | ..  . |  . .  .   /__ ""+-__        '
    Write-Host '           /\__+-""   `-----=====\_ <O> _/=====-----"   ""-+__/\       '
    Write-Host '         _/_/                      ""=""                      \_\_     '
    Write-Host '        /_/                                                     \_\    '
    Write-Host "       //                                                         \\   "
    Write-Host '      /")                                                         ("\  '
    Write-Host "      \o\                                                         /o/  "
    Write-Host "       \_)                                                       (_/   "
    Write-Host "                                                                       "
    Write-Host "                                                                       "
    Write-Host "          ______ _______ ______ ______    _______ ______  ______ __  __"
    Write-Host "         / __  //__  __// __  // __  /   /__  __// __  / / ____// / / /"
    Write-Host "        / / /_/   / /  / /_/ // /_/ /      / /  / /_/ / / /__  / //'/' "
    Write-Host "        _\ \     / /  / __  //   __/      / /  /   __/ / __ / /  '/'   "
    Write-Host "      / /_/ /   / /  / / / // /\ \       / /  / /\ \  / /___ / /\ \    "
    Write-Host "     /_____/   /_/  /_/ /_//_/  \_\     /_/  /_/  \_\/_____//_/  \_\   "
    Write-Host "                                                                       "
    Write-Host "                                                                       "
    Write-Host "                                                                       "
    Write-Host "                              ______   ______                          "
    Write-Host "                            _/_/__\_\_/_/__\_\_                        "
    Write-Host "                           /.--  / //-\\ \  --.\                       "
    Write-Host "            ______.-------(___,-|-|=====|-|-,___)-------.______        "
    Write-Host '        _.-"                     \-\_@_/-/                     "-._    '
    Write-Host "       (o)                        '-----'                        (o)   "
    Write-Host "       '                                                          '   "
    
}

function Show-DS9Art {
    Clear-Host
    Write-Host "                    __                ___               ___                "
    Write-Host "                  ,' ,'              |   |              `. `.              "
    Write-Host "                ,' ,'                |===|                `. `.            "
    Write-Host "               / //                  |___|                  \\ \           "
    Write-Host "              / //                   |___|                   \\ \          "
    Write-Host "             ////                    |___|                    \\\\         "
    Write-Host "            /  /                    ||   ||                    \  \        "
    Write-Host "           /  /                     ||   ||                     \  \       "
    Write-Host "          /| |                      ||   ||                      | |\      "
    Write-Host "          || |                     | : o : |                     | ||      "
    Write-Host "         |  \|                     | .===. |                     |/  |     "
    Write-Host "         |  |\                    /| (___) |\                    /|  |     "
    Write-Host "        |__||.\         .-.      // /,_._,\ \\      .-.         /.||__|    "
    Write-Host "        |__||_.\        `-.\    //_ [:(|):] _\\    /.-'        /._||__|    "
    Write-Host "     __/|  ||___`._____ ___\\__/___/_ ||| _\___\__//___ _____.'___||_ |\__ "
    Write-Host "    /___//__________/.-/_____________|.-.|_____________\-.\__________\\___\"
    Write-Host "    \___\\__\\\_____\`-\__\\\\__\____|_-_|____/_//_____/-'/__//______//__//"
    Write-Host "       \|__||__..'         //  \ _ \__|||__/ _ /  \\         `..__||__|/   "
    Write-Host "        |__||_./        .-'/    \\   |(|)|   //    \`-.        \..||__|    "
    Write-Host "        |  || /         `-'      \\   \'/   //      `-'         \ ||  |    "
    Write-Host "         |  |/                    \| :(-): |/                    \|  |     "
    Write-Host "         |  /|                     | : o : |                     |\  |     "
    Write-Host "          || |                     | |___| |                     | ||      "
    Write-Host "          \| |                      ||   ||                      | |/      "
    Write-Host "           \  \                     ||   ||                     /  /       "
    Write-Host "            \  \                    ||___||                    /  /        "
    Write-Host "             \\\\                    |___|                    ////         "
    Write-Host "              \ \\                   |___|                   // /          "
    Write-Host "               \ \\                  |   |                  // /           "
    Write-Host "                 `. `.                 |===|                ,' ,'            "
    Write-Host "                   `._`.               |___|              ,'_,'              "
}
function Get-PlexIDs {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $True)]
        [string]
        $CSFILE
    )
    $global:CSVFILE = Import-Csv -Path ".\$CSFILE"

    foreach ($entree in $CSVFILE) {
        $x = $entree
        Start-Sleep -Seconds .1
        $count = $entree.Count
        "$count of $($CSVFILE.Count)"
        switch ($entree.Series) {
            { $_ -eq "ENT" } { $SearchLibrary = $ENTLibrary }
            { $_ -eq "STS" } { $SearchLibrary = $STSLibrary }
            { $_ -eq "TOS" } { $SearchLibrary = $TOSLibrary }
            { $_ -eq "DIS" } { $SearchLibrary = $DISLibrary }
            { $_ -eq "SNW" } { $SearchLibrary = $SNWLibrary }
            { $_ -eq "TAS" } { $SearchLibrary = $TASLibrary }
            { $_ -eq "TOS_FILMS" } { $SearchLibrary = $TOS_FILMSLibrary }
            { $_ -eq "TNG" } { $SearchLibrary = $TNGLibrary }
            { $_ -eq "DS9" } { $SearchLibrary = $DS9Library }
            { $_ -eq "VOY" } { $SearchLibrary = $VOYLibrary }
            { $_ -eq "TNG_FILMS" } { $SearchLibrary = $TNG_FILMSLibrary }
            { $_ -eq "LD" } { $SearchLibrary = $LDLibrary } 
            { $_ -eq "PRO" } { $SearchLibrary = $PROLibrary }  
            { $_ -eq "ALT_FILMS" } { $SearchLibrary = $ALT_FILMSLibrary }
            { $_ -eq "PIC" } { $SearchLibrary = $PICLibrary } 
        }
        switch ([int]$count) {
            145 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#130	SNW	Strange New Worlds	1x01	2022-05-05	2022	174864	tt12330364	3455959	8785342 #>
            265 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#239	TOS-FILMS	Star Trek: The Motion Picture 	1	1979-12-07	1979 #>
            266 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#240	TOS-FILMS	Star Trek II: The Wrath of Khan 	2	1982-06-04	1982 #>
            267 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#241	TOS-FILMS	Star Trek III: The Search for Spock 	3	1984-06-01	1984 #>
            268 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#242	TOS-FILMS	Star Trek IV: The Voyage Home 	4	1986-11-26	1986 #>
            269 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#243	TOS-FILMS	Star Trek V: The Final Frontier 	5	1989-06-09	1989 #>
            270 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                       <#244	TOS-FILMS	Star Trek VI: The Undiscovered Country 	6	1991-12-06	1991 #>
            724 { $ItemID = ((Find-PlexItem -ItemName $x.Title -LibraryTitle $SearchLibrary).ratingKey); break }                                                        <#636	DS9	Star Trek The Magnificent Ferengi	6x10	1997-12-17	1997	175352	tt0708628	1005837	72080 #>
            753 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#662	VOY	One	4x25	1998-05-13	1998 #>
            758 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#667	VOY	Night	5x01	1998-10-14	1998 #>
            873 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#763	VOY	Q2	7x19	2001-04-11	2001 #>
            904 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#790	LD	First First Contact	2x10	2021-10-14	2021 #>
            966 { $ItemID = ((Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey); break }                          <#838	PIC	Mercy	2x08	2022-04-21	2022 #>
            { $_ -gt 0 -and $_ -lt 6 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break }     <#1		ENT	 Broken Bow	1x01	2001-09-26	2001 #>
            { $_ -gt 28 -and $_ -lt 34 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break }   <#27		ENT	 Shockwave	1x26	2002-05-22	2002 #>
            { $_ -gt 82 -and $_ -lt 88 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break }   <#79		ENT	 Storm Front	4x01	2004-10-08	2004 #>
            { $_ -gt 138 -and $_ -lt 144 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#127	DIS	 Such Sweet Sorrow	2x13	2019-04-11	2019 #>
            { $_ -gt 168 -and $_ -lt 174 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#154	TOS	 The Menagerie	1x15	1966-11-17	1966 #>
            { $_ -gt 222 -and $_ -lt 228 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#205	ENT	 In a Mirror,Darkly	4x18	2005-04-22	2005 #>
            { $_ -gt 270 -and $_ -lt 276 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#251	TNG	 Encounter at Farpoint	1x01	1987-09-28	1987 #>
            { $_ -gt 346 -and $_ -lt 352 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#325	TNG	 The Best of Both Worlds	3x26	1990-06-18	1990 #>
            { $_ -gt 375 -and $_ -lt 381 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#352	TNG	 Redemption	4x26	1991-06-17	1991 #>
            { $_ -gt 385 -and $_ -lt 391 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#360	TNG	 Unification	5x07	1991-11-04	1991 #>
            { $_ -gt 407 -and $_ -lt 413 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#380	TNG	 Time's Arrow	5x26	1992-06-15	1992 #>
            { $_ -gt 420 -and $_ -lt 426 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#391	TNG	 Chain of Command	6x10	1992-12-14	1992 #>
            { $_ -gt 425 -and $_ -lt 431 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#394	DS9	Emissary	1x01	1993-01-03	1993 #>
            { $_ -gt 441 -and $_ -lt 447 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#408	TNG	Birthright	6x16	1993-02-22	1993 #>
            { $_ -gt 465 -and $_ -lt 471 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#430	TNG	Descent	6x26	1993-06-21	1993 #>
            { $_ -gt 474 -and $_ -lt 480 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#437	TNG	Gambit	7x04	1993-10-11	1993 #>
            { $_ -gt 512 -and $_ -lt 518 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#473	DS9	The Maquis	2x20	1994-04-24	1994 #>
            { $_ -gt 525 -and $_ -lt 431 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#484	TNG	All Good Things…	7x25	1994-05-23	1994 #>
            { $_ -gt 531 -and $_ -lt 537 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#488	DS9	The Search	3x01	1994-09-26	1994 #>
            { $_ -gt 541 -and $_ -lt 547 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#496	VOY	Caretaker	1x01	1995-01-16	1995 #>
            { $_ -gt 550 -and $_ -lt 556 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#503	DS9	Past Tense	3x11	1995-01-08	1995 #>
            { $_ -gt 588 -and $_ -lt 594 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#538	DS9	The Way of the Warrior	4x01	1995-10-02	1995 #>
            { $_ -gt 637 -and $_ -lt 643 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#585	VOY	star trek Basics	2x26	1996-05-20	1996 #>
            { $_ -gt 654 -and $_ -lt 660 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#600	VOY	Future's End	3x08	1996-11-06	1996 #>
            { $_ -gt 694 -and $_ -lt 700 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#637	VOY	Scorpion	3x26	1997-05-21	1997 #>
            { $_ -gt 714 -and $_ -lt 720 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#655	VOY	Year Of Hell	4x08	1997-11-05	1997 #>
            { $_ -gt 736 -and $_ -lt 742 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#675	VOY	The Killing Game	4x18	1998-03-04	1998 #>
            { $_ -gt 790 -and $_ -lt 796 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#727	VOY	Dark Frontier	5x15	1999-02-17	1999 #>
            { $_ -gt 805 -and $_ -lt 811 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#739	DS9	What You Leave Behind	7x25	1999-06-02	1999 #>
            { $_ -gt 815 -and $_ -lt 821 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#747	VOY	Equinox	5x26	1999-05-26	1999 #>
            { $_ -gt 844 -and $_ -lt 850 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#774	VOY	Unimatrix Zero	6x26	2000-05-24	2000 #>
            { $_ -gt 856 -and $_ -lt 862 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#784	VOY	Flesh and Blood	7x09	2000-11-29	2000 #>
            { $_ -gt 866 -and $_ -lt 872 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#789	VOY	Workforce	7x16	2001-02-21	2001 #>
            { $_ -gt 878 -and $_ -lt 884 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#802	VOY	Endgame	7x25	2001-05-23	2001 #>
            { $_ -gt 914 -and $_ -lt 920 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#835	PRO	Lost & Found	1x01	2021-10-28	2021 #>
            { $_ -gt 925 -and $_ -lt 931 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#844	PRO	A Moral Star	1x09	2022-01-27	2022 #>
            { $_ -gt 938 -and $_ -lt 944 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#855	PRO	Supernova	1x19	2022-12-22	2022 #>
            { $_ -gt 953 -and $_ -lt 959 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#866	PIC	Et in Arcadia Ego	1x09	2020-03-19	2020 #>
            { $_ -gt 977 -and $_ -lt 983 } { $ItemID = (Find-PlexItem -ItemName $x.Title -Year $x.Year -LibraryTitle $SearchLibrary -ExactNameMatch).ratingKey; break } <#888	DIS	Terra Firma	3x09	2020-12-10	2020 #>
            Default { $ItemID = (Find-PlexItem -ItemName $x.Title -LibraryTitle $SearchLibrary -Year $x.Year).ratingKey }
        }

        if ($ItemID) { 
            # $ItemID
            $item = Get-PlexItem -ID $ItemID
            $entree.PlexId = $ItemID
            <#             foreach ($currentItemName in $item.Guid.id) {
                $first = (($currentItemName).split("://")[0])
                $result = (($currentItemName).split("://")[1])
                if ($first -eq "imdb") {
                    $entree.imdb = $result
                }
                if ($first -eq "tmdb") {
                    $entree.tmdb = $result
                }
                if ($first -eq "tvdb") {
                    $entree.tvdb = $result
                }
            } #>
        }
    }
    $CSVFILE | Export-Csv -Path ".\PlexIDs.csv"
}

function resumecheck {
    If (Test-Path -Path ".\PlexIDs.csv" -PathType Leaf) {
        # $Cursor = [System.Console]::CursorTop
        Do {
            # [System.Console]::CursorTop = $Cursor
            #Clear-Host
            $global:Answer = Read-Host -Prompt 'Found PlexIDs.csv. Resume using it? (y/n)'
        }
        Until ($Answer -eq 'y' -or $Answer -eq 'n')
    }
    mainMenu
}

function mainMenu {
    $mainMenu = 'X'
    while ($mainMenu -ne '') {
        Set-ConsoleSize -Height 45 -Width 80
        Clear-Host
        Show-TrekArt
        Write-Host "`n`t`t`tPlex/Star Trek Playlist Maker"
        Write-Host -ForegroundColor Cyan "`n`t`t`t`t  Main Menu"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All Original Timeline Star Trek"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All Original Timeline Live Action Star Trek"

        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Launch submenu1
        if ($mainMenu -eq 1) {
            subMenu1
        }
        # Launch submenu2
        if ($mainMenu -eq 2) {
            subMenu2
        }
    }
}

function subMenu1 {
    $subMenu1 = 'X'
    while ($subMenu1 -ne '') {
        Clear-Host
        Show-KlingArt
        Write-Host "`n`t`t`tComplete Star Trek Playlists"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All in one playlist"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 50 items each (18 playlists)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 100 items each (9 playlists)"
        $subMenu1 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if ($subMenu1 -eq 1) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete.csv" }
            playALL
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($subMenu1 -eq 2) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete.csv" }
            play50
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($subMenu1 -eq 3) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete.csv" }
            play100
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }

    }
}

function Set-ConsoleSize {


    <#
.Synopsis
Set the size of the current console window

.Description
Set-ConsoleSize sets or resets the size of the current console window. By default, it
sets the window to a height of 40 lines, with a 2000 line buffer, and sets the 
the width and width buffer to 120 characters. 

.Example
Restore the console window to 40h x 120w:
Set-ConsoleSize

.Example
Change the current console to a height = 30 lines and a width = 180 chars:
Set-ConsoleSize -Height 30 -Width 180

.Parameter Height
The number of lines to which to set the current console. Default = 40 lines. 

.Parameter Width
The number of characters to which to set the current console. Default = 120 chars.

.Inputs
[int]
[int]

.Notes
    Author: ss64.com/ps/syntax-consolesize.html
 Last edit: 2019-08-29
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $False, Position = 0)]
        [int]$Height = 40,
        [Parameter(Mandatory = $False, Position = 1)]
        [int]$Width = 120
    )
    $console = $host.ui.rawui
    $ConBuffer = $console.BufferSize
    $ConSize = $console.WindowSize

    $currWidth = $ConSize.Width
    $currHeight = $ConSize.Height

    # if height is too large, set to max allowed size
    if ($Height -gt $host.UI.RawUI.MaxPhysicalWindowSize.Height) {
        $Height = $host.UI.RawUI.MaxPhysicalWindowSize.Height
    }

    # if width is too large, set to max allowed size
    if ($Width -gt $host.UI.RawUI.MaxPhysicalWindowSize.Width) {
        $Width = $host.UI.RawUI.MaxPhysicalWindowSize.Width
    }

    # If the Buffer is wider than the new console setting, first reduce the width
    If ($ConBuffer.Width -gt $Width ) {
        $currWidth = $Width
    }
    # If the Buffer is higher than the new console setting, first reduce the height
    If ($ConBuffer.Height -gt $Height ) {
        $currHeight = $Height
    }
    # initial resizing if needed
    $host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.size($currWidth, $currHeight)

    # Set the Buffer
    $host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.size($Width, 2000)

    # Now set the WindowSize
    $host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.size($Width, $Height)

    # Display the new sizes (Optional/for debugging)
    # "Height: " + $host.ui.rawui.WindowSize.Height
    # "Width:  " + $host.ui.rawui.WindowSize.width

    
}

function subMenu2 {
    $subMenu2 = 'X'
    while ($subMenu2 -ne '') {
        Clear-Host 
        Show-DS9Art
        Write-Host "`n`t`t`tLive Action Star Trek Playlists"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All in one playlist"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 50 items each (16 playlists)"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 100 items each (8 playlists)"

        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if ($subMenu2 -eq 1) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete-liveaction.csv" }
            playALL
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($subMenu2 -eq 2) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete-liveaction.csv" }
            play50
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($subMenu2 -eq 3) {
            if (-not($Answer -eq 'y')) { Get-PlexIDs "./startrek-cron-complete-liveaction.csv" }
            play100
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function playALL {
    $CurrentPlexServer = Get-PlexServer -Name $DefaultPlexServer.PlexServer -ErrorAction Stop
    $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { -not($_.PlexID -eq "NULL") }
    $ItemsToAdd = $Results.PlexID -join ','
    $PlaylistTitle = ([uri]::EscapeDataString("Star Trek Chrono"))
    if ($DefaultPlexServer.UserToken -eq "") {
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=$PlaylistTitle&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"
        $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono" }).ratingKey
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($00Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"    
    }

    if (-not($DefaultPlexServer.UserToken -eq "")) {
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=$PlaylistTitle&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"        
        $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono" }).ratingKey
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($00Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"
    }

}

function play50 {
    $CurrentPlexServer = Get-PlexServer -Name $DefaultPlexServer.PlexServer -ErrorAction Stop
    $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { -not($_.PlexID -eq "NULL") }
    $numplaylists = [math]::ceiling($Results.count / 50)
    if ($DefaultPlexServer.UserToken -eq "") {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 1" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 50 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 2" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 3" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 150) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 4" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 5" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 250) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 6" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 7" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 350) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 8" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 9" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 450) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 10" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                11 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2011&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 11" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($11Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                12 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 550) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2012&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 12" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($12Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                13 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2013&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 13" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($13Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                14 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 650) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2014&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 14" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($14Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                15 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2015&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 15" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($15Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                16 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 750) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2016&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 16" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($16Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                17 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2017&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 17" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($17Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                18 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 850) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2018&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 18" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($18Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
    
    if (-not($DefaultPlexServer.UserToken -eq "")) {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 1" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 50 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 2" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 3" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 150) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 4" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 5" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 250) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 6" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 7" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 350) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 8" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 9" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 450) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 10" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                11 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2011&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 11" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($11Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                12 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 550) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2012&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 12" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($12Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                13 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2013&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 13" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($13Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                14 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 650) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2014&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 14" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($14Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                15 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2015&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 15" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($15Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                16 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 750) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2016&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 16" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($16Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                17 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2017&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 17" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($17Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                18 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 850) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2018&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 18" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($18Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
}
function play100 {
    $CurrentPlexServer = Get-PlexServer -Name $DefaultPlexServer.PlexServer -ErrorAction Stop
    $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { -not($_.PlexID -eq "NULL") }
    $numplaylists = [math]::ceiling($Results.count / 100)
    if ($DefaultPlexServer.UserToken -eq "") {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 1" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 100 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 2" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 3" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 4" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 5" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 6" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 7" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 8" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 9" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 900) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = (get-plexplaylist | Where-Object { $_.title -eq "Star Trek Chrono 10" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
    
    if (-not($DefaultPlexServer.UserToken -eq "")) {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 1" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 100 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 2" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 3" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 4" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 5" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 6" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 7" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 8" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 9" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 900) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = (get-plexplaylist -AlternativeToken $DefaultPlexServer.UserToken | Where-Object { $_.title -eq "Star Trek Chrono 10" }).ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }  
}
resumecheck
