#region Description
<#	
	Version:			1.0
	Date:				21.02.2026

	Author:      		Pascal Bilat

	Description:		Le script détermine plus de 300 propriétés de fichiers à partir du répertoire sélectionné ET des sous-répertoires. Tous les types de fichiers sont scannés. 

    BEMERKUNG:          Si la longueur du chemin d'accès au fichier dépasse 248 caractères, un message apparaît dans le script PS !

	Parameters:			Au démarrage, l'utilisateur doit sélectionner le répertoire de base.

    Properties:         "Nom", "Taille", "Type d’élément", "Modifié le", "Date de création", "Date d’accès", "Attributs", "État hors connexion", "Disponibilité", "Type identifié", "Propriétaire", "Sorte", "Prise de vue", "Interprètes ayant participé", 
    (scannées)          "Album", "Année", "Genre", "Chefs d’orchestre", "Mots clés", "Notation", "Auteurs", "Titre", "Objet", "Catégories", "Commentaires", "Copyright", "N°", "Durée", "Débit binaire", "Protégé", "Modèle d'appareil photo", "Dimensions", 
                        "Marque appareil photo", "Entreprise", "Description du fichier", "Mots-clés des formes de base", "Nom du programme", "Connecté", "Périodique", "Emplacement", "Adresses des participants facultatifs", "Participants facultatifs", 
                        "Adresse de l’organisateur", "Nom de l’organisateur", "Heure du rappel", "Adresses des participants obligatoires", "Participants obligatoires", "Ressources", "État de la réunion", "Statut de disponibilité", "Taille totale", 
                        "Nom du compte", "Statut de la tâche", "Ordinateur", "Anniversaire de mariage ou fête", "Nom de l’assistant", "Téléphone de l’assistant", "Anniversaire", "Adresse professionnelle", "Ville (bureau)", "Pays/région (bureau)", 
                        "Boîte postale (bureau)", "Code postal (bureau)", "Département ou région (bureau)", "Rue (bureau)", "Télécopie professionnelle", "Page d’accueil professionnelle", "Téléphone professionnel", "Numéro de rappel", "Tél. voiture", 
                        "Enfants", "Téléphone société", "Service", "Adresse de messagerie", "Adresse de messagerie 2", "Adresse de messagerie 3", "Liste des messages électroniques", "Adresse de messagerie complète", "Enregistrer sous", "Prénom", 
                        "Nom complet", "Sexe", "Loisirs", "Adresse (domicile)", "Ville (domicile)", "Pays/région (domicile)", "Boîte postale (domicile)", "Code postal (domicile)", "Département (domicile)", "Rue (domicile)", "Télécopieur personnel", 
                        "Téléphone personnel", "Adresses de messagerie instantanée", "Initiales", "Fonction", "Étiquette", "Nom de famille", "Adresse", "Deuxième prénom", "Téléphone portable", "Surnom", "Adresse de bureau", "Autre adresse", "Autre ville", 
                        "Autre pays/région", "Autre boîte postale", "Autre code postal", "Autre département ou province", "Autre rue", "Récepteur d’appel", "Titre personnel", "Ville", "Pays/région", "Boîte postale", "Code postal", "Département ou région", "Rue", 
                        "Adresse de messagerie principale", "Téléphone principal", "Profession", "Conjoint(e)/Partenaire", "Suffixe", "Téléphone TTY/TTD", "Télex", "Page Web", "État du contenu", "Type de contenu", "Date d’acquisition", "Date d’archivage", "Date terminée", 
                        "Catégorie de périphérique", "Connecté", "Méthode de découverte", "Nom convivial", "Ordinateur local", "Fabricant", "Modèle", "Couplé", "Classification", "État", "ID du client", "Collaborateurs", "Contenu créé", "Dernière impression", 
                        "Date du dernier enregistrement", "Division", "ID de document", "Pages", "Diapositives", "Temps total d’édition", "Nombre de mots", "Échéance", "Date de fin", "Nombre de fichiers", "Extension du fichier", "Nom de fichier", "Version du fichier", 
                        "Couleur de l’indicateur", "État des indicateurs", "Espace libre", "Groupe", "Type de partage", "Profondeur de couleur", "Résolution horizontale", "Largeur", "Résolution verticale", "Hauteur", "Importance", "Est une pièce jointe", "Est supprimé", 
                        "État du chiffrement", "Avec indicateur", "Est terminé", "Incomplet", "État de la lecture", "Partagée", "Créateurs", "Date", "NomDossier", "Emplacement du fichier", "Dossier", "Participants", "Chemin d’accès", "Par emplacement", "Type", "Noms des contacts", 
                        "Type d’entrée", "Langue", "Date de la visite", "Description", "État du lien", "Cible du lien", "URL", "Média créé", "Date de sortie", "Encodé par", "Numéro d’épisode", "Producteurs", "Éditeur", "Numéro de saison", "Sous-titre", "URL Web de l’utilisateur", 
                        "Éditeurs", "Adresses Cci", "Cci", "Adresses Cc", "Cc", "ID de conversation", "Date de réception", "Date d’envoi", "Adresses des expéditeurs", "De", "Avec pièces jointes", "Adresse de l’expéditeur", "Nom de l’expéditeur", "Magasin", "Adresses des destinataires", 
                        "Titre de tâche", "À", "Kilométrage", "Interprète de l’album", "Trier par interprète de l’album", "ID de l’album", "Trier par album", "Trier par interprète ayant collaboré", "Battements par minute", "Compositeurs", "Trier par compositeur", "Disque", "Clé d’origine", 
                        "Partie d’une compilation", "Ambiance", "Partie du coffret", "Période", "Couleur", "Contrôle parental", "Motif du contrôle parental", "Espace utilisé", "Version EXIF", "Événement", "Programme d’exposition", "Temps d’exposition", "Focale", "Mode flash", "Distance focale", 
                        "Distance focale 35mm", "Sensibilité ISO", "Fabricant de l’objectif", "Modèle d’objectif", "Source de lumière", "Ouverture maxi", "Mode de contrôle de logiciel", "Orientation", "Contacts", "Mode programmé", "Saturation", "Distance au sujet", "Balance des blancs", "Priorité", 
                        "Projet", "Numéro de la chaîne", "Nom de l’épisode", "Sous-titrage", "Reprise", "SAP", "Date de diffusion", "Description du programme", "Heure d’enregistrement", "Indicatif de la station", "Nom de la station", "Résumé", "Rechercher le type de correspondance", "Extraits", 
                        "Résumé automatique", "Pertinence", "Propriété du fichier", "Critère de diffusion", "Partagé avec", "État de partage", "Nom du produit", "Version du produit", "Lien vers le support technique", "Source", "Date de début", "Partagé", "Statut", "Informations facturation", 
                        "Terminé", "Propriétaire de la tâche", "Trier par titre", "Taille totale du fichier", "Marques légales", "E-mail de l’auteur de la dernière modification", "Nom de l’auteur de la dernière modification", "Date de la dernière modification", "ID de la dernière modification", 
                        "Message de la dernière modification", "État de la version", "Compression vidéo", "Administration", "Débit de données", "Hauteur de trame", "Fréquence d’images", "Largeur de trame", "Sphérique", "Stéréo", "Orientation de la vidéo", "Débit total (en bits)"

#>
#endregion

# Show an Open Folder Dialog and return the directory selected by the user.
function Get-FolderName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Position=0)]
        [string]$Message = "Sélectionnez votre répertoire de base....",

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
if ($folder) { Write-Host "Vous avez choisi le répertoire :: $folder" ausgewählt}
else { "Vous n'avez sélectionné AUCUN répertoire !" }

# Prompt User to accept Folder Path OR the enter another Path and File Name
$defaultValue = 'C:\Temp\Get-FileAttributes-FRA.csv'
$result = Read-Host "Appuyez sur la touche Entrée pour accepter le chemin d'accès et le nom de fichier par défaut OU entrez un autre chemin d'accès et un autre nom de fichier. [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
[array]$include = @("*.*")

# Si vous voulez seuleument scanner les fichiers de MS Office, changer la valeur sous [array]$include = @("*.*"), p. exemple...
# [array]$include = @("*.accda, *.accdb, *.accde, *.accdt, *.accdu, *.doc, *.docm, *.docx, *.dot, *.dotm, *.dotx, *.one, *.pot, *.potm, *.potx, *.ppa, *.ppam, *.pps, *.ppsm, *.ppsx, *.ppt, *.pptm, *.pptx, *.pub, *.sldm, *.sldx, *.wbk, *.wll, *.wwl, *.xla, *.xla5, *.xla8, *.xlam, *.xll, *.xll, *.xlm, *.xls, *.xlsb, *.xlsm, *.xlsx, *.xlt, *.xltm, *.xltx, *.xlw*, *.odt, *.ods, *.ots, *.odp, *.otp, *.odg, *.odm, *.odb")


#Get-ChildItem $path -Recurse -Include $include   | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include $include | ? { !$_.PsIsContainer } | % {

	$shellfolder = $shell.Namespace($_.DirectoryName)
	$shellfile = $shellfolder.ParseName($_.Name)
	New-Object PSObject -Property @{

"Nom" = $shellfolder.GetDetailsOf($shellfile,  0)
"Taille" = $shellfolder.GetDetailsOf($shellfile,  1)
"Type d’élément" = $shellfolder.GetDetailsOf($shellfile,  2)
"Modifié le" = $shellfolder.GetDetailsOf($shellfile,  3)
"Date de création" = $shellfolder.GetDetailsOf($shellfile,  4)
"Date d’accès" = $shellfolder.GetDetailsOf($shellfile,  5)
"Attributs" = $shellfolder.GetDetailsOf($shellfile,  6)
"État hors connexion" = $shellfolder.GetDetailsOf($shellfile,  7)
"Disponibilité" = $shellfolder.GetDetailsOf($shellfile,  8)
"Type identifié" = $shellfolder.GetDetailsOf($shellfile,  9)
"Propriétaire" = $shellfolder.GetDetailsOf($shellfile,  10)
"Sorte" = $shellfolder.GetDetailsOf($shellfile,  11)
"Prise de vue" = $shellfolder.GetDetailsOf($shellfile,  12)
"Interprètes ayant participé" = $shellfolder.GetDetailsOf($shellfile,  13)
"Album" = $shellfolder.GetDetailsOf($shellfile,  14)
"Année" = $shellfolder.GetDetailsOf($shellfile,  15)
"Genre" = $shellfolder.GetDetailsOf($shellfile,  16)
"Chefs d’orchestre" = $shellfolder.GetDetailsOf($shellfile,  17)
"Mots clés" = $shellfolder.GetDetailsOf($shellfile,  18)
"Notation" = $shellfolder.GetDetailsOf($shellfile,  19)
"Auteurs" = $shellfolder.GetDetailsOf($shellfile,  20)
"Titre" = $shellfolder.GetDetailsOf($shellfile,  21)
"Objet" = $shellfolder.GetDetailsOf($shellfile,  22)
"Catégories" = $shellfolder.GetDetailsOf($shellfile,  23)
"Commentaires" = $shellfolder.GetDetailsOf($shellfile,  24)
"Copyright" = $shellfolder.GetDetailsOf($shellfile,  25)
"N°" = $shellfolder.GetDetailsOf($shellfile,  26)
"Durée" = $shellfolder.GetDetailsOf($shellfile,  27)
"Débit binaire" = $shellfolder.GetDetailsOf($shellfile,  28)
"Protégé" = $shellfolder.GetDetailsOf($shellfile,  29)
"Modèle d'appareil photo" = $shellfolder.GetDetailsOf($shellfile,  30)
"Dimensions" = $shellfolder.GetDetailsOf($shellfile,  31)
"Marque appareil photo" = $shellfolder.GetDetailsOf($shellfile,  32)
"Entreprise" = $shellfolder.GetDetailsOf($shellfile,  33)
"Description du fichier" = $shellfolder.GetDetailsOf($shellfile,  34)
"Mots-clés des formes de base" = $shellfolder.GetDetailsOf($shellfile,  35)
"Nom du programme" = $shellfolder.GetDetailsOf($shellfile,  42)
"Connecté" = $shellfolder.GetDetailsOf($shellfile,  44)
"Périodique" = $shellfolder.GetDetailsOf($shellfile,  45)
"Emplacement" = $shellfolder.GetDetailsOf($shellfile,  46)
"Adresses des participants facultatifs" = $shellfolder.GetDetailsOf($shellfile,  47)
"Participants facultatifs" = $shellfolder.GetDetailsOf($shellfile,  48)
"Adresse de l’organisateur" = $shellfolder.GetDetailsOf($shellfile,  49)
"Nom de l’organisateur" = $shellfolder.GetDetailsOf($shellfile,  50)
"Heure du rappel" = $shellfolder.GetDetailsOf($shellfile,  51)
"Adresses des participants obligatoires" = $shellfolder.GetDetailsOf($shellfile,  52)
"Participants obligatoires" = $shellfolder.GetDetailsOf($shellfile,  53)
"Ressources" = $shellfolder.GetDetailsOf($shellfile,  54)
"État de la réunion" = $shellfolder.GetDetailsOf($shellfile,  55)
"Statut de disponibilité" = $shellfolder.GetDetailsOf($shellfile,  56)
"Taille totale" = $shellfolder.GetDetailsOf($shellfile,  57)
"Nom du compte" = $shellfolder.GetDetailsOf($shellfile,  58)
"Statut de la tâche" = $shellfolder.GetDetailsOf($shellfile,  60)
"Ordinateur" = $shellfolder.GetDetailsOf($shellfile,  61)
"Anniversaire de mariage ou fête" = $shellfolder.GetDetailsOf($shellfile,  62)
"Nom de l’assistant" = $shellfolder.GetDetailsOf($shellfile,  63)
"Téléphone de l’assistant" = $shellfolder.GetDetailsOf($shellfile,  64)
"Anniversaire" = $shellfolder.GetDetailsOf($shellfile,  65)
"Adresse professionnelle" = $shellfolder.GetDetailsOf($shellfile,  66)
"Ville (bureau)" = $shellfolder.GetDetailsOf($shellfile,  67)
"Pays/région (bureau)" = $shellfolder.GetDetailsOf($shellfile,  68)
"Boîte postale (bureau)" = $shellfolder.GetDetailsOf($shellfile,  69)
"Code postal (bureau)" = $shellfolder.GetDetailsOf($shellfile,  70)
"Département ou région (bureau)" = $shellfolder.GetDetailsOf($shellfile,  71)
"Rue (bureau)" = $shellfolder.GetDetailsOf($shellfile,  72)
"Télécopie professionnelle" = $shellfolder.GetDetailsOf($shellfile,  73)
"Page d’accueil professionnelle" = $shellfolder.GetDetailsOf($shellfile,  74)
"Téléphone professionnel" = $shellfolder.GetDetailsOf($shellfile,  75)
"Numéro de rappel" = $shellfolder.GetDetailsOf($shellfile,  76)
"Tél. voiture" = $shellfolder.GetDetailsOf($shellfile,  77)
"Enfants" = $shellfolder.GetDetailsOf($shellfile,  78)
"Téléphone société" = $shellfolder.GetDetailsOf($shellfile,  79)
"Service" = $shellfolder.GetDetailsOf($shellfile,  80)
"Adresse de messagerie" = $shellfolder.GetDetailsOf($shellfile,  81)
"Adresse de messagerie 2" = $shellfolder.GetDetailsOf($shellfile,  82)
"Adresse de messagerie 3" = $shellfolder.GetDetailsOf($shellfile,  83)
"Liste des messages électroniques" = $shellfolder.GetDetailsOf($shellfile,  84)
"Adresse de messagerie complète" = $shellfolder.GetDetailsOf($shellfile,  85)
"Enregistrer sous" = $shellfolder.GetDetailsOf($shellfile,  86)
"Prénom" = $shellfolder.GetDetailsOf($shellfile,  87)
"Nom complet" = $shellfolder.GetDetailsOf($shellfile,  88)
"Sexe" = $shellfolder.GetDetailsOf($shellfile,  89)
"Loisirs" = $shellfolder.GetDetailsOf($shellfile,  91)
"Adresse (domicile)" = $shellfolder.GetDetailsOf($shellfile,  92)
"Ville (domicile)" = $shellfolder.GetDetailsOf($shellfile,  93)
"Pays/région (domicile)" = $shellfolder.GetDetailsOf($shellfile,  94)
"Boîte postale (domicile)" = $shellfolder.GetDetailsOf($shellfile,  95)
"Code postal (domicile)" = $shellfolder.GetDetailsOf($shellfile,  96)
"Département (domicile)" = $shellfolder.GetDetailsOf($shellfile,  97)
"Rue (domicile)" = $shellfolder.GetDetailsOf($shellfile,  98)
"Télécopieur personnel" = $shellfolder.GetDetailsOf($shellfile,  99)
"Téléphone personnel" = $shellfolder.GetDetailsOf($shellfile,  100)
"Adresses de messagerie instantanée" = $shellfolder.GetDetailsOf($shellfile,  101)
"Initiales" = $shellfolder.GetDetailsOf($shellfile,  102)
"Fonction" = $shellfolder.GetDetailsOf($shellfile,  103)
"Étiquette" = $shellfolder.GetDetailsOf($shellfile,  104)
"Nom de famille" = $shellfolder.GetDetailsOf($shellfile,  105)
"Adresse" = $shellfolder.GetDetailsOf($shellfile,  106)
"Deuxième prénom" = $shellfolder.GetDetailsOf($shellfile,  107)
"Téléphone portable" = $shellfolder.GetDetailsOf($shellfile,  108)
"Surnom" = $shellfolder.GetDetailsOf($shellfile,  109)
"Adresse de bureau" = $shellfolder.GetDetailsOf($shellfile,  110)
"Autre adresse" = $shellfolder.GetDetailsOf($shellfile,  111)
"Autre ville" = $shellfolder.GetDetailsOf($shellfile,  112)
"Autre pays/région" = $shellfolder.GetDetailsOf($shellfile,  113)
"Autre boîte postale" = $shellfolder.GetDetailsOf($shellfile,  114)
"Autre code postal" = $shellfolder.GetDetailsOf($shellfile,  115)
"Autre département ou province" = $shellfolder.GetDetailsOf($shellfile,  116)
"Autre rue" = $shellfolder.GetDetailsOf($shellfile,  117)
"Récepteur d’appel" = $shellfolder.GetDetailsOf($shellfile,  118)
"Titre personnel" = $shellfolder.GetDetailsOf($shellfile,  119)
"Ville" = $shellfolder.GetDetailsOf($shellfile,  120)
"Pays/région" = $shellfolder.GetDetailsOf($shellfile,  121)
"Boîte postale" = $shellfolder.GetDetailsOf($shellfile,  122)
"Code postal" = $shellfolder.GetDetailsOf($shellfile,  123)
"Département ou région" = $shellfolder.GetDetailsOf($shellfile,  124)
"Rue" = $shellfolder.GetDetailsOf($shellfile,  125)
"Adresse de messagerie principale" = $shellfolder.GetDetailsOf($shellfile,  126)
"Téléphone principal" = $shellfolder.GetDetailsOf($shellfile,  127)
"Profession" = $shellfolder.GetDetailsOf($shellfile,  128)
"Conjoint(e)/Partenaire" = $shellfolder.GetDetailsOf($shellfile,  129)
"Suffixe" = $shellfolder.GetDetailsOf($shellfile,  130)
"Téléphone TTY/TTD" = $shellfolder.GetDetailsOf($shellfile,  131)
"Télex" = $shellfolder.GetDetailsOf($shellfile,  132)
"Page Web" = $shellfolder.GetDetailsOf($shellfile,  133)
"État du contenu" = $shellfolder.GetDetailsOf($shellfile,  134)
"Type de contenu" = $shellfolder.GetDetailsOf($shellfile,  135)
"Date d’acquisition" = $shellfolder.GetDetailsOf($shellfile,  136)
"Date d’archivage" = $shellfolder.GetDetailsOf($shellfile,  137)
"Date terminée" = $shellfolder.GetDetailsOf($shellfile,  138)
"Catégorie de périphérique" = $shellfolder.GetDetailsOf($shellfile,  139)
"Méthode de découverte" = $shellfolder.GetDetailsOf($shellfile,  141)
"Nom convivial" = $shellfolder.GetDetailsOf($shellfile,  142)
"Ordinateur local" = $shellfolder.GetDetailsOf($shellfile,  143)
"Fabricant" = $shellfolder.GetDetailsOf($shellfile,  144)
"Modèle" = $shellfolder.GetDetailsOf($shellfile,  145)
"Couplé" = $shellfolder.GetDetailsOf($shellfile,  146)
"Classification" = $shellfolder.GetDetailsOf($shellfile,  147)
"État" = $shellfolder.GetDetailsOf($shellfile,  149)
"ID du client" = $shellfolder.GetDetailsOf($shellfile,  150)
"Collaborateurs" = $shellfolder.GetDetailsOf($shellfile,  151)
"Contenu créé" = $shellfolder.GetDetailsOf($shellfile,  152)
"Dernière impression" = $shellfolder.GetDetailsOf($shellfile,  153)
"Date du dernier enregistrement" = $shellfolder.GetDetailsOf($shellfile,  154)
"Division" = $shellfolder.GetDetailsOf($shellfile,  155)
"ID de document" = $shellfolder.GetDetailsOf($shellfile,  156)
"Pages" = $shellfolder.GetDetailsOf($shellfile,  157)
"Diapositives" = $shellfolder.GetDetailsOf($shellfile,  158)
"Temps total d’édition" = $shellfolder.GetDetailsOf($shellfile,  159)
"Nombre de mots" = $shellfolder.GetDetailsOf($shellfile,  160)
"Échéance" = $shellfolder.GetDetailsOf($shellfile,  161)
"Date de fin" = $shellfolder.GetDetailsOf($shellfile,  162)
"Nombre de fichiers" = $shellfolder.GetDetailsOf($shellfile,  163)
"Extension du fichier" = $shellfolder.GetDetailsOf($shellfile,  164)
"Nom de fichier" = $shellfolder.GetDetailsOf($shellfile,  165)
"Version du fichier" = $shellfolder.GetDetailsOf($shellfile,  166)
"Couleur de l’indicateur" = $shellfolder.GetDetailsOf($shellfile,  167)
"État des indicateurs" = $shellfolder.GetDetailsOf($shellfile,  168)
"Espace libre" = $shellfolder.GetDetailsOf($shellfile,  169)
"Groupe" = $shellfolder.GetDetailsOf($shellfile,  172)
"Type de partage" = $shellfolder.GetDetailsOf($shellfile,  173)
"Profondeur de couleur" = $shellfolder.GetDetailsOf($shellfile,  174)
"Résolution horizontale" = $shellfolder.GetDetailsOf($shellfile,  175)
"Largeur" = $shellfolder.GetDetailsOf($shellfile,  176)
"Résolution verticale" = $shellfolder.GetDetailsOf($shellfile,  177)
"Hauteur" = $shellfolder.GetDetailsOf($shellfile,  178)
"Importance" = $shellfolder.GetDetailsOf($shellfile,  179)
"Est une pièce jointe" = $shellfolder.GetDetailsOf($shellfile,  180)
"Est supprimé" = $shellfolder.GetDetailsOf($shellfile,  181)
"État du chiffrement" = $shellfolder.GetDetailsOf($shellfile,  182)
"Avec indicateur" = $shellfolder.GetDetailsOf($shellfile,  183)
"Est terminé" = $shellfolder.GetDetailsOf($shellfile,  184)
"Incomplet" = $shellfolder.GetDetailsOf($shellfile,  185)
"État de la lecture" = $shellfolder.GetDetailsOf($shellfile,  186)
"Partagée" = $shellfolder.GetDetailsOf($shellfile,  187)
"Créateurs" = $shellfolder.GetDetailsOf($shellfile,  188)
"Date" = $shellfolder.GetDetailsOf($shellfile,  189)
"NomDossier" = $shellfolder.GetDetailsOf($shellfile,  190)
"Emplacement du fichier" = $shellfolder.GetDetailsOf($shellfile,  191)
"Dossier" = $shellfolder.GetDetailsOf($shellfile,  192)
"Participants" = $shellfolder.GetDetailsOf($shellfile,  193)
"Chemin d’accès" = $shellfolder.GetDetailsOf($shellfile,  194)
"Par emplacement" = $shellfolder.GetDetailsOf($shellfile,  195)
"Type" = $shellfolder.GetDetailsOf($shellfile,  196)
"Noms des contacts" = $shellfolder.GetDetailsOf($shellfile,  197)
"Type d’entrée" = $shellfolder.GetDetailsOf($shellfile,  198)
"Langue" = $shellfolder.GetDetailsOf($shellfile,  199)
"Date de la visite" = $shellfolder.GetDetailsOf($shellfile,  200)
"Description" = $shellfolder.GetDetailsOf($shellfile,  201)
"État du lien" = $shellfolder.GetDetailsOf($shellfile,  202)
"Cible du lien" = $shellfolder.GetDetailsOf($shellfile,  203)
"URL" = $shellfolder.GetDetailsOf($shellfile,  204)
"Média créé" = $shellfolder.GetDetailsOf($shellfile,  208)
"Date de sortie" = $shellfolder.GetDetailsOf($shellfile,  209)
"Encodé par" = $shellfolder.GetDetailsOf($shellfile,  210)
"Numéro d’épisode" = $shellfolder.GetDetailsOf($shellfile,  211)
"Producteurs" = $shellfolder.GetDetailsOf($shellfile,  212)
"Éditeur" = $shellfolder.GetDetailsOf($shellfile,  213)
"Numéro de saison" = $shellfolder.GetDetailsOf($shellfile,  214)
"Sous-titre" = $shellfolder.GetDetailsOf($shellfile,  215)
"URL Web de l’utilisateur" = $shellfolder.GetDetailsOf($shellfile,  216)
"Éditeurs" = $shellfolder.GetDetailsOf($shellfile,  217)
"Adresses Cci" = $shellfolder.GetDetailsOf($shellfile,  220)
"Cci" = $shellfolder.GetDetailsOf($shellfile,  221)
"Adresses Cc" = $shellfolder.GetDetailsOf($shellfile,  222)
"Cc" = $shellfolder.GetDetailsOf($shellfile,  223)
"ID de conversation" = $shellfolder.GetDetailsOf($shellfile,  224)
"Date de réception" = $shellfolder.GetDetailsOf($shellfile,  225)
"Date d’envoi" = $shellfolder.GetDetailsOf($shellfile,  226)
"Adresses des expéditeurs" = $shellfolder.GetDetailsOf($shellfile,  227)
"De" = $shellfolder.GetDetailsOf($shellfile,  228)
"Avec pièces jointes" = $shellfolder.GetDetailsOf($shellfile,  229)
"Adresse de l’expéditeur" = $shellfolder.GetDetailsOf($shellfile,  230)
"Nom de l’expéditeur" = $shellfolder.GetDetailsOf($shellfile,  231)
"Magasin" = $shellfolder.GetDetailsOf($shellfile,  232)
"Adresses des destinataires" = $shellfolder.GetDetailsOf($shellfile,  233)
"Titre de tâche" = $shellfolder.GetDetailsOf($shellfile,  234)
"À" = $shellfolder.GetDetailsOf($shellfile,  235)
"Kilométrage" = $shellfolder.GetDetailsOf($shellfile,  236)
"Interprète de l’album" = $shellfolder.GetDetailsOf($shellfile,  237)
"Trier par interprète de l’album" = $shellfolder.GetDetailsOf($shellfile,  238)
"ID de l’album" = $shellfolder.GetDetailsOf($shellfile,  239)
"Trier par album" = $shellfolder.GetDetailsOf($shellfile,  240)
"Trier par interprète ayant collaboré" = $shellfolder.GetDetailsOf($shellfile,  241)
"Battements par minute" = $shellfolder.GetDetailsOf($shellfile,  242)
"Compositeurs" = $shellfolder.GetDetailsOf($shellfile,  243)
"Trier par compositeur" = $shellfolder.GetDetailsOf($shellfile,  244)
"Disque" = $shellfolder.GetDetailsOf($shellfile,  245)
"Clé d’origine" = $shellfolder.GetDetailsOf($shellfile,  246)
"Partie d’une compilation" = $shellfolder.GetDetailsOf($shellfile,  247)
"Ambiance" = $shellfolder.GetDetailsOf($shellfile,  248)
"Partie du coffret" = $shellfolder.GetDetailsOf($shellfile,  249)
"Période" = $shellfolder.GetDetailsOf($shellfile,  250)
"Couleur" = $shellfolder.GetDetailsOf($shellfile,  251)
"Contrôle parental" = $shellfolder.GetDetailsOf($shellfile,  252)
"Motif du contrôle parental" = $shellfolder.GetDetailsOf($shellfile,  253)
"Espace utilisé" = $shellfolder.GetDetailsOf($shellfile,  254)
"Version EXIF" = $shellfolder.GetDetailsOf($shellfile,  255)
"Événement" = $shellfolder.GetDetailsOf($shellfile,  256)
"Programme d’exposition" = $shellfolder.GetDetailsOf($shellfile,  258)
"Temps d’exposition" = $shellfolder.GetDetailsOf($shellfile,  259)
"Focale" = $shellfolder.GetDetailsOf($shellfile,  260)
"Mode flash" = $shellfolder.GetDetailsOf($shellfile,  261)
"Distance focale" = $shellfolder.GetDetailsOf($shellfile,  262)
"Distance focale 35mm" = $shellfolder.GetDetailsOf($shellfile,  263)
"Sensibilité ISO" = $shellfolder.GetDetailsOf($shellfile,  264)
"Fabricant de l’objectif" = $shellfolder.GetDetailsOf($shellfile,  265)
"Modèle d’objectif" = $shellfolder.GetDetailsOf($shellfile,  266)
"Source de lumière" = $shellfolder.GetDetailsOf($shellfile,  267)
"Ouverture maxi" = $shellfolder.GetDetailsOf($shellfile,  268)
"Mode de contrôle de logiciel" = $shellfolder.GetDetailsOf($shellfile,  269)
"Orientation" = $shellfolder.GetDetailsOf($shellfile,  270)
"Contacts" = $shellfolder.GetDetailsOf($shellfile,  271)
"Mode programmé" = $shellfolder.GetDetailsOf($shellfile,  272)
"Saturation" = $shellfolder.GetDetailsOf($shellfile,  273)
"Distance au sujet" = $shellfolder.GetDetailsOf($shellfile,  274)
"Balance des blancs" = $shellfolder.GetDetailsOf($shellfile,  275)
"Priorité" = $shellfolder.GetDetailsOf($shellfile,  276)
"Projet" = $shellfolder.GetDetailsOf($shellfile,  277)
"Numéro de la chaîne" = $shellfolder.GetDetailsOf($shellfile,  278)
"Nom de l’épisode" = $shellfolder.GetDetailsOf($shellfile,  279)
"Sous-titrage" = $shellfolder.GetDetailsOf($shellfile,  280)
"Reprise" = $shellfolder.GetDetailsOf($shellfile,  281)
"SAP" = $shellfolder.GetDetailsOf($shellfile,  282)
"Date de diffusion" = $shellfolder.GetDetailsOf($shellfile,  283)
"Description du programme" = $shellfolder.GetDetailsOf($shellfile,  284)
"Heure d’enregistrement" = $shellfolder.GetDetailsOf($shellfile,  285)
"Indicatif de la station" = $shellfolder.GetDetailsOf($shellfile,  286)
"Nom de la station" = $shellfolder.GetDetailsOf($shellfile,  287)
"Résumé" = $shellfolder.GetDetailsOf($shellfile,  289)
"Rechercher le type de correspondance" = $shellfolder.GetDetailsOf($shellfile,  290)
"Extraits" = $shellfolder.GetDetailsOf($shellfile,  291)
"Résumé automatique" = $shellfolder.GetDetailsOf($shellfile,  292)
"Pertinence" = $shellfolder.GetDetailsOf($shellfile,  293)
"Propriété du fichier" = $shellfolder.GetDetailsOf($shellfile,  294)
"Critère de diffusion" = $shellfolder.GetDetailsOf($shellfile,  295)
"Partagé avec" = $shellfolder.GetDetailsOf($shellfile,  296)
"État de partage" = $shellfolder.GetDetailsOf($shellfile,  297)
"Nom du produit" = $shellfolder.GetDetailsOf($shellfile,  299)
"Version du produit" = $shellfolder.GetDetailsOf($shellfile,  300)
"Lien vers le support technique" = $shellfolder.GetDetailsOf($shellfile,  301)
"Source" = $shellfolder.GetDetailsOf($shellfile,  302)
"Date de début" = $shellfolder.GetDetailsOf($shellfile,  303)
"Partagé" = $shellfolder.GetDetailsOf($shellfile,  304)
"Statut" = $shellfolder.GetDetailsOf($shellfile,  306)
"Informations facturation" = $shellfolder.GetDetailsOf($shellfile,  307)
"Terminé" = $shellfolder.GetDetailsOf($shellfile,  308)
"Propriétaire de la tâche" = $shellfolder.GetDetailsOf($shellfile,  309)
"Trier par titre" = $shellfolder.GetDetailsOf($shellfile,  310)
"Taille totale du fichier" = $shellfolder.GetDetailsOf($shellfile,  311)
"Marques légales" = $shellfolder.GetDetailsOf($shellfile,  312)
"E-mail de l’auteur de la dernière modification" = $shellfolder.GetDetailsOf($shellfile,  313)
"Nom de l’auteur de la dernière modification" = $shellfolder.GetDetailsOf($shellfile,  314)
"Date de la dernière modification" = $shellfolder.GetDetailsOf($shellfile,  315)
"ID de la dernière modification" = $shellfolder.GetDetailsOf($shellfile,  316)
"Message de la dernière modification" = $shellfolder.GetDetailsOf($shellfile,  317)
"État de la version" = $shellfolder.GetDetailsOf($shellfile,  318)
"Compression vidéo" = $shellfolder.GetDetailsOf($shellfile,  319)
"Administration" = $shellfolder.GetDetailsOf($shellfile,  320)
"Débit de données" = $shellfolder.GetDetailsOf($shellfile,  321)
"Hauteur de trame" = $shellfolder.GetDetailsOf($shellfile,  322)
"Fréquence d’images" = $shellfolder.GetDetailsOf($shellfile,  323)
"Largeur de trame" = $shellfolder.GetDetailsOf($shellfile,  324)
"Sphérique" = $shellfolder.GetDetailsOf($shellfile,  325)
"Stéréo" = $shellfolder.GetDetailsOf($shellfile,  326)
"Orientation de la vidéo" = $shellfolder.GetDetailsOf($shellfile,  327)
"Débit total (en bits)" = $shellfolder.GetDetailsOf($shellfile,  328)

	}
}| select "Emplacement du fichier", "Nom", "Taille", "Extension du fichier", "Type d’élément", "Modifié le", "Date de création", "Date d’accès", "Attributs", "État hors connexion", "Disponibilité", "Type identifié", "Propriétaire", "Sorte", "Prise de vue", "Interprètes ayant participé", "Album", "Année", "Genre", "Chefs d’orchestre", "Mots clés", "Notation", "Auteurs", "Titre", "Objet", "Catégories", "Commentaires", "Copyright", "N°", "Durée", "Débit binaire", "Protégé", "Modèle d'appareil photo", "Dimensions", "Marque appareil photo", "Entreprise", "Description du fichier", "Mots-clés des formes de base", "Nom du programme", "Connecté", "Périodique", "Emplacement", "Adresses des participants facultatifs", "Participants facultatifs", "Adresse de l’organisateur", "Nom de l’organisateur", "Heure du rappel", "Adresses des participants obligatoires", "Participants obligatoires", "Ressources", "État de la réunion", "Statut de disponibilité", "Taille totale", "Nom du compte", "Statut de la tâche", "Ordinateur", "Anniversaire de mariage ou fête", "Nom de l’assistant", "Téléphone de l’assistant", "Anniversaire", "Adresse professionnelle", "Ville (bureau)", "Pays/région (bureau)", "Boîte postale (bureau)", "Code postal (bureau)", "Département ou région (bureau)", "Rue (bureau)", "Télécopie professionnelle", "Page d’accueil professionnelle", "Téléphone professionnel", "Numéro de rappel", "Tél. voiture", "Enfants", "Téléphone société", "Service", "Adresse de messagerie", "Adresse de messagerie 2", "Adresse de messagerie 3", "Liste des messages électroniques", "Adresse de messagerie complète", "Enregistrer sous", "Prénom", "Nom complet", "Sexe", "Loisirs", "Adresse (domicile)", "Ville (domicile)", "Pays/région (domicile)", "Boîte postale (domicile)", "Code postal (domicile)", "Département (domicile)", "Rue (domicile)", "Télécopieur personnel", "Téléphone personnel", "Adresses de messagerie instantanée", "Initiales", "Fonction", "Étiquette", "Nom de famille", "Adresse", "Deuxième prénom", "Téléphone portable", "Surnom", "Adresse de bureau", "Autre adresse", "Autre ville", "Autre pays/région", "Autre boîte postale", "Autre code postal", "Autre département ou province", "Autre rue", "Récepteur d’appel", "Titre personnel", "Ville", "Pays/région", "Boîte postale", "Code postal", "Département ou région", "Rue", "Adresse de messagerie principale", "Téléphone principal", "Profession", "Conjoint(e)/Partenaire", "Suffixe", "Téléphone TTY/TTD", "Télex", "Page Web", "État du contenu", "Type de contenu", "Date d’acquisition", "Date d’archivage", "Date terminée", "Catégorie de périphérique", "Méthode de découverte", "Nom convivial", "Ordinateur local", "Fabricant", "Modèle", "Couplé", "Classification", "État", "ID du client", "Collaborateurs", "Contenu créé", "Dernière impression", "Date du dernier enregistrement", "Division", "ID de document", "Pages", "Diapositives", "Temps total d’édition", "Nombre de mots", "Échéance", "Date de fin", "Nombre de fichiers", "Nom de fichier", "Version du fichier", "Couleur de l’indicateur", "État des indicateurs", "Espace libre", "Groupe", "Type de partage", "Profondeur de couleur", "Résolution horizontale", "Largeur", "Résolution verticale", "Hauteur", "Importance", "Est une pièce jointe", "Est supprimé", "État du chiffrement", "Avec indicateur", "Est terminé", "Incomplet", "État de la lecture", "Partagée", "Créateurs", "Date", "NomDossier", "Dossier", "Participants", "Chemin d’accès", "Par emplacement", "Type", "Noms des contacts", "Type d’entrée", "Langue", "Date de la visite", "Description", "État du lien", "Cible du lien", "URL", "Média créé", "Date de sortie", "Encodé par", "Numéro d’épisode", "Producteurs", "Éditeur", "Numéro de saison", "Sous-titre", "URL Web de l’utilisateur", "Éditeurs", "Adresses Cci", "Cci", "Adresses Cc", "Cc", "ID de conversation", "Date de réception", "Date d’envoi", "Adresses des expéditeurs", "De", "Avec pièces jointes", "Adresse de l’expéditeur", "Nom de l’expéditeur", "Magasin", "Adresses des destinataires", "Titre de tâche", "À", "Kilométrage", "Interprète de l’album", "Trier par interprète de l’album", "ID de l’album", "Trier par album", "Trier par interprète ayant collaboré", "Battements par minute", "Compositeurs", "Trier par compositeur", "Disque", "Clé d’origine", "Partie d’une compilation", "Ambiance", "Partie du coffret", "Période", "Couleur", "Contrôle parental", "Motif du contrôle parental", "Espace utilisé", "Version EXIF", "Événement", "Programme d’exposition", "Temps d’exposition", "Focale", "Mode flash", "Distance focale", "Distance focale 35mm", "Sensibilité ISO", "Fabricant de l’objectif", "Modèle d’objectif", "Source de lumière", "Ouverture maxi", "Mode de contrôle de logiciel", "Orientation", "Contacts", "Mode programmé", "Saturation", "Distance au sujet", "Balance des blancs", "Priorité", "Projet", "Numéro de la chaîne", "Nom de l’épisode", "Sous-titrage", "Reprise", "SAP", "Date de diffusion", "Description du programme", "Heure d’enregistrement", "Indicatif de la station", "Nom de la station", "Résumé", "Rechercher le type de correspondance", "Extraits", "Résumé automatique", "Pertinence", "Propriété du fichier", "Critère de diffusion", "Partagé avec", "État de partage", "Nom du produit", "Version du produit", "Lien vers le support technique", "Source", "Date de début", "Partagé", "Statut", "Informations facturation", "Terminé", "Propriétaire de la tâche", "Trier par titre", "Taille totale du fichier", "Marques légales", "E-mail de l’auteur de la dernière modification", "Nom de l’auteur de la dernière modification", "Date de la dernière modification", "ID de la dernière modification", "Message de la dernière modification", "État de la version", "Compression vidéo", "Administration", "Débit de données", "Hauteur de trame", "Fréquence d’images", "Largeur de trame", "Sphérique", "Stéréo", "Orientation de la vidéo", "Débit total (en bits)" | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"