#region Description
<#	
	Version:			1.0
	Date:				14.02.2026
	Author:      		Pascal Bilat

	Description:		Script gets all MS Office OR LibreOffice Files Properties from selected folder

	Parameters:			enter Folder Path to scan over select folder dialog

    Properties:         "Dateispeicherort", "Name", "Größe", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Erkannter Typ", "Besitzer", "Art", "Markierungen", "Bewertung", "Autoren", "Titel", "Kategorien", "Kommentare", 
                        "Firma", "Programmname", "Gesamtgröße", "Computer", "Inhalt erstellt", "Zuletzt gedruckt", "Letzte Speicherung", "Seiten", "Folien", "Gesamtbearbeitungszeit", "Wortanzahl", "Dateierweiterung", "Dateiname", "Freier Speicherplatz", 
                        "Freigegeben", "Ordnername", "Ordner", "Pfad", "Typ", "Freigabestatus"

                        Detected file types are: *.accda, *.accdb, *.accde, *.accdt, *.accdu, *.doc, *.docm, *.docx, *.dot, *.dotm, *.dotx, *.one, *.pot, *.potm, *.potx, *.ppa, *.ppam, *.pps, *.ppsm, *.ppsx, *.ppt, *.pptm, *.pptx, *.pub, *.sldm, *.sldx, *.wbk, *.wll, 
                        *.wwl, *.xla, *.xla5, *.xla8, *.xlam, *.xll, *.xll, *.xlm, *.xls, *.xlsb, *.xlsm, *.xlsx, *.xlt, *.xltm, *.xltx, *.xlw*, *.odt, *.ods, *.ots, *.odp, *.otp, *.odg, *.odm, *.odb


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
$defaultValue = 'C:\Temp\Get-MSOfficeFileAttributes.csv'
$result = Read-Host "Press enter to accept the default path and file name [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
#[array]$include = @("*.*")

#Get-ChildItem $path -Recurse -Include $include  | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include *.accda, *.accdb, *.accde, *.accdt, *.accdu, *.doc, *.docm, *.docx, *.dot, *.dotm, *.dotx, *.one, *.pot, *.potm, *.potx, *.ppa, *.ppam, *.pps, *.ppsm, *.ppsx, *.ppt, *.pptm, *.pptx, *.pub, *.sldm, *.sldx, *.wbk, *.wll, *.wwl, *.xla, *.xla5, *.xla8, *.xlam, *.xll, *.xll, *.xlm, *.xls, *.xlsb, *.xlsm, *.xlsx, *.xlt, *.xltm, *.xltx, *.xlw*, *.odt, *.ods, *.ots, *.odp, *.otp, *.odg, *.odm, *.odb | ? { !$_.PsIsContainer } | % {

	$shellfolder = $shell.Namespace($_.DirectoryName)
	$shellfile = $shellfolder.ParseName($_.Name)
	New-Object PSObject -Property @{
"Name" = $shellfolder.GetDetailsOf($shellfile,  0)
"Größe" = $shellfolder.GetDetailsOf($shellfile,  1)
"Elementtyp" = $shellfolder.GetDetailsOf($shellfile,  2)
"Änderungsdatum" = $shellfolder.GetDetailsOf($shellfile,  3)
"Erstelldatum" = $shellfolder.GetDetailsOf($shellfile,  4)
"Letzter Zugriff" = $shellfolder.GetDetailsOf($shellfile,  5)
"Attribute" = $shellfolder.GetDetailsOf($shellfile,  6)
"Erkannter Typ" = $shellfolder.GetDetailsOf($shellfile,  9)
"Besitzer" = $shellfolder.GetDetailsOf($shellfile,  10)
"Art" = $shellfolder.GetDetailsOf($shellfile,  11)
"Markierungen" = $shellfolder.GetDetailsOf($shellfile,  18)
"Bewertung" = $shellfolder.GetDetailsOf($shellfile,  19)
"Autoren" = $shellfolder.GetDetailsOf($shellfile,  20)
"Titel" = $shellfolder.GetDetailsOf($shellfile,  21)
"Kategorien" = $shellfolder.GetDetailsOf($shellfile,  23)
"Kommentare" = $shellfolder.GetDetailsOf($shellfile,  24)
"Firma" = $shellfolder.GetDetailsOf($shellfile,  33)
"Programmname" = $shellfolder.GetDetailsOf($shellfile,  42)
"Gesamtgröße" = $shellfolder.GetDetailsOf($shellfile,  57)
"Computer" = $shellfolder.GetDetailsOf($shellfile,  61)
"Inhalt erstellt" = $shellfolder.GetDetailsOf($shellfile,  152)
"Zuletzt gedruckt" = $shellfolder.GetDetailsOf($shellfile,  153)
"Letzte Speicherung" = $shellfolder.GetDetailsOf($shellfile,  154)
"Seiten" = $shellfolder.GetDetailsOf($shellfile,  157)
"Folien" = $shellfolder.GetDetailsOf($shellfile,  158)
"Gesamtbearbeitungszeit" = $shellfolder.GetDetailsOf($shellfile,  159)
"Wortanzahl" = $shellfolder.GetDetailsOf($shellfile,  160)
"Dateierweiterung" = $shellfolder.GetDetailsOf($shellfile,  164)
"Dateiname" = $shellfolder.GetDetailsOf($shellfile,  165)
"Freier Speicherplatz" = $shellfolder.GetDetailsOf($shellfile,  169)
"Freigegeben" = $shellfolder.GetDetailsOf($shellfile,  187)
"Ordnername" = $shellfolder.GetDetailsOf($shellfile,  190)
"Dateispeicherort" = $shellfolder.GetDetailsOf($shellfile,  191)
"Ordner" = $shellfolder.GetDetailsOf($shellfile,  192)
"Pfad" = $shellfolder.GetDetailsOf($shellfile,  194)
"Typ" = $shellfolder.GetDetailsOf($shellfile,  196)
"Freigabestatus" = $shellfolder.GetDetailsOf($shellfile,  297)

	}
}| select "Dateispeicherort", "Name", "Größe", "Dateierweiterung", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Erkannter Typ", "Besitzer", "Art", "Markierungen", "Bewertung", "Autoren", "Titel", "Kategorien", "Kommentare", "Firma", "Programmname", "Gesamtgröße", "Computer", "Inhalt erstellt", "Zuletzt gedruckt", "Letzte Speicherung", "Seiten", "Folien", "Gesamtbearbeitungszeit", "Wortanzahl", "Dateiname", "Freier Speicherplatz", "Freigegeben", "Ordnername", "Ordner", "Pfad", "Typ", "Freigabestatus" | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"