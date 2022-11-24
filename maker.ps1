<# MUST CHANGE #>
$DefaultPlexServer = [pscustomobject]@{
    Username           = "Username";
    Token              = "Token";
    UserToken          = ""; <#Only needed if you use a Managed Account#>
    PlexServer         = "Smeghead";
    PlexServerHostname = "192.168.11.188";
    Protocol           = "http";
    Port               = "32400";
    Default            = "True";
}


$ENTLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Enterprise#>
$STSLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek: Shorts#>
$TOSLibrary = "Star Trek Shows"; <#Name of Plex Library that contains Star Trek (TOS)#>
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

<# CAN CHANGE #>StarTrek
$00Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek00.jpg";
$01Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek01.jpg";
$02Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek02.jpg";
$03Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek03.jpg";
$04Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek04.jpg";
$05Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek05.jpg";
$06Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek06.jpg";
$07Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek07.jpg";
$08Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek08.jpg";
$09Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek09.jpg";
$10Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek10.jpg";
$11Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek11.jpg";
$12Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek12.jpg";
$13Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek13.jpg";
$14Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek14.jpg";
$15Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek15.jpg";
$16Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek16.jpg";
$17Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek17.jpg";
$18Poster = "https://github.com/go2tom42/Star-Trek-Plex-Playlist-Maker/raw/master/StarTrek18.jpg";


<# NEVER CHANGE#>
$global:LiveAction = "True"



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
            ALLMenu
        }
        # Launch submenu2
        if ($mainMenu -eq 2) {
            LAMenu
        }
    }
}

function ALLMenu {
    $ALLMenu = 'X'
    while ($ALLMenu -ne '') {
        Clear-Host
        Show-KlingArt
        Write-Host "`n`t`t`tComplete Star Trek Playlists"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All in one playlist"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 50 items each (18 playlists)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 100 items each (9 playlists)"
        $ALLMenu = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if ($ALLMenu -eq 1) {
            Get-PlexIDs
            $global:LiveAction = "False"
            playALL
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($ALLMenu -eq 2) {
            Get-PlexIDs
            $global:LiveAction = "False"
            play50
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($ALLMenu -eq 3) {
            Get-PlexIDs
            $global:LiveAction = "False"
            play100
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }

    }
}

function LAMenu {
    $LAMenu = 'X'
    while ($LAMenu -ne '') {
        Clear-Host 
        Show-DS9Art
        Write-Host "`n`t`t`tLive Action Star Trek Playlists"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " All in one playlist"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 50 items each (16 playlists)"

        Write-Host -ForegroundColor DarkCyan -NoNewline "`n`t`t["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Multiple Playlists, 100 items each (8 playlists)"

        $LAMenu = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if ($LAMenu -eq 1) {
            Get-PlexIDs
            $global:LiveAction = "True"
            playALL
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($LAMenu -eq 2) {
            Get-PlexIDs
            $global:LiveAction = "True"
            play50
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if ($LAMenu -eq 3) {
            Get-PlexIDs
            $global:LiveAction = "True"
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

function playALL {
    [array]$CurrentPlexServer = ((Invoke-RestMethod -Uri "https://plex.tv/api/servers`?`X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET -UseBasicParsing).MediaContainer.Server) | Where-Object { $_.name -eq $DefaultPlexServer.PlexServer }
    Write-Host -ForegroundColor DarkCyan "`nScript now formating plexIDs for a playlist."
    if ($LiveAction -eq "False") {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) }
    }
    else {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) } | Where-Object { ($_.LiveAction -eq "True") }
    }

    $ItemsToAdd = $Results.PlexID -join ','
    $PlaylistTitle = ([uri]::EscapeDataString("Star Trek Chrono"))
    if ($DefaultPlexServer.UserToken -eq "") {
        Write-Host -ForegroundColor DarkCyan "`nScript now creating said playlist."
        # create playlist, and fill it
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=$PlaylistTitle&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"
        # Get New Playlist ID
        $PlaylistID = $Data.MediaContainer.Playlist.ratingKey
        #Set Poster
        Write-Host -ForegroundColor DarkCyan "`nScript now installing playlist poster."
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($00Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"    
    }

    if (-not($DefaultPlexServer.UserToken -eq "")) {
        Write-Host -ForegroundColor DarkCyan "`nScript now creating said playlist."
        # create playlist, and fill it
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=$PlaylistTitle&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"        
        # Get New Playlist ID
        $PlaylistID = $Data.MediaContainer.Playlist.ratingKey
        #Set Poster
        Write-Host -ForegroundColor DarkCyan "`nScript now installing playlist poster."
        $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($00Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"
    }

}

function Get-PlexIDs {
    Write-Host -ForegroundColor DarkCyan "`nScript executing, looking for PlexIDs."
    $CSVFILE = Import-Csv -Path ".\Star-Trek-Plex-Playlist-Maker.csv"
    $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections?X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET"
    Write-Host -ForegroundColor DarkCyan "`nScript now loading episode titles."
    $ENTLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $ENTLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Enterprise" }
    $STSLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $STSLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Short Treks" }
    $TOSLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $TOSLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek" }
    $DISLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $DISLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Discovery" }
    $SNWLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $SNWLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Strange New Worlds" }
    $TASLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $TASLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: The Animated Series" }
    $TNGLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $TNGLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: The Next Generation" }
    $DS9Library = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $DS9Library }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Deep Space Nine" }
    $VOYLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $VOYLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Voyager" }
    $LDLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $LDLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Lower Decks" }
    $PROLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $PROLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Prodigy" }
    $PICLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $PICLibrary }).key)/all?type=4&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) |  Where-Object { $_.grandparentTitle -eq "Star Trek: Picard" }
    Write-Host -ForegroundColor DarkCyan "`nScript now loading Movie titles."
    $TOS_FILMSLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $TOS_FILMSLibrary }).key)/all?X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) 
    $TNG_FILMSLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $TNG_FILMSLibrary }).key)/all?X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) 
    $ALT_FILMSLibrary = ((Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/sections/$(($Data.MediaContainer.Directory | Where-Object { $_.Title -eq $ALT_FILMSLibrary }).key)/all?X-Plex-Token=$($DefaultPlexServer.Token)" -Method "GET").MediaContainer.Video) 

    Write-Host -ForegroundColor DarkCyan "`nScript now getting said PlexIDs."
    for ($i = 0; $i -lt 1011; $i++) {
        if ($CSVFILE[$i].type -eq "Show" ) {
            switch ($CSVFILE[$i].PlexTitle) {
                { $_ -eq "Star Trek: Enterprise" } { $SearchLibrary = $ENTLibrary }
                { $_ -eq "Star Trek: Short Treks" } { $SearchLibrary = $STSLibrary }
                { $_ -eq "Star Trek" } { $SearchLibrary = $TOSLibrary }
                { $_ -eq "Star Trek: Discovery" } { $SearchLibrary = $DISLibrary }
                { $_ -eq "Star Trek: Strange New Worlds" } { $SearchLibrary = $SNWLibrary }
                { $_ -eq "Star Trek: The Animated Series" } { $SearchLibrary = $TASLibrary }
                { $_ -eq "Star Trek: The Next Generation" } { $SearchLibrary = $TNGLibrary }
                { $_ -eq "Star Trek: Deep Space Nine" } { $SearchLibrary = $DS9Library }
                { $_ -eq "Star Trek: Voyager" } { $SearchLibrary = $VOYLibrary }
                { $_ -eq "Star Trek: Lower Decks" } { $SearchLibrary = $LDLibrary } 
                { $_ -eq "Star Trek: Prodigy" } { $SearchLibrary = $PROLibrary }  
                { $_ -eq "Star Trek: Picard" } { $SearchLibrary = $PICLibrary }
            }
            $CSVFILE[$i].PlexId = ($SearchLibrary | Where-Object { ($_.grandparentTitle -eq $CSVFILE[$i].PlexTitle) -and ($_.title -eq $CSVFILE[$i].EpisodeName) }).ratingKey
        }
    
        if ($CSVFILE[$i].type -eq "Film" ) {
            switch ($CSVFILE[$i].PlexTitle) {
                { $_ -eq "TOS_FILMS" } { $SearchLibrary = $TOS_FILMSLibrary }
                { $_ -eq "TNG_FILMS" } { $SearchLibrary = $TNG_FILMSLibrary }  
                { $_ -eq "ALT_FILMS" } { $SearchLibrary = $ALT_FILMSLibrary }
            }
            $CSVFILE[$i].PlexId = ($SearchLibrary | Where-Object { ($_.title -eq $CSVFILE[$i].EpisodeName) }).ratingKey
        }
    }
    
    $CSVFILE | Export-Csv -Path ".\PlexIDs.csv"
    
}

function play50 {
    [array]$CurrentPlexServer = ((Invoke-RestMethod -Uri "https://plex.tv/api/servers`?`X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET -UseBasicParsing).MediaContainer.Server) | Where-Object { $_.name -eq $DefaultPlexServer.PlexServer }
    Write-Host -ForegroundColor DarkCyan "`nScript now formating plexIDs for a playlist."
    if ($LiveAction -eq "False") {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) }
    }
    else {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) } | Where-Object { ($_.LiveAction -eq "True") }
    }
    
    $numplaylists = [math]::ceiling($Results.count / 50)
    if ($DefaultPlexServer.UserToken -eq "") {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 1 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 2 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 50 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 3 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 4 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 150) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 5 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 6 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 250) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 7 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 8 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 350) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 9 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 10 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 450) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                11 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 11 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2011&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($11Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                12 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 12 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 550) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2012&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($12Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                13 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 13 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2013&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($13Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                14 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 14 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 650) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2014&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($14Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                15 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 15 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2015&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($15Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                16 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 16 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 750) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2016&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($16Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                17 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 17 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2017&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($17Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                18 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 18 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 850) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2018&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($18Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
    
    if (-not($DefaultPlexServer.UserToken -eq "")) {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 1 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 2 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 50 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 3 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 4 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 150) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 5 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 6 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 250) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 7 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 8 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 350) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 9 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 10 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 450) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                11 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 11 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2011&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($11Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                12 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 12 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 550) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2012&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($12Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                13 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 13 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2013&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($13Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                14 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 14 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 650) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2014&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($14Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                15 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 15 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2015&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($15Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                16 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 16 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 750) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2016&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($16Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                17 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 17 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2017&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($17Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                18 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 18 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 50 -skip 850) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2018&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($18Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
}

function play100 {
    [array]$CurrentPlexServer = ((Invoke-RestMethod -Uri "https://plex.tv/api/servers`?`X-Plex-Token=$($DefaultPlexServer.Token)" -Method GET -UseBasicParsing).MediaContainer.Server) | Where-Object { $_.name -eq $DefaultPlexServer.PlexServer }
    Write-Host -ForegroundColor DarkCyan "`nScript now formating plexIDs for a playlist."
    if ($LiveAction -eq "False") {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) }
    }
    else {
        $Results = Import-Csv -Path ".\PlexIDs.csv" | Where-Object { (-not($_.PlexID -eq "NULL")) -and (-not($_.PlexID -eq "")) } | Where-Object { ($_.LiveAction -eq "True") }
    }

    $numplaylists = [math]::ceiling($Results.count / 100)
    if ($DefaultPlexServer.UserToken -eq "") {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 1 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 2 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 100 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 3 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 4 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 5 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 6 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 7 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 8 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 9 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 10 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 900) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }
    
    if (-not($DefaultPlexServer.UserToken -eq "")) {
        for ($i = 1; $i -le $numplaylists; $i++) {
            switch ($i) {
                1 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 1 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%201&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($01Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                2 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 2 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 100 ) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%202&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($02Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                3 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 3 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 200) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%203&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($03Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                4 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 4 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 300) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%204&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($04Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                5 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 5 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 400) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%205&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($05Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                6 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 6 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 500) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%206&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($06Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                7 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 7 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 600) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%207&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($07Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                8 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 8 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 700) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%208&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($08Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                9 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 9 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 800) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%209&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($09Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
                10 { Write-Host -ForegroundColor DarkCyan "`nScript now creating playlist 10 and installing poster."; $ItemsToAdd = ($Results.PlexID | Select-Object -First 100 -skip 900) -join ","; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/playlists?uri=server://$($CurrentPlexServer.machineIdentifier)/com.plexapp.plugins.library/library/metadata/$ItemsToAdd&title=Star%20Trek%20Chrono%2010&smart=0&type=video&X-Plex-Token=$($DefaultPlexServer.UserToken)" -Method "POST"; $PlaylistID = $Data.MediaContainer.Playlist.ratingKey; $Data = Invoke-RestMethod -Uri "$($DefaultPlexServer.Protocol)`://$($DefaultPlexServer.PlexServerHostname)`:$($DefaultPlexServer.Port)/library/metadata/$($PlaylistID)/posters?url=$([uri]::EscapeDataString($10Poster))&X-Plex-Token=$($DefaultPlexServer.Token)" -Method "POST" }
            }
        }
    }  
}