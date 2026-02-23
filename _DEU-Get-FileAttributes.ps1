<#	
	Version:			1.0
	Date:				17.02.2026
	Author:      		Pascal Bilat
	Description:		Das Script eruiert mehrs als 300 Datei-Eingenschaften vom ausgewähten Verzeichniss UND Unterverzeichnisse. 

    BEMERKUNG:          Wenn Datei-Pfadlänge länger als 248 Zeichen ist; dann erscheint im PS-Script eine Meldung!

	Parameters:			Beim Start muss der User das Basis-Verzeichnis auswählen

    Properties:         "Name", "Größe", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Offlinestatus", "Verfügbarkeit", "Erkannter Typ", "Besitzer", "Art", "Aufnahmedatum", "Mitwirkende Interpreten", "Album", "Jahr", "Genre", 
                        "Dirigenten", "Markierungen", "Bewertung", "Autoren", "Titel", "Betreff", "Kategorien", "Kommentare", "Copyright", "Titelnummer", "Länge", "Bitrate", "Geschützt", "Kameramodell", "Abmessungen", "Kamerahersteller", "Firma", "Dateibeschreibung", 
                        "Masterschlüsselwörter", "Programmname", "Dauer", "Ist online", "Periodisch wiederkehrend", "Ort", "Adressen der optionalen Teilnehmer", "Optionale Teilnehmer", "Organisatoradresse", "Organisatorname", "Erinnerungszeit", "Adressen der erforderlichen Teilnehmer", 
                        "Erforderliche Teilnehmer", "Ressourcen", "Besprechungsstatus", "Status frei/besetzt", "Gesamtgröße", "Kontoname", "Aufgabenstatus", "Computer", "Jahrestag", "Name des Assistenten", "Telefonnummer des Assistenten", "Geburtstag", "Geschäftsadresse", "Ort (geschäftlich)", 
                        "Land/Region (geschäftlich)", "Postfach (geschäftlich)", "Postleitzahl (geschäftlich)", "Bundesland/Provinz (geschäftlich)", "Straße (geschäftlich)", "Fax (geschäftlich)", "Homepage (geschäftlich)", "Rufnummer (geschäftlich)", "Rückrufnummer", "Autotelefon", 
                        "Kinder", "Zentrale Firmenrufnummer", "Abteilung", "E-Mail-Adresse", "E-Mail2", "E-Mail3", "E-Mail-Liste", "E-Mail-Anzeigename", "Speichern unter", "Vorname", "Vollständiger Name", "Geschlecht", "Gegebener Name", "Hobbies", "Privatadresse", "Ort (privat)", 
                        "Land/Region (privat)", "Postfach (privat)", "Postleitzahl (privat)", "Bundesland/Provinz (privat)", "Straße (privat)", "Fax (privat)", "Rufnummer (privat)", "Adressen für Chats", "Initialen", "Position", "Bezeichnung", "Nachname", "Adresse", "Zweiter Vorname", 
                        "Mobiltelefon", "Spitzname", "Bürostandort", "Weitere Adresse", "Andere Stadt", "Anderes Land/Region", "Anderes Postfach", "Andere Postleitzahl", "Anderes Bundesland oder Provinz", "Andere Straße", "Pager", "Persönlicher Titel", "Stadt", "Land/Region", "Postfach", 
                        "Postleitzahl", "Bundesland/Provinz", "Straße", "Primäre E-Mail", "Primäre Telefonnummer", "Beruf", "Ehepartner/Partner", "Suffix", "TTY/TTD-Telefon", "Telex", "Webseite", "Inhaltstatus", "Inhaltstyp", "Erfassungsdatum", "Archivierungsdatum", "Vollendungsdatum", 
                        "Gerätekategorie", "Verbindung hergestellt", "Erkennungsmethode", "Anzeigename", "Lokaler Computer", "Hersteller", "Modell", "Gekoppelt", "Klassifizierung", "Status", "Gerätestatus", "Clientkennung", "Mitwirkende", "Inhalt erstellt", "Zuletzt gedruckt", 
                        "Letzte Speicherung", "Hauptabteilung", "Dokument-ID", "Seiten", "Folien", "Gesamtbearbeitungszeit", "Wortanzahl", "Fällig am", "Enddatum", "Dateianzahl", "Dateierweiterung", "Dateiname", "Dateiversion", "Kennzeichnungsfarbe", "Kennzeichnungsstatus", 
                        "Freier Speicherplatz", "Gruppe", "Freigabetyp", "Bittiefe", "Horizontale Auflösung", "Breite", "Vertikale Auflösung", "Höhe", "Wichtigkeit", "Anlage?", "Ist gelöscht", "Verschlüsselungsstatus", "Kennzeichnung vorhanden", "Wurde beendet", "Unvollständig", 
                        "Lesestatus", "Freigegeben", "Ersteller", "Datum", "Ordnername", "Dateispeicherort", "Ordner", "Teilnehmer", "Pfad", "Nach Ort", "Typ", "Kontaktnamen", "Eintragstyp", "Sprache", "Letzter Besuch", "Beschreibung", "Verknüpfungsstatus", "Verknüpfungsziel", 
                        "URL", "Medium erstellt", "Veröffentlichungsdatum", "Codiert durch", "Folgennummer", "Produzenten", "Herausgeber", "Staffelnummer", "Untertitel", "Benutzerweb-URL", "Texter", "BCC-Adressen", "BCC", "CC-Adressen", "CC", "Unterhaltungs-ID", "Empfangsdatum", 
                        "Absendungsdatum", "Von Adressen", "Von", "Hat Anlagen", "Absenderadresse", "Absendername", "Speicher", "Empfängeradressen", "Arbeitstitel", "An", "Laufzeit", "Albuminterpret", "Sortierung nach Albuminterpret", "Album-ID", "Sortierung nach Album", 
                        "Sortierung nach mitwirkenden Interpreten", "Beats pro Minute", "Komponisten", "Sortierung nach Komponist", "Disc", "Ursprünglicher Schlüssel", "Bestandteil einer Kompilation", "Stimmung", "Teil eines Satzes", "Zeitraum", "Farbe", "Jugendschutz", 
                        "Grund für Jugendschutzeinstufung", "Verwendeter Speicherplatz", "EXIF-Version", "Ereignis", "Lichtwert", "Belichtungsprogramm", "Belichtungszeit", "Blendenzahl", "Blitzlichtmodus", "Brennweite", "35mm Brennweite", "ISO-Filmempfindlichkeit", "Objektivhersteller", 
                        "Objektivmodell", "Lichtquelle", "Maximale Blende", "Messmodus", "Ausrichtung", "Kontakte", "Programmmodus", "Sättigung", "Abstand", "Weißausgleich", "Priorität", "Projekt", "Kanal", "Folgenname", "Untertitel (Closed Captions)", "Wiederholung", "Zweikanalton", 
                        "Sendungsdatum", "Sendungsbeschreibung", "Aufnahmezeit", "Senderrufzeichen", "Fernsehsendername", "Zusammenfassung", "Suchübereinstimmungsart", "Schnipsel", "Automatische Zusammenfassung", "Relevanz", "Dateibesitz", "Sensitivität", "Freigegeben für", 
                        "Freigabestatus", "Produktname", "Produktversion", "Supportlink", "Quelle", "Startdatum", "Ist geteilt", "Verfügbarkeitsstatus", "Abrechnungsinformationen", "Abgeschlossen", "Aufgabenbesitzer", "Sortierung nach Titel", "Gesamtdateigröße", "Marken", 
                        "E-Mail des Autors der letzten Änderung", "Name des Autors der letzten Änderung", "Datum der letzten Änderung", "ID der letzten Änderung", "Nachricht zur letzten Änderung", "Versionsstatus", "Videokomprimierung", "Regisseure", "Datenrate", "Bildhöhe", 
                        "Einzelbildrate", "Bildbreite", "Kugelförmig", "Stereo", "Videoausrichtung", "Gesamtbitrate"
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
if ($folder) { Write-Host "Sie haben das Verzeichnis: $folder" ausgewählt}
else { "Sie haben KEIN Verzeichnis ausgewählt!" }

# Prompt User to accept Folder Path OR the enter another Path and File Name
$defaultValue = 'C:\Temp\Get-FileAttributes-DEU.csv'
$result = Read-Host "Eingabe-Taste um den Standard Pfad und Dateiname zu akzeptieren ODER anderer Pfad und Dateinane eingeben [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
[array]$include = @("*.*")

#Get-ChildItem $path -Recurse -Include $include   | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include $include | ? { !$_.PsIsContainer } | % {

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
"Offlinestatus" = $shellfolder.GetDetailsOf($shellfile,  7)
"Verfügbarkeit" = $shellfolder.GetDetailsOf($shellfile,  8)
"Erkannter Typ" = $shellfolder.GetDetailsOf($shellfile,  9)
"Besitzer" = $shellfolder.GetDetailsOf($shellfile,  10)
"Art" = $shellfolder.GetDetailsOf($shellfile,  11)
"Aufnahmedatum" = $shellfolder.GetDetailsOf($shellfile,  12)
"Mitwirkende Interpreten" = $shellfolder.GetDetailsOf($shellfile,  13)
"Album" = $shellfolder.GetDetailsOf($shellfile,  14)
"Jahr" = $shellfolder.GetDetailsOf($shellfile,  15)
"Genre" = $shellfolder.GetDetailsOf($shellfile,  16)
"Dirigenten" = $shellfolder.GetDetailsOf($shellfile,  17)
"Markierungen" = $shellfolder.GetDetailsOf($shellfile,  18)
"Bewertung" = $shellfolder.GetDetailsOf($shellfile,  19)
"Autoren" = $shellfolder.GetDetailsOf($shellfile,  20)
"Titel" = $shellfolder.GetDetailsOf($shellfile,  21)
"Betreff" = $shellfolder.GetDetailsOf($shellfile,  22)
"Kategorien" = $shellfolder.GetDetailsOf($shellfile,  23)
"Kommentare" = $shellfolder.GetDetailsOf($shellfile,  24)
"Copyright" = $shellfolder.GetDetailsOf($shellfile,  25)
"Titelnummer" = $shellfolder.GetDetailsOf($shellfile,  26)
"Länge" = $shellfolder.GetDetailsOf($shellfile,  27)
"Bitrate" = $shellfolder.GetDetailsOf($shellfile,  28)
"Geschützt" = $shellfolder.GetDetailsOf($shellfile,  29)
"Kameramodell" = $shellfolder.GetDetailsOf($shellfile,  30)
"Abmessungen" = $shellfolder.GetDetailsOf($shellfile,  31)
"Kamerahersteller" = $shellfolder.GetDetailsOf($shellfile,  32)
"Firma" = $shellfolder.GetDetailsOf($shellfile,  33)
"Dateibeschreibung" = $shellfolder.GetDetailsOf($shellfile,  34)
"Masterschlüsselwörter" = $shellfolder.GetDetailsOf($shellfile,  35)
"Programmname" = $shellfolder.GetDetailsOf($shellfile,  42)
"Dauer" = $shellfolder.GetDetailsOf($shellfile,  43)
"Ist online" = $shellfolder.GetDetailsOf($shellfile,  44)
"Periodisch wiederkehrend" = $shellfolder.GetDetailsOf($shellfile,  45)
"Ort" = $shellfolder.GetDetailsOf($shellfile,  46)
"Adressen der optionalen Teilnehmer" = $shellfolder.GetDetailsOf($shellfile,  47)
"Optionale Teilnehmer" = $shellfolder.GetDetailsOf($shellfile,  48)
"Organisatoradresse" = $shellfolder.GetDetailsOf($shellfile,  49)
"Organisatorname" = $shellfolder.GetDetailsOf($shellfile,  50)
"Erinnerungszeit" = $shellfolder.GetDetailsOf($shellfile,  51)
"Adressen der erforderlichen Teilnehmer" = $shellfolder.GetDetailsOf($shellfile,  52)
"Erforderliche Teilnehmer" = $shellfolder.GetDetailsOf($shellfile,  53)
"Ressourcen" = $shellfolder.GetDetailsOf($shellfile,  54)
"Besprechungsstatus" = $shellfolder.GetDetailsOf($shellfile,  55)
"Status frei/besetzt" = $shellfolder.GetDetailsOf($shellfile,  56)
"Gesamtgröße" = $shellfolder.GetDetailsOf($shellfile,  57)
"Kontoname" = $shellfolder.GetDetailsOf($shellfile,  58)
"Aufgabenstatus" = $shellfolder.GetDetailsOf($shellfile,  60)
"Computer" = $shellfolder.GetDetailsOf($shellfile,  61)
"Jahrestag" = $shellfolder.GetDetailsOf($shellfile,  62)
"Name des Assistenten" = $shellfolder.GetDetailsOf($shellfile,  63)
"Telefonnummer des Assistenten" = $shellfolder.GetDetailsOf($shellfile,  64)
"Geburtstag" = $shellfolder.GetDetailsOf($shellfile,  65)
"Geschäftsadresse" = $shellfolder.GetDetailsOf($shellfile,  66)
"Ort (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  67)
"Land/Region (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  68)
"Postfach (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  69)
"Postleitzahl (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  70)
"Bundesland/Provinz (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  71)
"Straße (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  72)
"Fax (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  73)
"Homepage (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  74)
"Rufnummer (geschäftlich)" = $shellfolder.GetDetailsOf($shellfile,  75)
"Rückrufnummer" = $shellfolder.GetDetailsOf($shellfile,  76)
"Autotelefon" = $shellfolder.GetDetailsOf($shellfile,  77)
"Kinder" = $shellfolder.GetDetailsOf($shellfile,  78)
"Zentrale Firmenrufnummer" = $shellfolder.GetDetailsOf($shellfile,  79)
"Abteilung" = $shellfolder.GetDetailsOf($shellfile,  80)
"E-Mail-Adresse" = $shellfolder.GetDetailsOf($shellfile,  81)
"E-Mail2" = $shellfolder.GetDetailsOf($shellfile,  82)
"E-Mail3" = $shellfolder.GetDetailsOf($shellfile,  83)
"E-Mail-Liste" = $shellfolder.GetDetailsOf($shellfile,  84)
"E-Mail-Anzeigename" = $shellfolder.GetDetailsOf($shellfile,  85)
"Speichern unter" = $shellfolder.GetDetailsOf($shellfile,  86)
"Vorname" = $shellfolder.GetDetailsOf($shellfile,  87)
"Vollständiger Name" = $shellfolder.GetDetailsOf($shellfile,  88)
"Geschlecht" = $shellfolder.GetDetailsOf($shellfile,  89)
"Gegebener Name" = $shellfolder.GetDetailsOf($shellfile,  90)
"Hobbies" = $shellfolder.GetDetailsOf($shellfile,  91)
"Privatadresse" = $shellfolder.GetDetailsOf($shellfile,  92)
"Ort (privat)" = $shellfolder.GetDetailsOf($shellfile,  93)
"Land/Region (privat)" = $shellfolder.GetDetailsOf($shellfile,  94)
"Postfach (privat)" = $shellfolder.GetDetailsOf($shellfile,  95)
"Postleitzahl (privat)" = $shellfolder.GetDetailsOf($shellfile,  96)
"Bundesland/Provinz (privat)" = $shellfolder.GetDetailsOf($shellfile,  97)
"Straße (privat)" = $shellfolder.GetDetailsOf($shellfile,  98)
"Fax (privat)" = $shellfolder.GetDetailsOf($shellfile,  99)
"Rufnummer (privat)" = $shellfolder.GetDetailsOf($shellfile,  100)
"Adressen für Chats" = $shellfolder.GetDetailsOf($shellfile,  101)
"Initialen" = $shellfolder.GetDetailsOf($shellfile,  102)
"Position" = $shellfolder.GetDetailsOf($shellfile,  103)
"Bezeichnung" = $shellfolder.GetDetailsOf($shellfile,  104)
"Nachname" = $shellfolder.GetDetailsOf($shellfile,  105)
"Adresse" = $shellfolder.GetDetailsOf($shellfile,  106)
"Zweiter Vorname" = $shellfolder.GetDetailsOf($shellfile,  107)
"Mobiltelefon" = $shellfolder.GetDetailsOf($shellfile,  108)
"Spitzname" = $shellfolder.GetDetailsOf($shellfile,  109)
"Bürostandort" = $shellfolder.GetDetailsOf($shellfile,  110)
"Weitere Adresse" = $shellfolder.GetDetailsOf($shellfile,  111)
"Andere Stadt" = $shellfolder.GetDetailsOf($shellfile,  112)
"Anderes Land/Region" = $shellfolder.GetDetailsOf($shellfile,  113)
"Anderes Postfach" = $shellfolder.GetDetailsOf($shellfile,  114)
"Andere Postleitzahl" = $shellfolder.GetDetailsOf($shellfile,  115)
"Anderes Bundesland oder Provinz" = $shellfolder.GetDetailsOf($shellfile,  116)
"Andere Straße" = $shellfolder.GetDetailsOf($shellfile,  117)
"Pager" = $shellfolder.GetDetailsOf($shellfile,  118)
"Persönlicher Titel" = $shellfolder.GetDetailsOf($shellfile,  119)
"Stadt" = $shellfolder.GetDetailsOf($shellfile,  120)
"Land/Region" = $shellfolder.GetDetailsOf($shellfile,  121)
"Postfach" = $shellfolder.GetDetailsOf($shellfile,  122)
"Postleitzahl" = $shellfolder.GetDetailsOf($shellfile,  123)
"Bundesland/Provinz" = $shellfolder.GetDetailsOf($shellfile,  124)
"Straße" = $shellfolder.GetDetailsOf($shellfile,  125)
"Primäre E-Mail" = $shellfolder.GetDetailsOf($shellfile,  126)
"Primäre Telefonnummer" = $shellfolder.GetDetailsOf($shellfile,  127)
"Beruf" = $shellfolder.GetDetailsOf($shellfile,  128)
"Ehepartner/Partner" = $shellfolder.GetDetailsOf($shellfile,  129)
"Suffix" = $shellfolder.GetDetailsOf($shellfile,  130)
"TTY/TTD-Telefon" = $shellfolder.GetDetailsOf($shellfile,  131)
"Telex" = $shellfolder.GetDetailsOf($shellfile,  132)
"Webseite" = $shellfolder.GetDetailsOf($shellfile,  133)
"Inhaltstatus" = $shellfolder.GetDetailsOf($shellfile,  134)
"Inhaltstyp" = $shellfolder.GetDetailsOf($shellfile,  135)
"Erfassungsdatum" = $shellfolder.GetDetailsOf($shellfile,  136)
"Archivierungsdatum" = $shellfolder.GetDetailsOf($shellfile,  137)
"Vollendungsdatum" = $shellfolder.GetDetailsOf($shellfile,  138)
"Gerätekategorie" = $shellfolder.GetDetailsOf($shellfile,  139)
"Verbindung hergestellt" = $shellfolder.GetDetailsOf($shellfile,  140)
"Erkennungsmethode" = $shellfolder.GetDetailsOf($shellfile,  141)
"Anzeigename" = $shellfolder.GetDetailsOf($shellfile,  142)
"Lokaler Computer" = $shellfolder.GetDetailsOf($shellfile,  143)
"Hersteller" = $shellfolder.GetDetailsOf($shellfile,  144)
"Modell" = $shellfolder.GetDetailsOf($shellfile,  145)
"Gekoppelt" = $shellfolder.GetDetailsOf($shellfile,  146)
"Klassifizierung" = $shellfolder.GetDetailsOf($shellfile,  147)
"Gerätestatus" = $shellfolder.GetDetailsOf($shellfile,  149)
"Clientkennung" = $shellfolder.GetDetailsOf($shellfile,  150)
"Mitwirkende" = $shellfolder.GetDetailsOf($shellfile,  151)
"Inhalt erstellt" = $shellfolder.GetDetailsOf($shellfile,  152)
"Zuletzt gedruckt" = $shellfolder.GetDetailsOf($shellfile,  153)
"Letzte Speicherung" = $shellfolder.GetDetailsOf($shellfile,  154)
"Hauptabteilung" = $shellfolder.GetDetailsOf($shellfile,  155)
"Dokument-ID" = $shellfolder.GetDetailsOf($shellfile,  156)
"Seiten" = $shellfolder.GetDetailsOf($shellfile,  157)
"Folien" = $shellfolder.GetDetailsOf($shellfile,  158)
"Gesamtbearbeitungszeit" = $shellfolder.GetDetailsOf($shellfile,  159)
"Wortanzahl" = $shellfolder.GetDetailsOf($shellfile,  160)
"Fällig am" = $shellfolder.GetDetailsOf($shellfile,  161)
"Enddatum" = $shellfolder.GetDetailsOf($shellfile,  162)
"Dateianzahl" = $shellfolder.GetDetailsOf($shellfile,  163)
"Dateierweiterung" = $shellfolder.GetDetailsOf($shellfile,  164)
"Dateiname" = $shellfolder.GetDetailsOf($shellfile,  165)
"Dateiversion" = $shellfolder.GetDetailsOf($shellfile,  166)
"Kennzeichnungsfarbe" = $shellfolder.GetDetailsOf($shellfile,  167)
"Kennzeichnungsstatus" = $shellfolder.GetDetailsOf($shellfile,  168)
"Freier Speicherplatz" = $shellfolder.GetDetailsOf($shellfile,  169)
"Gruppe" = $shellfolder.GetDetailsOf($shellfile,  172)
"Freigabetyp" = $shellfolder.GetDetailsOf($shellfile,  173)
"Bittiefe" = $shellfolder.GetDetailsOf($shellfile,  174)
"Horizontale Auflösung" = $shellfolder.GetDetailsOf($shellfile,  175)
"Breite" = $shellfolder.GetDetailsOf($shellfile,  176)
"Vertikale Auflösung" = $shellfolder.GetDetailsOf($shellfile,  177)
"Höhe" = $shellfolder.GetDetailsOf($shellfile,  178)
"Wichtigkeit" = $shellfolder.GetDetailsOf($shellfile,  179)
"Anlage?" = $shellfolder.GetDetailsOf($shellfile,  180)
"Ist gelöscht" = $shellfolder.GetDetailsOf($shellfile,  181)
"Verschlüsselungsstatus" = $shellfolder.GetDetailsOf($shellfile,  182)
"Kennzeichnung vorhanden" = $shellfolder.GetDetailsOf($shellfile,  183)
"Wurde beendet" = $shellfolder.GetDetailsOf($shellfile,  184)
"Unvollständig" = $shellfolder.GetDetailsOf($shellfile,  185)
"Lesestatus" = $shellfolder.GetDetailsOf($shellfile,  186)
"Freigegeben" = $shellfolder.GetDetailsOf($shellfile,  187)
"Ersteller" = $shellfolder.GetDetailsOf($shellfile,  188)
"Datum" = $shellfolder.GetDetailsOf($shellfile,  189)
"Ordnername" = $shellfolder.GetDetailsOf($shellfile,  190)
"Dateispeicherort" = $shellfolder.GetDetailsOf($shellfile,  191)
"Ordner" = $shellfolder.GetDetailsOf($shellfile,  192)
"Teilnehmer" = $shellfolder.GetDetailsOf($shellfile,  193)
"Pfad" = $shellfolder.GetDetailsOf($shellfile,  194)
"Nach Ort" = $shellfolder.GetDetailsOf($shellfile,  195)
"Typ" = $shellfolder.GetDetailsOf($shellfile,  196)
"Kontaktnamen" = $shellfolder.GetDetailsOf($shellfile,  197)
"Eintragstyp" = $shellfolder.GetDetailsOf($shellfile,  198)
"Sprache" = $shellfolder.GetDetailsOf($shellfile,  199)
"Letzter Besuch" = $shellfolder.GetDetailsOf($shellfile,  200)
"Beschreibung" = $shellfolder.GetDetailsOf($shellfile,  201)
"Verknüpfungsstatus" = $shellfolder.GetDetailsOf($shellfile,  202)
"Verknüpfungsziel" = $shellfolder.GetDetailsOf($shellfile,  203)
"URL" = $shellfolder.GetDetailsOf($shellfile,  204)
"Medium erstellt" = $shellfolder.GetDetailsOf($shellfile,  208)
"Veröffentlichungsdatum" = $shellfolder.GetDetailsOf($shellfile,  209)
"Codiert durch" = $shellfolder.GetDetailsOf($shellfile,  210)
"Folgennummer" = $shellfolder.GetDetailsOf($shellfile,  211)
"Produzenten" = $shellfolder.GetDetailsOf($shellfile,  212)
"Herausgeber" = $shellfolder.GetDetailsOf($shellfile,  213)
"Staffelnummer" = $shellfolder.GetDetailsOf($shellfile,  214)
"Untertitel" = $shellfolder.GetDetailsOf($shellfile,  215)
"Benutzerweb-URL" = $shellfolder.GetDetailsOf($shellfile,  216)
"Texter" = $shellfolder.GetDetailsOf($shellfile,  217)
"BCC-Adressen" = $shellfolder.GetDetailsOf($shellfile,  220)
"BCC" = $shellfolder.GetDetailsOf($shellfile,  221)
"CC-Adressen" = $shellfolder.GetDetailsOf($shellfile,  222)
"CC" = $shellfolder.GetDetailsOf($shellfile,  223)
"Unterhaltungs-ID" = $shellfolder.GetDetailsOf($shellfile,  224)
"Empfangsdatum" = $shellfolder.GetDetailsOf($shellfile,  225)
"Absendungsdatum" = $shellfolder.GetDetailsOf($shellfile,  226)
"Von Adressen" = $shellfolder.GetDetailsOf($shellfile,  227)
"Von" = $shellfolder.GetDetailsOf($shellfile,  228)
"Hat Anlagen" = $shellfolder.GetDetailsOf($shellfile,  229)
"Absenderadresse" = $shellfolder.GetDetailsOf($shellfile,  230)
"Absendername" = $shellfolder.GetDetailsOf($shellfile,  231)
"Speicher" = $shellfolder.GetDetailsOf($shellfile,  232)
"Empfängeradressen" = $shellfolder.GetDetailsOf($shellfile,  233)
"Arbeitstitel" = $shellfolder.GetDetailsOf($shellfile,  234)
"An" = $shellfolder.GetDetailsOf($shellfile,  235)
"Laufzeit" = $shellfolder.GetDetailsOf($shellfile,  236)
"Albuminterpret" = $shellfolder.GetDetailsOf($shellfile,  237)
"Sortierung nach Albuminterpret" = $shellfolder.GetDetailsOf($shellfile,  238)
"Album-ID" = $shellfolder.GetDetailsOf($shellfile,  239)
"Sortierung nach Album" = $shellfolder.GetDetailsOf($shellfile,  240)
"Sortierung nach mitwirkenden Interpreten" = $shellfolder.GetDetailsOf($shellfile,  241)
"Beats pro Minute" = $shellfolder.GetDetailsOf($shellfile,  242)
"Komponisten" = $shellfolder.GetDetailsOf($shellfile,  243)
"Sortierung nach Komponist" = $shellfolder.GetDetailsOf($shellfile,  244)
"Disc" = $shellfolder.GetDetailsOf($shellfile,  245)
"Ursprünglicher Schlüssel" = $shellfolder.GetDetailsOf($shellfile,  246)
"Bestandteil einer Kompilation" = $shellfolder.GetDetailsOf($shellfile,  247)
"Stimmung" = $shellfolder.GetDetailsOf($shellfile,  248)
"Teil eines Satzes" = $shellfolder.GetDetailsOf($shellfile,  249)
"Zeitraum" = $shellfolder.GetDetailsOf($shellfile,  250)
"Farbe" = $shellfolder.GetDetailsOf($shellfile,  251)
"Jugendschutz" = $shellfolder.GetDetailsOf($shellfile,  252)
"Grund für Jugendschutzeinstufung" = $shellfolder.GetDetailsOf($shellfile,  253)
"Verwendeter Speicherplatz" = $shellfolder.GetDetailsOf($shellfile,  254)
"EXIF-Version" = $shellfolder.GetDetailsOf($shellfile,  255)
"Ereignis" = $shellfolder.GetDetailsOf($shellfile,  256)
"Lichtwert" = $shellfolder.GetDetailsOf($shellfile,  257)
"Belichtungsprogramm" = $shellfolder.GetDetailsOf($shellfile,  258)
"Belichtungszeit" = $shellfolder.GetDetailsOf($shellfile,  259)
"Blendenzahl" = $shellfolder.GetDetailsOf($shellfile,  260)
"Blitzlichtmodus" = $shellfolder.GetDetailsOf($shellfile,  261)
"Brennweite" = $shellfolder.GetDetailsOf($shellfile,  262)
"35mm Brennweite" = $shellfolder.GetDetailsOf($shellfile,  263)
"ISO-Filmempfindlichkeit" = $shellfolder.GetDetailsOf($shellfile,  264)
"Objektivhersteller" = $shellfolder.GetDetailsOf($shellfile,  265)
"Objektivmodell" = $shellfolder.GetDetailsOf($shellfile,  266)
"Lichtquelle" = $shellfolder.GetDetailsOf($shellfile,  267)
"Maximale Blende" = $shellfolder.GetDetailsOf($shellfile,  268)
"Messmodus" = $shellfolder.GetDetailsOf($shellfile,  269)
"Ausrichtung" = $shellfolder.GetDetailsOf($shellfile,  270)
"Kontakte" = $shellfolder.GetDetailsOf($shellfile,  271)
"Programmmodus" = $shellfolder.GetDetailsOf($shellfile,  272)
"Sättigung" = $shellfolder.GetDetailsOf($shellfile,  273)
"Abstand" = $shellfolder.GetDetailsOf($shellfile,  274)
"Weißausgleich" = $shellfolder.GetDetailsOf($shellfile,  275)
"Priorität" = $shellfolder.GetDetailsOf($shellfile,  276)
"Projekt" = $shellfolder.GetDetailsOf($shellfile,  277)
"Kanal" = $shellfolder.GetDetailsOf($shellfile,  278)
"Folgenname" = $shellfolder.GetDetailsOf($shellfile,  279)
"Untertitel (Closed Captions)" = $shellfolder.GetDetailsOf($shellfile,  280)
"Wiederholung" = $shellfolder.GetDetailsOf($shellfile,  281)
"Zweikanalton" = $shellfolder.GetDetailsOf($shellfile,  282)
"Sendungsdatum" = $shellfolder.GetDetailsOf($shellfile,  283)
"Sendungsbeschreibung" = $shellfolder.GetDetailsOf($shellfile,  284)
"Aufnahmezeit" = $shellfolder.GetDetailsOf($shellfile,  285)
"Senderrufzeichen" = $shellfolder.GetDetailsOf($shellfile,  286)
"Fernsehsendername" = $shellfolder.GetDetailsOf($shellfile,  287)
"Zusammenfassung" = $shellfolder.GetDetailsOf($shellfile,  289)
"Suchübereinstimmungsart" = $shellfolder.GetDetailsOf($shellfile,  290)
"Schnipsel" = $shellfolder.GetDetailsOf($shellfile,  291)
"Automatische Zusammenfassung" = $shellfolder.GetDetailsOf($shellfile,  292)
"Relevanz" = $shellfolder.GetDetailsOf($shellfile,  293)
"Dateibesitz" = $shellfolder.GetDetailsOf($shellfile,  294)
"Sensitivität" = $shellfolder.GetDetailsOf($shellfile,  295)
"Freigegeben für" = $shellfolder.GetDetailsOf($shellfile,  296)
"Freigabestatus" = $shellfolder.GetDetailsOf($shellfile,  297)
"Produktname" = $shellfolder.GetDetailsOf($shellfile,  299)
"Produktversion" = $shellfolder.GetDetailsOf($shellfile,  300)
"Supportlink" = $shellfolder.GetDetailsOf($shellfile,  301)
"Quelle" = $shellfolder.GetDetailsOf($shellfile,  302)
"Startdatum" = $shellfolder.GetDetailsOf($shellfile,  303)
"Ist geteilt" = $shellfolder.GetDetailsOf($shellfile,  304)
"Verfügbarkeitsstatus" = $shellfolder.GetDetailsOf($shellfile,  305)
"Status" = $shellfolder.GetDetailsOf($shellfile,  306)
"Abrechnungsinformationen" = $shellfolder.GetDetailsOf($shellfile,  307)
"Abgeschlossen" = $shellfolder.GetDetailsOf($shellfile,  308)
"Aufgabenbesitzer" = $shellfolder.GetDetailsOf($shellfile,  309)
"Sortierung nach Titel" = $shellfolder.GetDetailsOf($shellfile,  310)
"Gesamtdateigröße" = $shellfolder.GetDetailsOf($shellfile,  311)
"Marken" = $shellfolder.GetDetailsOf($shellfile,  312)
"E-Mail des Autors der letzten Änderung" = $shellfolder.GetDetailsOf($shellfile,  313)
"Name des Autors der letzten Änderung" = $shellfolder.GetDetailsOf($shellfile,  314)
"Datum der letzten Änderung" = $shellfolder.GetDetailsOf($shellfile,  315)
"ID der letzten Änderung" = $shellfolder.GetDetailsOf($shellfile,  316)
"Nachricht zur letzten Änderung" = $shellfolder.GetDetailsOf($shellfile,  317)
"Versionsstatus" = $shellfolder.GetDetailsOf($shellfile,  318)
"Videokomprimierung" = $shellfolder.GetDetailsOf($shellfile,  319)
"Regisseure" = $shellfolder.GetDetailsOf($shellfile,  320)
"Datenrate" = $shellfolder.GetDetailsOf($shellfile,  321)
"Bildhöhe" = $shellfolder.GetDetailsOf($shellfile,  322)
"Einzelbildrate" = $shellfolder.GetDetailsOf($shellfile,  323)
"Bildbreite" = $shellfolder.GetDetailsOf($shellfile,  324)
"Kugelförmig" = $shellfolder.GetDetailsOf($shellfile,  325)
"Stereo" = $shellfolder.GetDetailsOf($shellfile,  326)
"Videoausrichtung" = $shellfolder.GetDetailsOf($shellfile,  327)
"Gesamtbitrate" = $shellfolder.GetDetailsOf($shellfile,  328)

	}
}| select "Dateispeicherort", "Name", "Größe", "Dateierweiterung", "Elementtyp", "Änderungsdatum", "Erstelldatum", "Letzter Zugriff", "Attribute", "Offlinestatus", "Verfügbarkeit", "Erkannter Typ", "Art", "Aufnahmedatum", "Mitwirkende Interpreten", "Album", "Jahr", "Genre", "Dirigenten", "Markierungen", "Bewertung", "Besitzer", "Autoren", "Titel", "Betreff", "Kategorien", "Kommentare", "Copyright", "Titelnummer", "Länge", "Bitrate", "Geschützt", "Kameramodell", "Abmessungen", "Kamerahersteller", "Firma", "Dateibeschreibung", "Masterschlüsselwörter", "Programmname", "Dauer", "Ist online", "Periodisch wiederkehrend", "Ort", "Adressen der optionalen Teilnehmer", "Optionale Teilnehmer", "Organisatoradresse", "Organisatorname", "Erinnerungszeit", "Adressen der erforderlichen Teilnehmer", "Erforderliche Teilnehmer", "Ressourcen", "Besprechungsstatus", "Status frei/besetzt", "Gesamtgröße", "Kontoname", "Aufgabenstatus", "Computer", "Jahrestag", "Name des Assistenten", "Telefonnummer des Assistenten", "Geburtstag", "Geschäftsadresse", "Ort (geschäftlich)", "Land/Region (geschäftlich)", "Postfach (geschäftlich)", "Postleitzahl (geschäftlich)", "Bundesland/Provinz (geschäftlich)", "Straße (geschäftlich)", "Fax (geschäftlich)", "Homepage (geschäftlich)", "Rufnummer (geschäftlich)", "Rückrufnummer", "Autotelefon", "Kinder", "Zentrale Firmenrufnummer", "Abteilung", "E-Mail-Adresse", "E-Mail2", "E-Mail3", "E-Mail-Liste", "E-Mail-Anzeigename", "Speichern unter", "Vorname", "Vollständiger Name", "Geschlecht", "Gegebener Name", "Hobbies", "Privatadresse", "Ort (privat)", "Land/Region (privat)", "Postfach (privat)", "Postleitzahl (privat)", "Bundesland/Provinz (privat)", "Straße (privat)", "Fax (privat)", "Rufnummer (privat)", "Adressen für Chats", "Initialen", "Position", "Bezeichnung", "Nachname", "Adresse", "Zweiter Vorname", "Mobiltelefon", "Spitzname", "Bürostandort", "Weitere Adresse", "Andere Stadt", "Anderes Land/Region", "Anderes Postfach", "Andere Postleitzahl", "Anderes Bundesland oder Provinz", "Andere Straße", "Pager", "Persönlicher Titel", "Stadt", "Land/Region", "Postfach", "Postleitzahl", "Bundesland/Provinz", "Straße", "Primäre E-Mail", "Primäre Telefonnummer", "Beruf", "Ehepartner/Partner", "Suffix", "TTY/TTD-Telefon", "Telex", "Webseite", "Inhaltstatus", "Inhaltstyp", "Erfassungsdatum", "Archivierungsdatum", "Vollendungsdatum", "Gerätekategorie", "Verbindung hergestellt", "Erkennungsmethode", "Anzeigename", "Lokaler Computer", "Hersteller", "Modell", "Gekoppelt", "Klassifizierung", "Status", "Gerätestatus", "Clientkennung", "Mitwirkende", "Inhalt erstellt", "Zuletzt gedruckt", "Letzte Speicherung", "Hauptabteilung", "Dokument-ID", "Seiten", "Folien", "Gesamtbearbeitungszeit", "Wortanzahl", "Fällig am", "Enddatum", "Dateianzahl", "Dateiname", "Dateiversion", "Kennzeichnungsfarbe", "Kennzeichnungsstatus", "Freier Speicherplatz", "Gruppe", "Freigabetyp", "Bittiefe", "Horizontale Auflösung", "Breite", "Vertikale Auflösung", "Höhe", "Wichtigkeit", "Anlage?", "Ist gelöscht", "Verschlüsselungsstatus", "Kennzeichnung vorhanden", "Wurde beendet", "Unvollständig", "Lesestatus", "Freigegeben", "Ersteller", "Datum", "Ordnername", "Ordner", "Teilnehmer", "Pfad", "Nach Ort", "Typ", "Kontaktnamen", "Eintragstyp", "Sprache", "Letzter Besuch", "Beschreibung", "Verknüpfungsstatus", "Verknüpfungsziel", "URL", "Medium erstellt", "Veröffentlichungsdatum", "Codiert durch", "Folgennummer", "Produzenten", "Herausgeber", "Staffelnummer", "Untertitel", "Benutzerweb-URL", "Texter", "BCC-Adressen", "BCC", "CC-Adressen", "CC", "Unterhaltungs-ID", "Empfangsdatum", "Absendungsdatum", "Von Adressen", "Von", "Hat Anlagen", "Absenderadresse", "Absendername", "Speicher", "Empfängeradressen", "Arbeitstitel", "An", "Laufzeit", "Albuminterpret", "Sortierung nach Albuminterpret", "Album-ID", "Sortierung nach Album", "Sortierung nach mitwirkenden Interpreten", "Beats pro Minute", "Komponisten", "Sortierung nach Komponist", "Disc", "Ursprünglicher Schlüssel", "Bestandteil einer Kompilation", "Stimmung", "Teil eines Satzes", "Zeitraum", "Farbe", "Jugendschutz", "Grund für Jugendschutzeinstufung", "Verwendeter Speicherplatz", "EXIF-Version", "Ereignis", "Lichtwert", "Belichtungsprogramm", "Belichtungszeit", "Blendenzahl", "Blitzlichtmodus", "Brennweite", "35mm Brennweite", "ISO-Filmempfindlichkeit", "Objektivhersteller", "Objektivmodell", "Lichtquelle", "Maximale Blende", "Messmodus", "Ausrichtung", "Kontakte", "Programmmodus", "Sättigung", "Abstand", "Weißausgleich", "Priorität", "Projekt", "Kanal", "Folgenname", "Untertitel (Closed Captions)", "Wiederholung", "Zweikanalton", "Sendungsdatum", "Sendungsbeschreibung", "Aufnahmezeit", "Senderrufzeichen", "Fernsehsendername", "Zusammenfassung", "Suchübereinstimmungsart", "Schnipsel", "Automatische Zusammenfassung", "Relevanz", "Dateibesitz", "Sensitivität", "Freigegeben für", "Freigabestatus", "Produktname", "Produktversion", "Supportlink", "Quelle", "Startdatum", "Ist geteilt", "Verfügbarkeitsstatus", "Abrechnungsinformationen", "Abgeschlossen", "Aufgabenbesitzer", "Sortierung nach Titel", "Gesamtdateigröße", "Marken", "E-Mail des Autors der letzten Änderung", "Name des Autors der letzten Änderung", "Datum der letzten Änderung", "ID der letzten Änderung", "Nachricht zur letzten Änderung", "Versionsstatus", "Videokomprimierung", "Regisseure", "Datenrate", "Bildhöhe", "Einzelbildrate", "Bildbreite", "Kugelförmig", "Stereo", "Videoausrichtung", "Gesamtbitrate" | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"