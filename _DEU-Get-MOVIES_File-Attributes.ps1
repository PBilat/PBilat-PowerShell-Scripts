#region Description
<#	
	Version:			1.0
	Date:				13.02.2026
	Author:      		Pascal Bilat
	Description:		This PS-Script gets all MOVIES File Properties from selected folder

	Parameters:			enter Folder Path to scan over select folder dialog

    Properties:         "Dateispeicherort", "Name", "Größe", "Dateierweiterung", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Verfügbarkeit", "Erkannter Typ", "Besitzer", 
                        "Art", "Bewertung", "Copyright", "Länge", "Bitrate", "Geschützt", "Gesamtgröße", "Computer", "Dateiname", "Dateiversion", "Ordnername", "Pfad", "Typ", "Verwendeter Speicherplatz", 
                        "Videokomprimierung"

                        Movies types are: *.webm, *.mkv, *.flv, *.vob, *.ogv, *.ogg, *.rrc, *.gifv, *.mng, *.mov, *.avi, *.qt, *.wmv, *.yuv, *.rm, *.asf, *.amv, *.mp4, *.m4p, *.m4v, *.mpg, *.mp2, *.mpeg, *.mpe, *.mpv, *.m4v, *.svi, *.3gp, *.3g2, *.mxf, *.roq, *.nsv, *.flv, *.f4v, *.f4p, *.f4a, *.f4b, *.mod
#>
#endregion

#Add-Type -AssemblyName System.Windows.Forms
#$browser = New-Object System.Windows.Forms.FolderBrowserDialog
#$null = $browser.ShowDialog()
#$path = $browser.SelectedPath


# Show an Open Folder Dialog and return the directory selected by the user.
function Get-FolderName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Position=0)]
        [string]$Message = "Wähle Dein Basis-Verzeichnis aus...",

        [string]$InitialDirectory = [System.Environment+SpecialFolder]::MyComputer,

        [switch]$ShowNewFolderButton
    )

    $browserForFolderOptions = 0x00000041                                  # BIF_RETURNONLYFSDIRS -bor BIF_NEWDIALOGSTYLE
    if (!$ShowNewFolderButton) { $browserForFolderOptions += 0x00000200 }  # BIF_NONEWFOLDERBUTTON

    $browser = New-Object -ComObject Shell.Application
    # To make the dialog topmost, you need to supply the Window handle of the current process
    [intPtr]$handle = [System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle

    # see: https://msdn.microsoft.com/en-us/library/windows/desktop/bb773205(v=vs.85).aspx
    $folder = $browser.BrowseForFolder($handle, $Message, $browserForFolderOptions, $InitialDirectory)

    $result = $null
    if ($folder) { 
        $result = $folder.Self.Path 
    } 

    # Release and remove the used Com object from memory
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($browser) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()


    return $result
}

$folder = Get-FolderName
if ($folder) { Write-Host "You selected the directory: $folder" }
else { "You did not select a directory." }




# Prompt User to accept Folder Path OR the enter another Path and File Name
$defaultValue = 'C:\Temp\Get-MOVIES_File-Attributes.csv'
$result = Read-Host "Press enter to accept the default path and file name [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
#[array]$include = @("*.*")

#Get-ChildItem $path -Recurse -Include $include  | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include *.webm, *.mkv, *.flv, *.vob, *.ogv, *.ogg, *.rrc, *.gifv, *.mng, *.mov, *.avi, *.qt, *.wmv, *.yuv, *.rm, *.asf, *.amv, *.mp4, *.m4p, *.m4v, *.mpg, *.mp2, *.mpeg, *.mpe, *.mpv, *.m4v, *.svi, *.3gp, *.3g2, *.mxf, *.roq, *.nsv, *.flv, *.f4v, *.f4p, *.f4a, *.f4b, *.mod  | ? { !$_.PsIsContainer } | % {

$shellfolder = $shell.Namespace($_.DirectoryName)
$shellfile = $shellfolder.ParseName($_.Name)
New-Object PSObject -Property @{
"Name" = $shellfolder.GetDetailsOf($shellfile,  0)
"Größe" = $shellfolder.GetDetailsOf($shellfile,  1)
"Dateierweiterung" = $shellfolder.GetDetailsOf($shellfile,  164)
"Elementtyp" = $shellfolder.GetDetailsOf($shellfile,  2)
"Änderungsdatum" = $shellfolder.GetDetailsOf($shellfile,  3)
"Erstelldatum" = $shellfolder.GetDetailsOf($shellfile,  4)
"Letzter Zugriff" = $shellfolder.GetDetailsOf($shellfile,  5)
"Attribute" = $shellfolder.GetDetailsOf($shellfile,  6)
"Erkannter Typ" = $shellfolder.GetDetailsOf($shellfile,  9)
"Besitzer" = $shellfolder.GetDetailsOf($shellfile,  10)
"Art" = $shellfolder.GetDetailsOf($shellfile,  11)
"Bewertung" = $shellfolder.GetDetailsOf($shellfile,  19)
"Länge" = $shellfolder.GetDetailsOf($shellfile,  27)
"Bitrate" = $shellfolder.GetDetailsOf($shellfile,  28)
"Geschützt" = $shellfolder.GetDetailsOf($shellfile,  29)
"Gesamtgröße" = $shellfolder.GetDetailsOf($shellfile,  57)
"Computer" = $shellfolder.GetDetailsOf($shellfile,  61)
"Dateiname" = $shellfolder.GetDetailsOf($shellfile,  165)
"Ordnername" = $shellfolder.GetDetailsOf($shellfile,  190)
"Dateispeicherort" = $shellfolder.GetDetailsOf($shellfile,  191)
"Pfad" = $shellfolder.GetDetailsOf($shellfile,  194)
"Typ" = $shellfolder.GetDetailsOf($shellfile,  196)
"Verwendeter Speicherplatz" = $shellfolder.GetDetailsOf($shellfile,  254)
"Videokomprimierung" = $shellfolder.GetDetailsOf($shellfile,  319)

	}
}| select "Dateispeicherort", "Name", "Größe", "Dateierweiterung", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Erkannter Typ", "Besitzer", "Art", "Bewertung", "Länge", "Bitrate", "Geschützt", "Gesamtgröße", "Computer", "Dateiname", "Ordnername", "Pfad", "Typ", "Verwendeter Speicherplatz", "Videokomprimierung"  | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"