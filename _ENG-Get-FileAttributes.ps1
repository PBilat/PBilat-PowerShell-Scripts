#region Description
<#	
	Version:			1.0
	Date:				17.02.2026
	Author:      		Pascal Bilat
	Description:		The PS-Script gets more than 300 Files Properties from selected folder (Result is in English). Sub-Folders will also be scanned.

	Parameters:			enter Folder Path to scan over select folder dialog

    Properties:         "Name", "Size", "Element type", "Modification date", "Creation date", "Last accessed", "Attributes", "Offline status", "Availability", "Recognized type", "Owner", "Type", "Recording date", "Contributing artists", "Album", "Year", "Genre", 
                        "Conductors", "Tags", "Rating", "Authors", "Title", "Subject", "Categories", "Comments", "Copyright", "Track number", "Length", "Bitrate", "Protected", "Camera model", "Dimensions", "Camera manufacturer", "Company", "File description", 
                        "Master keywords", "Program name", "Duration", "Is online", "Periodically recurring", "Location", "Addresses of optional participants", "Optional participants", "Organizer address", "Organizer name", "Reminder time", 
                        "Addresses of required participants", "Required participants", "Resources", "Meeting status", "Status free/busy", "Total size", "Account name", "Task status", "Computer", "Anniversary", "Assistant's name", "Assistant's phone number", 
                        "Birthday", "Business address", "Location (business)", "State/Province (business)", "P.O. Box (business)", "Zip code (business)", "Street (business)", "Fax (business)", "Homepage (business)", "Phone number (business)", 
                        "Callback number", "Car phone", "Children", "Company main phone number", "Department", "Email address", "Email2", "Email3", "Email list", "Email display name", "Save as", "First name", "Full name", "Gender", "Given name", "Hobbies", "Home address", 
                        "City (home)", "Country/Region (home)", "P.O. Box (home)", "Zip code (home)", "State/Province (home)", "Street (home)", "Fax (home)", "Phone number (private)", "Chat addresses", "Initials", "Position", "Title", "Last name", "Address", "Middle name", 
                        "Mobile phone", "Nickname", "Office location", "Additional address", "Other city", "Other country/region", "Other PO box", "Other postal code", "Other state or province", "Other street", "Pager", "Personal title", "City", "Country/region", "P.O. Box", 
                        "Zip code", "State/Province", "Street", "Primary email", "Primary phone number", "Occupation", "Spouse/Partner", "Suffix", "TTY/TTD phone", "Telex", "Website", "Content status", "Content type", "Capture date", "Archiving date", "Completion date", 
                        "Device category", "Connection established", "Detection method", "Display name", "Local computer", "Manufacturer", "Model", "Paired", "Classification", "Status", "Device status", "Client ID", "Contributors", "Content created", "Last printed", "Last saved", 
                        "Main department", "Document ID", "Pages", "Slides", "Total processing time", "Word count", "Due on", "End date", "Number of files", "File extension", "File name", "File version", "Marking color", "Marking status", "Free space", "Group", "Release type", 
                        "Bit depth", "Horizontal resolution", "Width", "Vertical resolution", "Height", "Importance", "Attachment?", "Deleted", "Encryption status", "Label present", "Has been completed", "Incomplete", "Read status", "Released", "Creator", "Date", "Folder name", 
                        "File location", "Folder", "Participants", "Path", "By location", "Type", "Contact names", "Entry type", "Language", "Last visit", "Description", "Link status", "Link destination", "URL", "Medium created", "Published", "Encoded by", "Episode number", 
                        "Producers", "Publisher", "Season number", "Subtitle", "User web URL", "Lyricist", "Attachments", "BCC addresses", "BCC", "CC addresses", "CC", "Entertainment ID", "Received date", "Sent date", "From addresses", "From", "Has attachments", "Sender address", 
                        "Sender name", "Storage", "Recipient addresses", "Working title", "To", "Running time", "Album artist", "Sort by album artist", "Album ID", "Sort by album", "Sort by contributing artists", "Beats per minute", "Composers", "Sort by composer", "Disc", 
                        "Original key", "Part of a compilation", "Mood", "Part of a set", "Time period", "Color", "Parental control", "Reason for parental control rating", "Storage space used", "EXIF version", "Event", "Light value", "Exposure program", "Exposure time", "Aperture number", 
                        "Flash mode", "Focal length", "35mm focal length", "ISO film sensitivity", "Lens manufacturer", "Lens model", "Light source", "Maximum aperture", "Metering mode", "Alignment", "Contacts", "Program mode", "Saturation", "Distance", "White balance", "Priority", "Project", 
                        "Channel", "Episode name", "Subtitle (Closed Captions)", "Repeat", "Two-channel sound", "Broadcast date", "Broadcast description", "Recording time", "Station call sign", "TV station name", "Summary", "Search match type", "Snippet", "Automatic summary", "Relevance", 
                        "File ownership", "Sensitivity", "Shared with", "Sharing status", "Product name", "Product version", "Support link", "Source", "Start date", "Is shared", "Availability status", "Billing information", "Completed", "Task owner", "Sort", "Total file size", 
                        "Brands", "Email of the author of the last change", "Name of the author of the last change", "Date of the last change", "ID of the last change", "Message about the last change", "Version status", "Video compression", "Directors", "Data rate", "Image height", 
                        "Frame rate", "Image width", "Spherical", "Stereo", "Video orientation", "Total bit rate"

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
$defaultValue = 'C:\Temp\Get-FileAttributes-ENG.csv'
$result = Read-Host "Press enter to accept the default path and file name [$($defaultValue)]"
$result = ($defaultValue,$result)[[bool]$result]

$shell = New-Object -COMObject Shell.Application
[array]$include = @("*.*")

#Get-ChildItem $path -Recurse -Include $include  | ? { !$_.PsIsContainer } | % {
Get-ChildItem $folder -Recurse -Include $include  | ? { !$_.PsIsContainer } | % {

	$shellfolder = $shell.Namespace($_.DirectoryName)
	$shellfile = $shellfolder.ParseName($_.Name)
	New-Object PSObject -Property @{

"Name" = $shellfolder.GetDetailsOf($shellfile,  0)
"Size" = $shellfolder.GetDetailsOf($shellfile,  1)
"Element type" = $shellfolder.GetDetailsOf($shellfile,  2)
"Modification date" = $shellfolder.GetDetailsOf($shellfile,  3)
"Creation date" = $shellfolder.GetDetailsOf($shellfile,  4)
"Last accessed" = $shellfolder.GetDetailsOf($shellfile,  5)
"Attributes" = $shellfolder.GetDetailsOf($shellfile,  6)
"Offline status" = $shellfolder.GetDetailsOf($shellfile,  7)
"Availability" = $shellfolder.GetDetailsOf($shellfile,  8)
"Recognized type" = $shellfolder.GetDetailsOf($shellfile,  9)
"Owner" = $shellfolder.GetDetailsOf($shellfile,  10)
"Type" = $shellfolder.GetDetailsOf($shellfile,  11)
"Recording date" = $shellfolder.GetDetailsOf($shellfile,  12)
"Contributing artists" = $shellfolder.GetDetailsOf($shellfile,  13)
"Album" = $shellfolder.GetDetailsOf($shellfile,  14)
"Year" = $shellfolder.GetDetailsOf($shellfile,  15)
"Genre" = $shellfolder.GetDetailsOf($shellfile,  16)
"Conductors" = $shellfolder.GetDetailsOf($shellfile,  17)
"Tags" = $shellfolder.GetDetailsOf($shellfile,  18)
"Rating" = $shellfolder.GetDetailsOf($shellfile,  19)
"Authors" = $shellfolder.GetDetailsOf($shellfile,  20)
"Title" = $shellfolder.GetDetailsOf($shellfile,  21)
"Subject" = $shellfolder.GetDetailsOf($shellfile,  22)
"Categories" = $shellfolder.GetDetailsOf($shellfile,  23)
"Comments" = $shellfolder.GetDetailsOf($shellfile,  24)
"Copyright" = $shellfolder.GetDetailsOf($shellfile,  25)
"Track number" = $shellfolder.GetDetailsOf($shellfile,  26)
"Length" = $shellfolder.GetDetailsOf($shellfile,  27)
"Bitrate" = $shellfolder.GetDetailsOf($shellfile,  28)
"Protected" = $shellfolder.GetDetailsOf($shellfile,  29)
"Camera model" = $shellfolder.GetDetailsOf($shellfile,  30)
"Dimensions" = $shellfolder.GetDetailsOf($shellfile,  31)
"Camera manufacturer" = $shellfolder.GetDetailsOf($shellfile,  32)
"Company" = $shellfolder.GetDetailsOf($shellfile,  33)
"File description" = $shellfolder.GetDetailsOf($shellfile,  34)
"Master keywords" = $shellfolder.GetDetailsOf($shellfile,  35)
"Program name" = $shellfolder.GetDetailsOf($shellfile,  42)
"Duration" = $shellfolder.GetDetailsOf($shellfile,  43)
"Is online" = $shellfolder.GetDetailsOf($shellfile,  44)
"Periodically recurring" = $shellfolder.GetDetailsOf($shellfile,  45)
"Location" = $shellfolder.GetDetailsOf($shellfile,  46)
"Addresses of optional participants" = $shellfolder.GetDetailsOf($shellfile,  47)
"Optional participants" = $shellfolder.GetDetailsOf($shellfile,  48)
"Organizer address" = $shellfolder.GetDetailsOf($shellfile,  49)
"Organizer name" = $shellfolder.GetDetailsOf($shellfile,  50)
"Reminder time" = $shellfolder.GetDetailsOf($shellfile,  51)
"Addresses of required participants" = $shellfolder.GetDetailsOf($shellfile,  52)
"Required participants" = $shellfolder.GetDetailsOf($shellfile,  53)
"Resources" = $shellfolder.GetDetailsOf($shellfile,  54)
"Meeting status" = $shellfolder.GetDetailsOf($shellfile,  55)
"Status free/busy" = $shellfolder.GetDetailsOf($shellfile,  56)
"Total size" = $shellfolder.GetDetailsOf($shellfile,  57)
"Account name" = $shellfolder.GetDetailsOf($shellfile,  58)
"Task status" = $shellfolder.GetDetailsOf($shellfile,  60)
"Computer" = $shellfolder.GetDetailsOf($shellfile,  61)
"Anniversary" = $shellfolder.GetDetailsOf($shellfile,  62)
"Assistant's name" = $shellfolder.GetDetailsOf($shellfile,  63)
"Assistant's phone number" = $shellfolder.GetDetailsOf($shellfile,  64)
"Birthday" = $shellfolder.GetDetailsOf($shellfile,  65)
"Business address" = $shellfolder.GetDetailsOf($shellfile,  66)
"Location (business)" = $shellfolder.GetDetailsOf($shellfile,  67)
"State/Province (business)" = $shellfolder.GetDetailsOf($shellfile,  68)
"P.O. Box (business)" = $shellfolder.GetDetailsOf($shellfile,  69)
"Zip code (business)" = $shellfolder.GetDetailsOf($shellfile,  70)
"Street (business)" = $shellfolder.GetDetailsOf($shellfile,  72)
"Fax (business)" = $shellfolder.GetDetailsOf($shellfile,  73)
"Homepage (business)" = $shellfolder.GetDetailsOf($shellfile,  74)
"Phone number (business)" = $shellfolder.GetDetailsOf($shellfile,  75)
"Callback number" = $shellfolder.GetDetailsOf($shellfile,  76)
"Car phone" = $shellfolder.GetDetailsOf($shellfile,  77)
"Children" = $shellfolder.GetDetailsOf($shellfile,  78)
"Company main phone number" = $shellfolder.GetDetailsOf($shellfile,  79)
"Department" = $shellfolder.GetDetailsOf($shellfile,  80)
"Email address" = $shellfolder.GetDetailsOf($shellfile,  81)
"Email2" = $shellfolder.GetDetailsOf($shellfile,  82)
"Email3" = $shellfolder.GetDetailsOf($shellfile,  83)
"Email list" = $shellfolder.GetDetailsOf($shellfile,  84)
"Email display name" = $shellfolder.GetDetailsOf($shellfile,  85)
"Save as" = $shellfolder.GetDetailsOf($shellfile,  86)
"First name" = $shellfolder.GetDetailsOf($shellfile,  87)
"Full name" = $shellfolder.GetDetailsOf($shellfile,  88)
"Gender" = $shellfolder.GetDetailsOf($shellfile,  89)
"Given name" = $shellfolder.GetDetailsOf($shellfile,  90)
"Hobbies" = $shellfolder.GetDetailsOf($shellfile,  91)
"Home address" = $shellfolder.GetDetailsOf($shellfile,  92)
"City (home)" = $shellfolder.GetDetailsOf($shellfile,  93)
"Country/Region (home)" = $shellfolder.GetDetailsOf($shellfile,  94)
"P.O. Box (home)" = $shellfolder.GetDetailsOf($shellfile,  95)
"Zip code (home)" = $shellfolder.GetDetailsOf($shellfile,  96)
"State/Province (home)" = $shellfolder.GetDetailsOf($shellfile,  97)
"Street (home)" = $shellfolder.GetDetailsOf($shellfile,  98)
"Fax (home)" = $shellfolder.GetDetailsOf($shellfile,  99)
"Phone number (private)" = $shellfolder.GetDetailsOf($shellfile,  100)
"Chat addresses" = $shellfolder.GetDetailsOf($shellfile,  101)
"Initials" = $shellfolder.GetDetailsOf($shellfile,  102)
"Position" = $shellfolder.GetDetailsOf($shellfile,  103)
"Last name" = $shellfolder.GetDetailsOf($shellfile,  105)
"Address" = $shellfolder.GetDetailsOf($shellfile,  106)
"Middle name" = $shellfolder.GetDetailsOf($shellfile,  107)
"Mobile phone" = $shellfolder.GetDetailsOf($shellfile,  108)
"Nickname" = $shellfolder.GetDetailsOf($shellfile,  109)
"Office location" = $shellfolder.GetDetailsOf($shellfile,  110)
"Additional address" = $shellfolder.GetDetailsOf($shellfile,  111)
"Other city" = $shellfolder.GetDetailsOf($shellfile,  112)
"Other country/region" = $shellfolder.GetDetailsOf($shellfile,  113)
"Other PO box" = $shellfolder.GetDetailsOf($shellfile,  114)
"Other postal code" = $shellfolder.GetDetailsOf($shellfile,  115)
"Other state or province" = $shellfolder.GetDetailsOf($shellfile,  116)
"Other street" = $shellfolder.GetDetailsOf($shellfile,  117)
"Pager" = $shellfolder.GetDetailsOf($shellfile,  118)
"Personal title" = $shellfolder.GetDetailsOf($shellfile,  119)
"City" = $shellfolder.GetDetailsOf($shellfile,  120)
"Country/region" = $shellfolder.GetDetailsOf($shellfile,  121)
"P.O. Box" = $shellfolder.GetDetailsOf($shellfile,  122)
"Zip code" = $shellfolder.GetDetailsOf($shellfile,  123)
"State/Province" = $shellfolder.GetDetailsOf($shellfile,  124)
"Street" = $shellfolder.GetDetailsOf($shellfile,  125)
"Primary email" = $shellfolder.GetDetailsOf($shellfile,  126)
"Primary phone number" = $shellfolder.GetDetailsOf($shellfile,  127)
"Occupation" = $shellfolder.GetDetailsOf($shellfile,  128)
"Spouse/Partner" = $shellfolder.GetDetailsOf($shellfile,  129)
"Suffix" = $shellfolder.GetDetailsOf($shellfile,  130)
"TTY/TTD phone" = $shellfolder.GetDetailsOf($shellfile,  131)
"Telex" = $shellfolder.GetDetailsOf($shellfile,  132)
"Website" = $shellfolder.GetDetailsOf($shellfile,  133)
"Content status" = $shellfolder.GetDetailsOf($shellfile,  134)
"Content type" = $shellfolder.GetDetailsOf($shellfile,  135)
"Capture date" = $shellfolder.GetDetailsOf($shellfile,  136)
"Archiving date" = $shellfolder.GetDetailsOf($shellfile,  137)
"Completion date" = $shellfolder.GetDetailsOf($shellfile,  138)
"Device category" = $shellfolder.GetDetailsOf($shellfile,  139)
"Connection established" = $shellfolder.GetDetailsOf($shellfile,  140)
"Detection method" = $shellfolder.GetDetailsOf($shellfile,  141)
"Display name" = $shellfolder.GetDetailsOf($shellfile,  142)
"Local computer" = $shellfolder.GetDetailsOf($shellfile,  143)
"Manufacturer" = $shellfolder.GetDetailsOf($shellfile,  144)
"Model" = $shellfolder.GetDetailsOf($shellfile,  145)
"Paired" = $shellfolder.GetDetailsOf($shellfile,  146)
"Classification" = $shellfolder.GetDetailsOf($shellfile,  147)
"Status" = $shellfolder.GetDetailsOf($shellfile,  149)
"Device status" = $shellfolder.GetDetailsOf($shellfile,  150)
"Contributors" = $shellfolder.GetDetailsOf($shellfile,  151)
"Content created" = $shellfolder.GetDetailsOf($shellfile,  152)
"Last printed" = $shellfolder.GetDetailsOf($shellfile,  153)
"Last saved" = $shellfolder.GetDetailsOf($shellfile,  154)
"Main department" = $shellfolder.GetDetailsOf($shellfile,  155)
"Document ID" = $shellfolder.GetDetailsOf($shellfile,  156)
"Pages" = $shellfolder.GetDetailsOf($shellfile,  157)
"Slides" = $shellfolder.GetDetailsOf($shellfile,  158)
"Total processing time" = $shellfolder.GetDetailsOf($shellfile,  159)
"Word count" = $shellfolder.GetDetailsOf($shellfile,  160)
"Due on" = $shellfolder.GetDetailsOf($shellfile,  161)
"End date" = $shellfolder.GetDetailsOf($shellfile,  162)
"Number of files" = $shellfolder.GetDetailsOf($shellfile,  163)
"File extension" = $shellfolder.GetDetailsOf($shellfile,  164)
"File name" = $shellfolder.GetDetailsOf($shellfile,  165)
"File version" = $shellfolder.GetDetailsOf($shellfile,  166)
"Marking color" = $shellfolder.GetDetailsOf($shellfile,  167)
"Marking status" = $shellfolder.GetDetailsOf($shellfile,  168)
"Free space" = $shellfolder.GetDetailsOf($shellfile,  169)
"Group" = $shellfolder.GetDetailsOf($shellfile,  173)
"Bit depth" = $shellfolder.GetDetailsOf($shellfile,  174)
"Horizontal resolution" = $shellfolder.GetDetailsOf($shellfile,  175)
"Width" = $shellfolder.GetDetailsOf($shellfile,  176)
"Vertical resolution" = $shellfolder.GetDetailsOf($shellfile,  177)
"Height" = $shellfolder.GetDetailsOf($shellfile,  178)
"Importance" = $shellfolder.GetDetailsOf($shellfile,  179)
"Attachment?" = $shellfolder.GetDetailsOf($shellfile,  180)
"Deleted" = $shellfolder.GetDetailsOf($shellfile,  181)
"Encryption status" = $shellfolder.GetDetailsOf($shellfile,  182)
"Label present" = $shellfolder.GetDetailsOf($shellfile,  183)
"Has been completed" = $shellfolder.GetDetailsOf($shellfile,  184)
"Incomplete" = $shellfolder.GetDetailsOf($shellfile,  185)
"Read status" = $shellfolder.GetDetailsOf($shellfile,  186)
"Released" = $shellfolder.GetDetailsOf($shellfile,  187)
"Creator" = $shellfolder.GetDetailsOf($shellfile,  188)
"Date" = $shellfolder.GetDetailsOf($shellfile,  189)
"Folder name" = $shellfolder.GetDetailsOf($shellfile,  190)
"File location" = $shellfolder.GetDetailsOf($shellfile,  191)
"Folder" = $shellfolder.GetDetailsOf($shellfile,  192)
"Participants" = $shellfolder.GetDetailsOf($shellfile,  193)
"Path" = $shellfolder.GetDetailsOf($shellfile,  194)
"By location" = $shellfolder.GetDetailsOf($shellfile,  195)
"Contact names" = $shellfolder.GetDetailsOf($shellfile,  197)
"Entry type" = $shellfolder.GetDetailsOf($shellfile,  198)
"Language" = $shellfolder.GetDetailsOf($shellfile,  199)
"Last visit" = $shellfolder.GetDetailsOf($shellfile,  200)
"Description" = $shellfolder.GetDetailsOf($shellfile,  201)
"Link status" = $shellfolder.GetDetailsOf($shellfile,  202)
"Link destination" = $shellfolder.GetDetailsOf($shellfile,  203)
"URL" = $shellfolder.GetDetailsOf($shellfile,  204)
"Medium created" = $shellfolder.GetDetailsOf($shellfile,  208)
"Published" = $shellfolder.GetDetailsOf($shellfile,  209)
"Encoded by" = $shellfolder.GetDetailsOf($shellfile,  210)
"Episode number" = $shellfolder.GetDetailsOf($shellfile,  211)
"Producers" = $shellfolder.GetDetailsOf($shellfile,  212)
"Publisher" = $shellfolder.GetDetailsOf($shellfile,  213)
"Season number" = $shellfolder.GetDetailsOf($shellfile,  214)
"Subtitle" = $shellfolder.GetDetailsOf($shellfile,  215)
"User web URL" = $shellfolder.GetDetailsOf($shellfile,  216)
"Lyricist" = $shellfolder.GetDetailsOf($shellfile,  217)
"BCC addresses" = $shellfolder.GetDetailsOf($shellfile,  220)
"BCC" = $shellfolder.GetDetailsOf($shellfile,  221)
"CC addresses" = $shellfolder.GetDetailsOf($shellfile,  222)
"CC" = $shellfolder.GetDetailsOf($shellfile,  223)
"Entertainment ID" = $shellfolder.GetDetailsOf($shellfile,  224)
"Received date" = $shellfolder.GetDetailsOf($shellfile,  225)
"Sent date" = $shellfolder.GetDetailsOf($shellfile,  226)
"From addresses" = $shellfolder.GetDetailsOf($shellfile,  227)
"From" = $shellfolder.GetDetailsOf($shellfile,  228)
"Has attachments" = $shellfolder.GetDetailsOf($shellfile,  229)
"Sender address" = $shellfolder.GetDetailsOf($shellfile,  230)
"Sender name" = $shellfolder.GetDetailsOf($shellfile,  231)
"Storage" = $shellfolder.GetDetailsOf($shellfile,  232)
"Recipient addresses" = $shellfolder.GetDetailsOf($shellfile,  233)
"Working title" = $shellfolder.GetDetailsOf($shellfile,  234)
"To" = $shellfolder.GetDetailsOf($shellfile,  235)
"Running time" = $shellfolder.GetDetailsOf($shellfile,  236)
"Album artist" = $shellfolder.GetDetailsOf($shellfile,  237)
"Sort by album artist" = $shellfolder.GetDetailsOf($shellfile,  238)
"Album ID" = $shellfolder.GetDetailsOf($shellfile,  239)
"Sort by album" = $shellfolder.GetDetailsOf($shellfile,  240)
"Sort by contributing artists" = $shellfolder.GetDetailsOf($shellfile,  241)
"Beats per minute" = $shellfolder.GetDetailsOf($shellfile,  242)
"Composers" = $shellfolder.GetDetailsOf($shellfile,  243)
"Sort by composer" = $shellfolder.GetDetailsOf($shellfile,  244)
"Disc" = $shellfolder.GetDetailsOf($shellfile,  245)
"Original key" = $shellfolder.GetDetailsOf($shellfile,  246)
"Part of a compilation" = $shellfolder.GetDetailsOf($shellfile,  247)
"Mood" = $shellfolder.GetDetailsOf($shellfile,  248)
"Part of a set" = $shellfolder.GetDetailsOf($shellfile,  249)
"Time period" = $shellfolder.GetDetailsOf($shellfile,  250)
"Color" = $shellfolder.GetDetailsOf($shellfile,  251)
"Parental control" = $shellfolder.GetDetailsOf($shellfile,  252)
"Reason for parental control rating" = $shellfolder.GetDetailsOf($shellfile,  253)
"Storage space used" = $shellfolder.GetDetailsOf($shellfile,  254)
"EXIF version" = $shellfolder.GetDetailsOf($shellfile,  255)
"Event" = $shellfolder.GetDetailsOf($shellfile,  256)
"Light value" = $shellfolder.GetDetailsOf($shellfile,  257)
"Exposure program" = $shellfolder.GetDetailsOf($shellfile,  258)
"Exposure time" = $shellfolder.GetDetailsOf($shellfile,  259)
"Aperture number" = $shellfolder.GetDetailsOf($shellfile,  260)
"Flash mode" = $shellfolder.GetDetailsOf($shellfile,  261)
"Focal length" = $shellfolder.GetDetailsOf($shellfile,  262)
"35mm focal length" = $shellfolder.GetDetailsOf($shellfile,  263)
"ISO film sensitivity" = $shellfolder.GetDetailsOf($shellfile,  264)
"Lens manufacturer" = $shellfolder.GetDetailsOf($shellfile,  265)
"Lens model" = $shellfolder.GetDetailsOf($shellfile,  266)
"Light source" = $shellfolder.GetDetailsOf($shellfile,  267)
"Maximum aperture" = $shellfolder.GetDetailsOf($shellfile,  268)
"Metering mode" = $shellfolder.GetDetailsOf($shellfile,  269)
"Alignment" = $shellfolder.GetDetailsOf($shellfile,  270)
"Contacts" = $shellfolder.GetDetailsOf($shellfile,  271)
"Program mode" = $shellfolder.GetDetailsOf($shellfile,  272)
"Saturation" = $shellfolder.GetDetailsOf($shellfile,  273)
"Distance" = $shellfolder.GetDetailsOf($shellfile,  274)
"White balance" = $shellfolder.GetDetailsOf($shellfile,  275)
"Priority" = $shellfolder.GetDetailsOf($shellfile,  276)
"Project" = $shellfolder.GetDetailsOf($shellfile,  277)
"Channel" = $shellfolder.GetDetailsOf($shellfile,  278)
"Episode name" = $shellfolder.GetDetailsOf($shellfile,  279)
"Subtitle (Closed Captions)" = $shellfolder.GetDetailsOf($shellfile,  280)
"Repeat" = $shellfolder.GetDetailsOf($shellfile,  281)
"Two-channel sound" = $shellfolder.GetDetailsOf($shellfile,  282)
"Broadcast date" = $shellfolder.GetDetailsOf($shellfile,  283)
"Broadcast description" = $shellfolder.GetDetailsOf($shellfile,  284)
"Recording time" = $shellfolder.GetDetailsOf($shellfile,  285)
"Station call sign" = $shellfolder.GetDetailsOf($shellfile,  286)
"TV station name" = $shellfolder.GetDetailsOf($shellfile,  287)
"Summary" = $shellfolder.GetDetailsOf($shellfile,  289)
"Search match type" = $shellfolder.GetDetailsOf($shellfile,  290)
"Snippet" = $shellfolder.GetDetailsOf($shellfile,  291)
"Automatic summary" = $shellfolder.GetDetailsOf($shellfile,  292)
"Relevance" = $shellfolder.GetDetailsOf($shellfile,  293)
"File ownership" = $shellfolder.GetDetailsOf($shellfile,  294)
"Sensitivity" = $shellfolder.GetDetailsOf($shellfile,  295)
"Shared with" = $shellfolder.GetDetailsOf($shellfile,  296)
"Sharing status" = $shellfolder.GetDetailsOf($shellfile,  297)
"Product name" = $shellfolder.GetDetailsOf($shellfile,  299)
"Product version" = $shellfolder.GetDetailsOf($shellfile,  300)
"Support link" = $shellfolder.GetDetailsOf($shellfile,  301)
"Source" = $shellfolder.GetDetailsOf($shellfile,  302)
"Start date" = $shellfolder.GetDetailsOf($shellfile,  303)
"Is shared" = $shellfolder.GetDetailsOf($shellfile,  304)
"Availability status" = $shellfolder.GetDetailsOf($shellfile,  305)
"Billing information" = $shellfolder.GetDetailsOf($shellfile,  307)
"Completed" = $shellfolder.GetDetailsOf($shellfile,  308)
"Task owner" = $shellfolder.GetDetailsOf($shellfile,  309)
"Sort" = $shellfolder.GetDetailsOf($shellfile,  310)
"Total file size" = $shellfolder.GetDetailsOf($shellfile,  311)
"Brands" = $shellfolder.GetDetailsOf($shellfile,  312)
"Email of the author of the last change" = $shellfolder.GetDetailsOf($shellfile,  313)
"Name of the author of the last change" = $shellfolder.GetDetailsOf($shellfile,  314)
"Date of the last change" = $shellfolder.GetDetailsOf($shellfile,  315)
"ID of the last change" = $shellfolder.GetDetailsOf($shellfile,  316)
"Message about the last change" = $shellfolder.GetDetailsOf($shellfile,  317)
"Version status" = $shellfolder.GetDetailsOf($shellfile,  318)
"Video compression" = $shellfolder.GetDetailsOf($shellfile,  319)
"Directors" = $shellfolder.GetDetailsOf($shellfile,  320)
"Data rate" = $shellfolder.GetDetailsOf($shellfile,  321)
"Image height" = $shellfolder.GetDetailsOf($shellfile,  322)
"Frame rate" = $shellfolder.GetDetailsOf($shellfile,  323)
"Image width" = $shellfolder.GetDetailsOf($shellfile,  324)
"Spherical" = $shellfolder.GetDetailsOf($shellfile,  325)
"Stereo" = $shellfolder.GetDetailsOf($shellfile,  326)
"Video orientation" = $shellfolder.GetDetailsOf($shellfile,  327)
"Total bit rate" = $shellfolder.GetDetailsOf($shellfile,  328) 

	}
}| select "File location", "Name", "Size",  "File extension", "Element type", "Modification date", "Creation date", "Last accessed", "Attributes", "Offline status", "Availability", "Recognized type", "Owner", "Type", "Recording date", "Contributing artists", "Album", "Year", "Genre", "Conductors", "Tags", "Rating", "Authors", "Title", "Subject", "Categories", "Comments", "Copyright", "Track number", "Length", "Bitrate", "Protected", "Camera model", "Dimensions", "Camera manufacturer", "Company", "File description", "Master keywords", "Program name", "Duration", "Is online", "Periodically recurring", "Location", "Addresses of optional participants", "Optional participants", "Organizer address", "Organizer name", "Reminder time", "Addresses of required participants", "Required participants", "Resources", "Meeting status", "Status free/busy", "Total size", "Account name", "Task status", "Computer", "Anniversary", "Assistant's name", "Assistant's phone number", "Birthday", "Business address", "Location (business)", "State/Province (business)", "P.O. Box (business)", "Zip code (business)", "Street (business)", "Fax (business)", "Homepage (business)", "Phone number (business)", "Callback number", "Car phone", "Children", "Company main phone number", "Department", "Email address", "Email2", "Email3", "Email list", "Email display name", "Save as", "First name", "Full name", "Gender", "Given name", "Hobbies", "Home address", "City (home)", "Country/Region (home)", "P.O. Box (home)", "Zip code (home)", "State/Province (home)", "Street (home)", "Fax (home)", "Phone number (private)", "Chat addresses", "Initials", "Position", "Last name", "Address", "Middle name", "Mobile phone", "Nickname", "Office location", "Additional address", "Other city", "Other country/region", "Other PO box", "Other postal code", "Other state or province", "Other street", "Pager", "Personal title", "City", "Country/region", "P.O. Box", "Zip code", "State/Province", "Street", "Primary email", "Primary phone number", "Occupation", "Spouse/Partner", "Suffix", "TTY/TTD phone", "Telex", "Website", "Content status", "Content type", "Capture date", "Archiving date", "Completion date", "Device category", "Connection established", "Detection method", "Display name", "Local computer", "Manufacturer", "Model", "Paired", "Classification", "Status", "Device status", "Client ID", "Contributors", "Content created", "Last printed", "Last saved", "Main department", "Document ID", "Pages", "Slides", "Total processing time", "Word count", "Due on", "End date", "Number of files","File name", "File version", "Marking color", "Marking status", "Free space", "Group", "Release type", "Horizontal resolution", "Width", "Vertical resolution", "Height", "Importance", "Attachment?", "Deleted", "Encryption status", "Label present", "Has been completed", "Incomplete", "Read status", "Released", "Creator", "Date", "Path", "Folder name", "Folder", "Participants", "By location", "Contact names", "Entry type", "Language", "Last visit", "Description", "Link status", "Link destination", "URL", "Medium created", "Published", "Encoded by", "Episode number", "Producers", "Publisher", "Season number", "Subtitle", "User web URL", "Lyricist", "Attachments", "BCC addresses", "BCC", "CC addresses", "CC", "Entertainment ID", "Received date", "Sent date", "From addresses", "From", "Has attachments", "Sender address", "Sender name", "Storage", "Recipient addresses", "Working title", "To", "Running time", "Album artist", "Sort by album artist", "Album ID", "Sort by album", "Sort by contributing artists", "Beats per minute", "Composers", "Sort by composer", "Disc", "Original key", "Part of a compilation", "Mood", "Part of a set", "Time period", "Color", "Parental control", "Reason for parental control rating", "Storage space used", "EXIF version", "Event", "Light value", "Exposure program", "Exposure time", "Aperture number", "Flash mode", "Focal length", "35mm focal length", "ISO film sensitivity", "Lens manufacturer", "Lens model", "Light source", "Maximum aperture", "Metering mode", "Alignment", "Contacts", "Program mode", "Saturation", "Distance", "White balance", "Priority", "Project", "Channel", "Episode name", "Subtitle (Closed Captions)", "Repeat", "Two-channel sound", "Broadcast date", "Broadcast description", "Recording time", "Station call sign", "TV station name", "Summary", "Search match type", "Snippet", "Automatic summary", "Relevance", "File ownership", "Sensitivity", "Shared with", "Sharing status", "Product name", "Product version", "Support link", "Source", "Start date", "Is shared", "Availability status", "Billing information", "Completed", "Task owner", "Sort", "Total file size", "Brands", "Email of the author of the last change", "Name of the author of the last change", "Date of the last change", "ID of the last change", "Message about the last change", "Version status", "Video compression", "Bit depth", "Directors", "Data rate", "Image height", "Frame rate", "Image width", "Spherical", "Stereo", "Video orientation", "Total bit rate" | Export-Csv $result -NoTypeInformation -Delimiter ';' -Encoding "Unicode"