#region Description
<#	
	Version:			1.0
	Date:				22.02.2026

	Author:      		Pascal Bilat

	Description:		Lo script determina oltre 300 proprietà dei file dalla directory selezionata E dalle sottodirectory. Vengono scansionati tutti i tipi di file.  

    NOTA:               Se la lunghezza del percorso di accesso al file supera i 248 caratteri, nello script PS viene visualizzato un messaggio!

	Parameters:			All'avvio, l'utente deve selezionare la directory di base.

    Properties:         "Nome", "Dimensione", "Tipo elemento", "Ultima modifica", "Data creazione", "Data ultimo accesso", "Attributi", "Stato offline", "Disponibilità", "Tipo percepito", "Proprietario", "Tipologia", "Data acquisizione", "Artisti partecipanti", "Album", "Anno", "Genere", "Conduttori", 
                        "Tag", "Classificazione", "Autori", "Titolo", "Oggetto", "Categorie", "Commenti", "Copyright", "Numero del titolo", "Durata", "Velocità in bit", "Protetto", "Modello fotocamera", "Dimensioni", "Produttore fotocamera", "Società", "Descrizione del file", "Master parole chiave", 
                        "Nome programma", "È online", "È ricorrente", "Ubicazione", "Indirizzi partecipanti facoltativi", "Partecipanti facoltativi", "Indirizzo organizzatore", "Nome organizzatore", "Ora promemoria", "Indirizzi partecipanti obbligatori", "Partecipanti necessari", "Risorse", "Stato riunione", 
                        "Stato disponibilità", "Dimensioni totali", "Nome account", "Stato attività", "Computer", "Anniversario", "Nome assistente", "Telefono assistente", "Compleanno", "Indirizzo (ufficio)", "Città (uff.)", "Paese/area geografica (uff.)", "Casella postale (uff.)", "CAP (uff.)", 
                        "Provincia o stato società", "Via (uff.)", "Fax (uff.)", "Home page società", "Telefono (uff.)", "Numero richiamata automatica", "Telefono automobile", "Figli", "Telefono principale società", "Reparto", "Indirizzo di posta elettronica", "Posta el. 2", "Posta el. 3", 
                        "Elenco posta elettronica", "Nome visualizzato posta elettronica", "Archivia come", "Nome", "Nome completo", "Sesso", "Hobby", "Indirizzo (abitazione)", "Città (ab.)", "Paese/area geografica (ab.)", "Casella postale (ab.)", "CAP (ab.)", "Provincia (ab.)", "Via (ab.)", 
                        "Fax abitazione", "Telefono (ab.)", "Indirizzi IM", "Iniziali", "Posizione", "Etichetta", "Cognome", "Indirizzo postale", "Secondo nome", "Numero di cellulare", "Alternativo", "Ufficio", "Altri indirizzi", "Altra città", "Altro paese o altra area geografica", "Altra casella postale", 
                        "Altro CAP", "Altra provincia", "Altra via", "Cercapersone", "Titolo personale", "Città", "Paese/area geografica", "Casella postale", "CAP", "Provincia", "Indirizzo", "Posta elettronica primaria", "Telefono principale", "Professione", "Coniuge/Partner", "Suffisso", "Telefono TTY/TTD", 
                        "Telex", "Pagina Web", "Stato contenuto", "Tipo contenuto", "Data trasferimento", "Data di archiviazione", "Terminato il", "Categoria dispositivo", "Connesso", "Metodo individuazione", "Nome descrittivo", "Computer locale", "Produttore", "Modello", "Associato",  
                        "Stato", "ID client", "Collaboratori", "Creazione contenuto", "Data ultima stampa", "Data ultimo salvataggio", "Dipartimento", "ID documento", "Pagine", "Diapositive", "Tempo totale di modifica", "Numero parole", "Scadenza", "Data di fine", "Numero file", "Estensione file", "Nome file", 
                        "Versione file", "Colore contrassegno", "Stato contrassegno", "Spazio libero", "Gruppo", "Tipo di condivisione", "Profondità in bit", "Risoluzione orizzontale", "Larghezza", "Risoluzione verticale", "Altezza", "Priorità messaggio", "È un allegato", "È stato eliminato", "Stato di crittografia", 
                        "Con contrassegno", "Completato", "Incompleto", "Stato lettura", "Condiviso", "Creatori", "Data", "Nome cartella", "Posizione del file", "Cartella", "Partecipanti", "Percorso", "Per percorso", "Tipo", "Nomi contatti", "Tipo voce", "Lingua", "Data visita", "Descrizione", "Stato collegamento", 
                        "Destinazione collegamento", "URL", "Elemento multimediale creato", "Data di rilascio", "Autore codifica", "Numero episodio", "Produttori", "Editore", "Numero stagione", "Sottotitolo", "URL Web utente", "Scrittori", "Indirizzi Ccn", "Ccn", "Indirizzi Cc", "Cc", "ID conversazione", 
                        "Data di ricezione", "Data di invio", "Indirizzi origine", "Da", "Con allegati", "Indirizzo mittente", "Mittente", "Archivio", "Indirizzi destinatari", "Titolo azione", "A", "Mileage", "Artista album", "Criterio di ordinamento artista album", "ID album", "Criterio di ordinamento album", 
                        "Criterio di ordinamento artisti partecipanti", "Battute al minuto", "Compositori", "Criterio di ordinamento compositore", "Disco", "Chiave iniziale", "Parte di una compilation", "Umore", "Serie", "Punto", "Colore", "Classificazione per minori", "Motivo classificazione per minori", 
                        "Spazio utilizzato", "Versione EXIF", "Evento", "Programma Esposizione", "Tempo di esposizione", "F-stop", "Modalità flash", "Distanza focale", "lunghezza focale 35 mm", "Sensibilità ISO", "Produttore lenti", "Modello lenti", "Sorgente luminosa", "Massima apertura", "Modalità regolazione", 
                        "Orientamento", "Persone", "Modalità programma", "Saturazione", "Distanza del soggetto", "Bilanciam. bianco", "Priorità", "Progetto", "Numero canale", "Titolo puntata", "Sottotitoli codificati", "Riesegui", "SAP", "Data trasmissione", "Descrizione programma", "Tempo registrazione", 
                        "Call sign stazione", "Nome stazione", "Riepilogo", "Tipo di corrispondenza ricerca", "Frammenti", "Riepilogo automatico", "Pertinenza", "Proprietà del file", "Precisione", "Condiviso con", "Stato condivisione", "Nome prodotto", "Versione", "Collegamento di supporto", "Origine", 
                        "Data di inizio", "Condivisione", "Stato di disponibilità", "Informazioni di pagamento", "Completata", "Proprietario attività", "Criterio di ordinamento titolo", "Dimensioni file totale", "Marchi depositati", "Messaggio di posta elettronica dell'autore dell'ultima modifica", "Nome autore ultima modifica", 
                        "Data ultima modifica", "ID ultima modifica", "Messaggio dell'ultima modifica", "Stato versione", "Compressione video", "Amministrazione", "Velocità dati", "Altezza fotogramma", "Frequenza dei fotogrammi", "Larghezza fotogramma", "Sferico", "Stereo", "Orientamento video", "Velocità in bit complessiva"

#>
#endregion

# Show an Open Folder Dialog and return the directory selected by the user.
function Get-FolderName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Position=0)]
        [string]$Message = "Seleziona la tua directory di base...",

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
if ($folder) { Write-Host "Hai selezionato la cartella: $folder" ausgewählt}
else { "Non hai selezionato NESSUNA cartella!" }

# Prompt User to accept Folder Path OR the enter another Path and File Name
$defaultValue = 'C:\Temp\Get-FileAttributes-ITA.csv'
$result = Read-Host "Premere il tasto Invio per accettare il percorso e il nome file predefiniti OPPURE inserire un altro percorso e un altro nome file. [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
[array]$include = @("*.*")

# Se desideri scansionare solo i files MS Office, modifica il valore in [array]$include = @("*.*"), ad esempio...
# [array]$include = @("*.accda, *.accdb, *.accde, *.accdt, *.accdu, *.doc, *.docm, *.docx, *.dot, *.dotm, *.dotx, *.one, *.pot, *.potm, *.potx, *.ppa, *.ppam, *.pps, *.ppsm, *.ppsx, *.ppt, *.pptm, *.pptx, *.pub, *.sldm, *.sldx, *.wbk, *.wll, *.wwl, *.xla, *.xla5, *.xla8, *.xlam, *.xll, *.xll, *.xlm, *.xls, *.xlsb, *.xlsm, *.xlsx, *.xlt, *.xltm, *.xltx, *.xlw*, *.odt, *.ods, *.ots, *.odp, *.otp, *.odg, *.odm, *.odb")


#Get-ChildItem $path -Recurse -Include $include   | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include $include | ? { !$_.PsIsContainer } | % {

	$shellfolder = $shell.Namespace($_.DirectoryName)
	$shellfile = $shellfolder.ParseName($_.Name)
	New-Object PSObject -Property @{

"Nome" = $shellfolder.GetDetailsOf($shellfile,  0)
"Dimensione" = $shellfolder.GetDetailsOf($shellfile,  1)
"Tipo elemento" = $shellfolder.GetDetailsOf($shellfile,  2)
"Ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  3)
"Data creazione" = $shellfolder.GetDetailsOf($shellfile,  4)
"Data ultimo accesso" = $shellfolder.GetDetailsOf($shellfile,  5)
"Attributi" = $shellfolder.GetDetailsOf($shellfile,  6)
"Stato offline" = $shellfolder.GetDetailsOf($shellfile,  7)
"Disponibilità" = $shellfolder.GetDetailsOf($shellfile,  8)
"Tipo percepito" = $shellfolder.GetDetailsOf($shellfile,  9)
"Proprietario" = $shellfolder.GetDetailsOf($shellfile,  10)
"Tipologia" = $shellfolder.GetDetailsOf($shellfile,  11)
"Data acquisizione" = $shellfolder.GetDetailsOf($shellfile,  12)
"Artisti partecipanti" = $shellfolder.GetDetailsOf($shellfile,  13)
"Album" = $shellfolder.GetDetailsOf($shellfile,  14)
"Anno" = $shellfolder.GetDetailsOf($shellfile,  15)
"Genere" = $shellfolder.GetDetailsOf($shellfile,  16)
"Conduttori" = $shellfolder.GetDetailsOf($shellfile,  17)
"Tag" = $shellfolder.GetDetailsOf($shellfile,  18)
"Classificazione" = $shellfolder.GetDetailsOf($shellfile,  19)
"Autori" = $shellfolder.GetDetailsOf($shellfile,  20)
"Titolo" = $shellfolder.GetDetailsOf($shellfile,  21)
"Oggetto" = $shellfolder.GetDetailsOf($shellfile,  22)
"Categorie" = $shellfolder.GetDetailsOf($shellfile,  23)
"Commenti" = $shellfolder.GetDetailsOf($shellfile,  24)
"Copyright" = $shellfolder.GetDetailsOf($shellfile,  25)
"Numero del titolo" = $shellfolder.GetDetailsOf($shellfile,  26)
"Durata" = $shellfolder.GetDetailsOf($shellfile,  27)
"Velocità in bit" = $shellfolder.GetDetailsOf($shellfile,  28)
"Protetto" = $shellfolder.GetDetailsOf($shellfile,  29)
"Modello fotocamera" = $shellfolder.GetDetailsOf($shellfile,  30)
"Dimensioni" = $shellfolder.GetDetailsOf($shellfile,  31)
"Produttore fotocamera" = $shellfolder.GetDetailsOf($shellfile,  32)
"Società" = $shellfolder.GetDetailsOf($shellfile,  33)
"Descrizione del file" = $shellfolder.GetDetailsOf($shellfile,  34)
"Master parole chiave" = $shellfolder.GetDetailsOf($shellfile,  35)
"Nome programma" = $shellfolder.GetDetailsOf($shellfile,  42)
"È online" = $shellfolder.GetDetailsOf($shellfile,  44)
"È ricorrente" = $shellfolder.GetDetailsOf($shellfile,  45)
"Ubicazione" = $shellfolder.GetDetailsOf($shellfile,  46)
"Indirizzi partecipanti facoltativi" = $shellfolder.GetDetailsOf($shellfile,  47)
"Partecipanti facoltativi" = $shellfolder.GetDetailsOf($shellfile,  48)
"Indirizzo organizzatore" = $shellfolder.GetDetailsOf($shellfile,  49)
"Nome organizzatore" = $shellfolder.GetDetailsOf($shellfile,  50)
"Ora promemoria" = $shellfolder.GetDetailsOf($shellfile,  51)
"Indirizzi partecipanti obbligatori" = $shellfolder.GetDetailsOf($shellfile,  52)
"Partecipanti necessari" = $shellfolder.GetDetailsOf($shellfile,  53)
"Risorse" = $shellfolder.GetDetailsOf($shellfile,  54)
"Stato riunione" = $shellfolder.GetDetailsOf($shellfile,  55)
"Stato disponibilità" = $shellfolder.GetDetailsOf($shellfile,  56)
"Dimensioni totali" = $shellfolder.GetDetailsOf($shellfile,  57)
"Nome account" = $shellfolder.GetDetailsOf($shellfile,  58)
"Stato attività" = $shellfolder.GetDetailsOf($shellfile,  60)
"Computer" = $shellfolder.GetDetailsOf($shellfile,  61)
"Anniversario" = $shellfolder.GetDetailsOf($shellfile,  62)
"Nome assistente" = $shellfolder.GetDetailsOf($shellfile,  63)
"Telefono assistente" = $shellfolder.GetDetailsOf($shellfile,  64)
"Compleanno" = $shellfolder.GetDetailsOf($shellfile,  65)
"Indirizzo (ufficio)" = $shellfolder.GetDetailsOf($shellfile,  66)
"Città (uff.)" = $shellfolder.GetDetailsOf($shellfile,  67)
"Paese/area geografica (uff.)" = $shellfolder.GetDetailsOf($shellfile,  68)
"Casella postale (uff.)" = $shellfolder.GetDetailsOf($shellfile,  69)
"CAP (uff.)" = $shellfolder.GetDetailsOf($shellfile,  70)
"Provincia o stato società" = $shellfolder.GetDetailsOf($shellfile,  71)
"Via (uff.)" = $shellfolder.GetDetailsOf($shellfile,  72)
"Fax (uff.)" = $shellfolder.GetDetailsOf($shellfile,  73)
"Home page società" = $shellfolder.GetDetailsOf($shellfile,  74)
"Telefono (uff.)" = $shellfolder.GetDetailsOf($shellfile,  75)
"Numero richiamata automatica" = $shellfolder.GetDetailsOf($shellfile,  76)
"Telefono automobile" = $shellfolder.GetDetailsOf($shellfile,  77)
"Figli" = $shellfolder.GetDetailsOf($shellfile,  78)
"Telefono principale società" = $shellfolder.GetDetailsOf($shellfile,  79)
"Reparto" = $shellfolder.GetDetailsOf($shellfile,  80)
"Indirizzo di posta elettronica" = $shellfolder.GetDetailsOf($shellfile,  81)
"Posta el. 2" = $shellfolder.GetDetailsOf($shellfile,  82)
"Posta el. 3" = $shellfolder.GetDetailsOf($shellfile,  83)
"Elenco posta elettronica" = $shellfolder.GetDetailsOf($shellfile,  84)
"Nome visualizzato posta elettronica" = $shellfolder.GetDetailsOf($shellfile,  85)
"Archivia come" = $shellfolder.GetDetailsOf($shellfile,  86)
"Nome completo" = $shellfolder.GetDetailsOf($shellfile,  88)
"Sesso" = $shellfolder.GetDetailsOf($shellfile,  89)
"Hobby" = $shellfolder.GetDetailsOf($shellfile,  91)
"Indirizzo (abitazione)" = $shellfolder.GetDetailsOf($shellfile,  92)
"Città (ab.)" = $shellfolder.GetDetailsOf($shellfile,  93)
"Paese/area geografica (ab.)" = $shellfolder.GetDetailsOf($shellfile,  94)
"Casella postale (ab.)" = $shellfolder.GetDetailsOf($shellfile,  95)
"CAP (ab.)" = $shellfolder.GetDetailsOf($shellfile,  96)
"Provincia (ab.)" = $shellfolder.GetDetailsOf($shellfile,  97)
"Via (ab.)" = $shellfolder.GetDetailsOf($shellfile,  98)
"Fax abitazione" = $shellfolder.GetDetailsOf($shellfile,  99)
"Telefono (ab.)" = $shellfolder.GetDetailsOf($shellfile,  100)
"Indirizzi IM" = $shellfolder.GetDetailsOf($shellfile,  101)
"Iniziali" = $shellfolder.GetDetailsOf($shellfile,  102)
"Posizione" = $shellfolder.GetDetailsOf($shellfile,  103)
"Etichetta" = $shellfolder.GetDetailsOf($shellfile,  104)
"Cognome" = $shellfolder.GetDetailsOf($shellfile,  105)
"Indirizzo postale" = $shellfolder.GetDetailsOf($shellfile,  106)
"Secondo nome" = $shellfolder.GetDetailsOf($shellfile,  107)
"Numero di cellulare" = $shellfolder.GetDetailsOf($shellfile,  108)
"Alternativo" = $shellfolder.GetDetailsOf($shellfile,  109)
"Ufficio" = $shellfolder.GetDetailsOf($shellfile,  110)
"Altri indirizzi" = $shellfolder.GetDetailsOf($shellfile,  111)
"Altra città" = $shellfolder.GetDetailsOf($shellfile,  112)
"Altro paese o altra area geografica" = $shellfolder.GetDetailsOf($shellfile,  113)
"Altra casella postale" = $shellfolder.GetDetailsOf($shellfile,  114)
"Altro CAP" = $shellfolder.GetDetailsOf($shellfile,  115)
"Altra provincia" = $shellfolder.GetDetailsOf($shellfile,  116)
"Altra via" = $shellfolder.GetDetailsOf($shellfile,  117)
"Cercapersone" = $shellfolder.GetDetailsOf($shellfile,  118)
"Titolo personale" = $shellfolder.GetDetailsOf($shellfile,  119)
"Città" = $shellfolder.GetDetailsOf($shellfile,  120)
"Paese/area geografica" = $shellfolder.GetDetailsOf($shellfile,  121)
"Casella postale" = $shellfolder.GetDetailsOf($shellfile,  122)
"CAP" = $shellfolder.GetDetailsOf($shellfile,  123)
"Provincia" = $shellfolder.GetDetailsOf($shellfile,  124)
"Indirizzo" = $shellfolder.GetDetailsOf($shellfile,  125)
"Posta elettronica primaria" = $shellfolder.GetDetailsOf($shellfile,  126)
"Telefono principale" = $shellfolder.GetDetailsOf($shellfile,  127)
"Professione" = $shellfolder.GetDetailsOf($shellfile,  128)
"Coniuge/Partner" = $shellfolder.GetDetailsOf($shellfile,  129)
"Suffisso" = $shellfolder.GetDetailsOf($shellfile,  130)
"Telefono TTY/TTD" = $shellfolder.GetDetailsOf($shellfile,  131)
"Telex" = $shellfolder.GetDetailsOf($shellfile,  132)
"Pagina Web" = $shellfolder.GetDetailsOf($shellfile,  133)
"Stato contenuto" = $shellfolder.GetDetailsOf($shellfile,  134)
"Tipo contenuto" = $shellfolder.GetDetailsOf($shellfile,  135)
"Data trasferimento" = $shellfolder.GetDetailsOf($shellfile,  136)
"Data di archiviazione" = $shellfolder.GetDetailsOf($shellfile,  137)
"Terminato il" = $shellfolder.GetDetailsOf($shellfile,  138)
"Categoria dispositivo" = $shellfolder.GetDetailsOf($shellfile,  139)
"Connesso" = $shellfolder.GetDetailsOf($shellfile,  140)
"Metodo individuazione" = $shellfolder.GetDetailsOf($shellfile,  141)
"Nome descrittivo" = $shellfolder.GetDetailsOf($shellfile,  142)
"Computer locale" = $shellfolder.GetDetailsOf($shellfile,  143)
"Produttore" = $shellfolder.GetDetailsOf($shellfile,  144)
"Modello" = $shellfolder.GetDetailsOf($shellfile,  145)
"Associato" = $shellfolder.GetDetailsOf($shellfile,  146)
"Stato" = $shellfolder.GetDetailsOf($shellfile,  149)
"ID client" = $shellfolder.GetDetailsOf($shellfile,  150)
"Collaboratori" = $shellfolder.GetDetailsOf($shellfile,  151)
"Creazione contenuto" = $shellfolder.GetDetailsOf($shellfile,  152)
"Data ultima stampa" = $shellfolder.GetDetailsOf($shellfile,  153)
"Data ultimo salvataggio" = $shellfolder.GetDetailsOf($shellfile,  154)
"Dipartimento" = $shellfolder.GetDetailsOf($shellfile,  155)
"ID documento" = $shellfolder.GetDetailsOf($shellfile,  156)
"Pagine" = $shellfolder.GetDetailsOf($shellfile,  157)
"Diapositive" = $shellfolder.GetDetailsOf($shellfile,  158)
"Tempo totale di modifica" = $shellfolder.GetDetailsOf($shellfile,  159)
"Numero parole" = $shellfolder.GetDetailsOf($shellfile,  160)
"Scadenza" = $shellfolder.GetDetailsOf($shellfile,  161)
"Data di fine" = $shellfolder.GetDetailsOf($shellfile,  162)
"Numero file" = $shellfolder.GetDetailsOf($shellfile,  163)
"Estensione file" = $shellfolder.GetDetailsOf($shellfile,  164)
"Nome file" = $shellfolder.GetDetailsOf($shellfile,  165)
"Versione file" = $shellfolder.GetDetailsOf($shellfile,  166)
"Colore contrassegno" = $shellfolder.GetDetailsOf($shellfile,  167)
"Stato contrassegno" = $shellfolder.GetDetailsOf($shellfile,  168)
"Spazio libero" = $shellfolder.GetDetailsOf($shellfile,  169)
"Gruppo" = $shellfolder.GetDetailsOf($shellfile,  172)
"Tipo di condivisione" = $shellfolder.GetDetailsOf($shellfile,  173)
"Profondità in bit" = $shellfolder.GetDetailsOf($shellfile,  174)
"Risoluzione orizzontale" = $shellfolder.GetDetailsOf($shellfile,  175)
"Larghezza" = $shellfolder.GetDetailsOf($shellfile,  176)
"Risoluzione verticale" = $shellfolder.GetDetailsOf($shellfile,  177)
"Altezza" = $shellfolder.GetDetailsOf($shellfile,  178)
"Priorità messaggio" = $shellfolder.GetDetailsOf($shellfile,  179)
"È un allegato" = $shellfolder.GetDetailsOf($shellfile,  180)
"È stato eliminato" = $shellfolder.GetDetailsOf($shellfile,  181)
"Stato di crittografia" = $shellfolder.GetDetailsOf($shellfile,  182)
"Con contrassegno" = $shellfolder.GetDetailsOf($shellfile,  183)
"Completato" = $shellfolder.GetDetailsOf($shellfile,  184)
"Incompleto" = $shellfolder.GetDetailsOf($shellfile,  185)
"Stato lettura" = $shellfolder.GetDetailsOf($shellfile,  186)
"Condiviso" = $shellfolder.GetDetailsOf($shellfile,  187)
"Creatori" = $shellfolder.GetDetailsOf($shellfile,  188)
"Data" = $shellfolder.GetDetailsOf($shellfile,  189)
"Nome cartella" = $shellfolder.GetDetailsOf($shellfile,  190)
"Posizione del file" = $shellfolder.GetDetailsOf($shellfile,  191)
"Cartella" = $shellfolder.GetDetailsOf($shellfile,  192)
"Partecipanti" = $shellfolder.GetDetailsOf($shellfile,  193)
"Percorso" = $shellfolder.GetDetailsOf($shellfile,  194)
"Per percorso" = $shellfolder.GetDetailsOf($shellfile,  195)
"Tipo" = $shellfolder.GetDetailsOf($shellfile,  196)
"Nomi contatti" = $shellfolder.GetDetailsOf($shellfile,  197)
"Tipo voce" = $shellfolder.GetDetailsOf($shellfile,  198)
"Lingua" = $shellfolder.GetDetailsOf($shellfile,  199)
"Data visita" = $shellfolder.GetDetailsOf($shellfile,  200)
"Descrizione" = $shellfolder.GetDetailsOf($shellfile,  201)
"Stato collegamento" = $shellfolder.GetDetailsOf($shellfile,  202)
"Destinazione collegamento" = $shellfolder.GetDetailsOf($shellfile,  203)
"URL" = $shellfolder.GetDetailsOf($shellfile,  204)
"Elemento multimediale creato" = $shellfolder.GetDetailsOf($shellfile,  208)
"Data di rilascio" = $shellfolder.GetDetailsOf($shellfile,  209)
"Autore codifica" = $shellfolder.GetDetailsOf($shellfile,  210)
"Numero episodio" = $shellfolder.GetDetailsOf($shellfile,  211)
"Produttori" = $shellfolder.GetDetailsOf($shellfile,  212)
"Editore" = $shellfolder.GetDetailsOf($shellfile,  213)
"Numero stagione" = $shellfolder.GetDetailsOf($shellfile,  214)
"Sottotitolo" = $shellfolder.GetDetailsOf($shellfile,  215)
"URL Web utente" = $shellfolder.GetDetailsOf($shellfile,  216)
"Scrittori" = $shellfolder.GetDetailsOf($shellfile,  217)
"Indirizzi Ccn" = $shellfolder.GetDetailsOf($shellfile,  220)
"Ccn" = $shellfolder.GetDetailsOf($shellfile,  221)
"Indirizzi Cc" = $shellfolder.GetDetailsOf($shellfile,  222)
"Cc" = $shellfolder.GetDetailsOf($shellfile,  223)
"ID conversazione" = $shellfolder.GetDetailsOf($shellfile,  224)
"Data di ricezione" = $shellfolder.GetDetailsOf($shellfile,  225)
"Data di invio" = $shellfolder.GetDetailsOf($shellfile,  226)
"Indirizzi origine" = $shellfolder.GetDetailsOf($shellfile,  227)
"Da" = $shellfolder.GetDetailsOf($shellfile,  228)
"Con allegati" = $shellfolder.GetDetailsOf($shellfile,  229)
"Indirizzo mittente" = $shellfolder.GetDetailsOf($shellfile,  230)
"Mittente" = $shellfolder.GetDetailsOf($shellfile,  231)
"Archivio" = $shellfolder.GetDetailsOf($shellfile,  232)
"Indirizzi destinatari" = $shellfolder.GetDetailsOf($shellfile,  233)
"Titolo azione" = $shellfolder.GetDetailsOf($shellfile,  234)
"A" = $shellfolder.GetDetailsOf($shellfile,  235)
"Mileage" = $shellfolder.GetDetailsOf($shellfile,  236)
"Artista album" = $shellfolder.GetDetailsOf($shellfile,  237)
"Criterio di ordinamento artista album" = $shellfolder.GetDetailsOf($shellfile,  238)
"ID album" = $shellfolder.GetDetailsOf($shellfile,  239)
"Criterio di ordinamento album" = $shellfolder.GetDetailsOf($shellfile,  240)
"Criterio di ordinamento artisti partecipanti" = $shellfolder.GetDetailsOf($shellfile,  241)
"Battute al minuto" = $shellfolder.GetDetailsOf($shellfile,  242)
"Compositori" = $shellfolder.GetDetailsOf($shellfile,  243)
"Criterio di ordinamento compositore" = $shellfolder.GetDetailsOf($shellfile,  244)
"Disco" = $shellfolder.GetDetailsOf($shellfile,  245)
"Chiave iniziale" = $shellfolder.GetDetailsOf($shellfile,  246)
"Parte di una compilation" = $shellfolder.GetDetailsOf($shellfile,  247)
"Umore" = $shellfolder.GetDetailsOf($shellfile,  248)
"Serie" = $shellfolder.GetDetailsOf($shellfile,  249)
"Punto" = $shellfolder.GetDetailsOf($shellfile,  250)
"Colore" = $shellfolder.GetDetailsOf($shellfile,  251)
"Classificazione per minori" = $shellfolder.GetDetailsOf($shellfile,  252)
"Motivo classificazione per minori" = $shellfolder.GetDetailsOf($shellfile,  253)
"Spazio utilizzato" = $shellfolder.GetDetailsOf($shellfile,  254)
"Versione EXIF" = $shellfolder.GetDetailsOf($shellfile,  255)
"Evento" = $shellfolder.GetDetailsOf($shellfile,  256)
"Programma Esposizione" = $shellfolder.GetDetailsOf($shellfile,  258)
"Tempo di esposizione" = $shellfolder.GetDetailsOf($shellfile,  259)
"F-stop" = $shellfolder.GetDetailsOf($shellfile,  260)
"Modalità flash" = $shellfolder.GetDetailsOf($shellfile,  261)
"Distanza focale" = $shellfolder.GetDetailsOf($shellfile,  262)
"lunghezza focale 35 mm" = $shellfolder.GetDetailsOf($shellfile,  263)
"Sensibilità ISO" = $shellfolder.GetDetailsOf($shellfile,  264)
"Produttore lenti" = $shellfolder.GetDetailsOf($shellfile,  265)
"Modello lenti" = $shellfolder.GetDetailsOf($shellfile,  266)
"Sorgente luminosa" = $shellfolder.GetDetailsOf($shellfile,  267)
"Massima apertura" = $shellfolder.GetDetailsOf($shellfile,  268)
"Modalità regolazione" = $shellfolder.GetDetailsOf($shellfile,  269)
"Orientamento" = $shellfolder.GetDetailsOf($shellfile,  270)
"Persone" = $shellfolder.GetDetailsOf($shellfile,  271)
"Modalità programma" = $shellfolder.GetDetailsOf($shellfile,  272)
"Saturazione" = $shellfolder.GetDetailsOf($shellfile,  273)
"Distanza del soggetto" = $shellfolder.GetDetailsOf($shellfile,  274)
"Bilanciam. bianco" = $shellfolder.GetDetailsOf($shellfile,  275)
"Priorità" = $shellfolder.GetDetailsOf($shellfile,  276)
"Progetto" = $shellfolder.GetDetailsOf($shellfile,  277)
"Numero canale" = $shellfolder.GetDetailsOf($shellfile,  278)
"Titolo puntata" = $shellfolder.GetDetailsOf($shellfile,  279)
"Sottotitoli codificati" = $shellfolder.GetDetailsOf($shellfile,  280)
"Riesegui" = $shellfolder.GetDetailsOf($shellfile,  281)
"SAP" = $shellfolder.GetDetailsOf($shellfile,  282)
"Data trasmissione" = $shellfolder.GetDetailsOf($shellfile,  283)
"Descrizione programma" = $shellfolder.GetDetailsOf($shellfile,  284)
"Tempo registrazione" = $shellfolder.GetDetailsOf($shellfile,  285)
"Call sign stazione" = $shellfolder.GetDetailsOf($shellfile,  286)
"Nome stazione" = $shellfolder.GetDetailsOf($shellfile,  287)
"Riepilogo" = $shellfolder.GetDetailsOf($shellfile,  289)
"Tipo di corrispondenza ricerca" = $shellfolder.GetDetailsOf($shellfile,  290)
"Frammenti" = $shellfolder.GetDetailsOf($shellfile,  291)
"Riepilogo automatico" = $shellfolder.GetDetailsOf($shellfile,  292)
"Pertinenza" = $shellfolder.GetDetailsOf($shellfile,  293)
"Proprietà del file" = $shellfolder.GetDetailsOf($shellfile,  294)
"Precisione" = $shellfolder.GetDetailsOf($shellfile,  295)
"Condiviso con" = $shellfolder.GetDetailsOf($shellfile,  296)
"Stato condivisione" = $shellfolder.GetDetailsOf($shellfile,  297)
"Nome prodotto" = $shellfolder.GetDetailsOf($shellfile,  299)
"Versione" = $shellfolder.GetDetailsOf($shellfile,  300)
"Collegamento di supporto" = $shellfolder.GetDetailsOf($shellfile,  301)
"Origine" = $shellfolder.GetDetailsOf($shellfile,  302)
"Data di inizio" = $shellfolder.GetDetailsOf($shellfile,  303)
"Condivisione" = $shellfolder.GetDetailsOf($shellfile,  304)
"Stato di disponibilità" = $shellfolder.GetDetailsOf($shellfile,  306)
"Informazioni di pagamento" = $shellfolder.GetDetailsOf($shellfile,  307)
"Completata" = $shellfolder.GetDetailsOf($shellfile,  308)
"Proprietario attività" = $shellfolder.GetDetailsOf($shellfile,  309)
"Criterio di ordinamento titolo" = $shellfolder.GetDetailsOf($shellfile,  310)
"Dimensioni file totale" = $shellfolder.GetDetailsOf($shellfile,  311)
"Marchi depositati" = $shellfolder.GetDetailsOf($shellfile,  312)
"Messaggio di posta elettronica dell'autore dell'ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  313)
"Nome autore ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  314)
"Data ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  315)
"ID ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  316)
"Messaggio dell'ultima modifica" = $shellfolder.GetDetailsOf($shellfile,  317)
"Stato versione" = $shellfolder.GetDetailsOf($shellfile,  318)
"Compressione video" = $shellfolder.GetDetailsOf($shellfile,  319)
"Amministrazione" = $shellfolder.GetDetailsOf($shellfile,  320)
"Velocità dati" = $shellfolder.GetDetailsOf($shellfile,  321)
"Altezza fotogramma" = $shellfolder.GetDetailsOf($shellfile,  322)
"Frequenza dei fotogrammi" = $shellfolder.GetDetailsOf($shellfile,  323)
"Larghezza fotogramma" = $shellfolder.GetDetailsOf($shellfile,  324)
"Sferico" = $shellfolder.GetDetailsOf($shellfile,  325)
"Stereo" = $shellfolder.GetDetailsOf($shellfile,  326)
"Orientamento video" = $shellfolder.GetDetailsOf($shellfile,  327)
"Velocità in bit complessiva" = $shellfolder.GetDetailsOf($shellfile,  328)

	}
}| select "Posizione del file", "Nome", "Dimensione", "Estensione file", "Tipo elemento", "Ultima modifica", "Data creazione", "Data ultimo accesso", "Attributi", "Stato offline", "Disponibilità", "Tipo percepito", "Proprietario", "Tipologia", "Data acquisizione", "Artisti partecipanti", "Album", "Anno", "Genere", "Conduttori", "Tag", "Classificazione", "Autori", "Titolo", "Oggetto", "Categorie", "Commenti", "Copyright", "Numero del titolo", "Durata", "Velocità in bit", "Protetto", "Modello fotocamera", "Dimensioni", "Produttore fotocamera", "Società", "Descrizione del file", "Master parole chiave", "Nome programma", "È online", "È ricorrente", "Ubicazione", "Indirizzi partecipanti facoltativi", "Partecipanti facoltativi", "Indirizzo organizzatore", "Nome organizzatore", "Ora promemoria", "Indirizzi partecipanti obbligatori", "Partecipanti necessari", "Risorse", "Stato riunione", "Stato disponibilità", "Dimensioni totali", "Nome account", "Stato attività", "Computer", "Anniversario", "Nome assistente", "Telefono assistente", "Compleanno", "Indirizzo (ufficio)", "Città (uff.)", "Paese/area geografica (uff.)", "Casella postale (uff.)", "CAP (uff.)", "Provincia o stato società", "Via (uff.)", "Fax (uff.)", "Home page società", "Telefono (uff.)", "Numero richiamata automatica", "Telefono automobile", "Figli", "Telefono principale società", "Reparto", "Indirizzo di posta elettronica", "Posta el. 2", "Posta el. 3", "Elenco posta elettronica", "Nome visualizzato posta elettronica", "Archivia come", "Nome completo", "Sesso", "Hobby", "Indirizzo (abitazione)", "Città (ab.)", "Paese/area geografica (ab.)", "Casella postale (ab.)", "CAP (ab.)", "Provincia (ab.)", "Via (ab.)", "Fax abitazione", "Telefono (ab.)", "Indirizzi IM", "Iniziali", "Posizione", "Etichetta", "Cognome", "Indirizzo postale", "Secondo nome", "Numero di cellulare", "Alternativo", "Ufficio", "Altri indirizzi", "Altra città", "Altro paese o altra area geografica", "Altra casella postale", "Altro CAP", "Altra provincia", "Altra via", "Cercapersone", "Titolo personale", "Città", "Paese/area geografica", "Casella postale", "CAP", "Provincia", "Indirizzo", "Posta elettronica primaria", "Telefono principale", "Professione", "Coniuge/Partner", "Suffisso", "Telefono TTY/TTD", "Telex", "Pagina Web", "Stato contenuto", "Tipo contenuto", "Data trasferimento", "Data di archiviazione", "Terminato il", "Categoria dispositivo", "Connesso", "Metodo individuazione", "Nome descrittivo", "Computer locale", "Produttore", "Modello", "Associato", "Stato", "ID client", "Collaboratori", "Creazione contenuto", "Data ultima stampa", "Data ultimo salvataggio", "Dipartimento", "ID documento", "Pagine", "Diapositive", "Tempo totale di modifica", "Numero parole", "Scadenza", "Data di fine", "Numero file", "Nome file", "Versione file", "Colore contrassegno", "Stato contrassegno", "Spazio libero", "Gruppo", "Tipo di condivisione", "Profondità in bit", "Risoluzione orizzontale", "Larghezza", "Risoluzione verticale", "Altezza", "Priorità messaggio", "È un allegato", "È stato eliminato", "Stato di crittografia", "Con contrassegno", "Completato", "Incompleto", "Stato lettura", "Condiviso", "Creatori", "Data", "Nome cartella", "Cartella", "Partecipanti", "Percorso", "Per percorso", "Tipo", "Nomi contatti", "Tipo voce", "Lingua", "Data visita", "Descrizione", "Stato collegamento", "Destinazione collegamento", "URL", "Elemento multimediale creato", "Data di rilascio", "Autore codifica", "Numero episodio", "Produttori", "Editore", "Numero stagione", "Sottotitolo", "URL Web utente", "Scrittori", "Indirizzi Ccn", "Ccn", "Indirizzi Cc", "Cc", "ID conversazione", "Data di ricezione", "Data di invio", "Indirizzi origine", "Da", "Con allegati", "Indirizzo mittente", "Mittente", "Archivio", "Indirizzi destinatari", "Titolo azione", "A", "Mileage", "Artista album", "Criterio di ordinamento artista album", "ID album", "Criterio di ordinamento album", "Criterio di ordinamento artisti partecipanti", "Battute al minuto", "Compositori", "Criterio di ordinamento compositore", "Disco", "Chiave iniziale", "Parte di una compilation", "Umore", "Serie", "Punto", "Colore", "Classificazione per minori", "Motivo classificazione per minori", "Spazio utilizzato", "Versione EXIF", "Evento", "Programma Esposizione", "Tempo di esposizione", "F-stop", "Modalità flash", "Distanza focale", "lunghezza focale 35 mm", "Sensibilità ISO", "Produttore lenti", "Modello lenti", "Sorgente luminosa", "Massima apertura", "Modalità regolazione", "Orientamento", "Persone", "Modalità programma", "Saturazione", "Distanza del soggetto", "Bilanciam. bianco", "Priorità", "Progetto", "Numero canale", "Titolo puntata", "Sottotitoli codificati", "Riesegui", "SAP", "Data trasmissione", "Descrizione programma", "Tempo registrazione", "Call sign stazione", "Nome stazione", "Riepilogo", "Tipo di corrispondenza ricerca", "Frammenti", "Riepilogo automatico", "Pertinenza", "Proprietà del file", "Precisione", "Condiviso con", "Stato condivisione", "Nome prodotto", "Versione", "Collegamento di supporto", "Origine", "Data di inizio", "Condivisione", "Stato di disponibilità", "Informazioni di pagamento", "Completata", "Proprietario attività", "Criterio di ordinamento titolo", "Dimensioni file totale", "Marchi depositati", "Messaggio di posta elettronica dell'autore dell'ultima modifica", "Nome autore ultima modifica", "Data ultima modifica", "ID ultima modifica", "Messaggio dell'ultima modifica", "Stato versione", "Compressione video", "Amministrazione", "Velocità dati", "Altezza fotogramma", "Frequenza dei fotogrammi", "Larghezza fotogramma", "Sferico", "Stereo", "Orientamento video", "Velocità in bit complessiva" | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"