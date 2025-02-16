
$pathConfig = "$pathDir\config.ps1"
$pathNotes = "$pathDir\Notes.rtf"
$pathClip = "$pathDir\Clipboard.Clip"
$pathShortcuts = "$pathDir\Shortcuts"
$pathLogo = "$pathDir\desk.ico"

$ESCKey = 27 #esc
$showKey = 119 #f8

$Color1 = [System.Drawing.color]::FromArgb(90, 90, 90)
$Color2 = [System.Drawing.color]::FromArgb(80, 80, 80)
$Color3 = [System.Drawing.color]::FromArgb(75, 75, 75)

$ForeColor = [System.Drawing.color]::White
$FormPadding = '10,10,10,10'
$InnerPadding = "3,3,3,3"

#dock right
$SizeWidth = 400
$SizeHeigth = [system.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Height
$LocationX = [system.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $SizeWidth
$LocationY = 0

$Opacity = 0.95
$AIScript #= c:\path\to\your\ai\invocation

$AiTeperatur = 7
$AiModel = "llama3.2" # requieres ollama to be installed and the model to be downloaded