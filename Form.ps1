
#surfices
$fDesk = [System.Windows.forms.form]::new()
$cMenuPanel = [System.Windows.Forms.ContextMenuStrip]::new()
$pMid = [System.Windows.Forms.FlowLayoutPanel]::new()
$pTopControls = [System.Windows.Forms.FlowLayoutPanel]::new()
$pBottomControls = [System.Windows.Forms.FlowLayoutPanel]::new()
$gKeyInfo = [System.Windows.Forms.GroupBox]::new()
$gAI = [System.Windows.Forms.GroupBox]::new()
$gNotes = [System.Windows.Forms.GroupBox]::new()

$gKeyInfo.ForeColor = $ForeColor
$gKeyInfo.text = 'Key Info'
$gKeyInfo.size = "$($SizeWidth -30),70"


$pTopControls.dock = 'top'
#$pTopControls.BorderStyle = 'FixedSingle'
$pTopControls.AutoSize = $true
#$pTopControls.Padding = '0,0,0,0' #$InnerPadding


$pBottomControls.dock = 'bottom'
#$pBottomControls.BorderStyle = 'FixedSingle'
$pBottomControls.AutoSize = $true
#$pBottomControls.Padding = $InnerPadding

$cMenuPanel.BackColor = $Color3

$pMid.dock = 'fill'
$pMid.FlowDirection = 'TopDown'
#$pMid.BorderStyle = 'FixedSingle'
#$pMid.Padding = $InnerPadding
$pMid.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$pMid.AutoSize = $true

$fDesk.Icon = $pathLogo
$fDesk.Size = "$SizeWidth,$SizeHeigth"
$fDesk.BackColor = $color3
$fDesk.ForeColor = $ForeColor
$fDesk.FormBorderStyle = 'FixedSingle'
$fDesk.Font = "Segoe UI Emoji,9"
$fDesk.Opacity = $Opacity
$fDesk.Padding = $FormPadding
$fDesk.ContextMenuStrip = $cMenuPanel
$fDesk.Location = [System.Drawing.Point]::new($LocationX, $LocationY)
$fDesk.StartPosition = 'Manual'
$fDesk.ShowInTaskbar = $false
$fDesk.ControlBox = $false


$gNotes.ForeColor = $ForeColor
$gNotes.Text = 'Notes'
$gNotes.Size = "$($fDesk.size.Width -30),500"



$gAI.Text = 'AI'
$gAI.ForeColor = $ForeColor
$gAI.Size = "$($fDesk.size.Width -30),100"

#objects

$tSizer = [System.Windows.Forms.TrackBar]::new()

$nIcon = [System.Windows.Forms.NotifyIcon]::new()
$rText = [System.Windows.Forms.RichTextBox]::new()

$tPrompt = [System.Windows.Forms.TextBox]::new()
$tKeyInfo = [System.Windows.Forms.TextBox]::new()

$cMenuIcon = [System.Windows.Forms.ContextMenuStrip]::new()
$cShortcuts = [System.Windows.Forms.ContextMenuStrip]::new()
$cRTextMenue = [System.Windows.Forms.ContextMenuStrip]::new()

$cPin = [System.Windows.Forms.CheckBox]::new()

$bAddShortcut = [System.Windows.Forms.Button]::new()
$bInvokeAI = [System.Windows.Forms.Button]::new()
$bExit = [System.Windows.Forms.Button]::new()
$bSave = [System.Windows.Forms.Button]::new()
$bConfig = [System.Windows.Forms.Button]::new()
$bAICall = [System.Windows.Forms.Button]::new()

$bAddShortcut.Text = '+'
$bAddShortcut.FlatStyle = 'flat'
$bAddShortcut.FlatAppearance.BorderSize = 1
$bAddShortcut.ForeColor = 'green'
$bAddShortcut.size = "40,40"

$tKeyInfo.Multiline = $true
$tKeyInfo.dock = 'fill'
$tKeyInfo.ForeColor = $ForeColor
$tKeyInfo.BackColor = $Color3
$tKeyInfo.ReadOnly = $true
$tKeyInfo.BorderStyle = 'None'

$tSizer.Orientation = 'Horizontal'
$tSizer.TickStyle = 'None'
$tSizer.Dock = 'Top'
$tSizer.Minimum = 45
$tSizer.Maximum = 100
$tSizer.TickFrequency = 5

$nIcon.Icon = [system.drawing.icon]::ExtractAssociatedIcon($pathLogo)
$nIcon.Visible = $true
$nIcon.Text = 'Desk24'
$nIcon.ContextMenuStrip = $cMenuIcon


$cPin.ForeColor = $ForeColor
$cPin.Appearance = 'button'
$cPin.FlatStyle = 'Flat'
$cPin.FlatAppearance.BorderSize = 1
$cPin.Size = "30,30"
$cPin.Text = "📌"


$bExit.Text = 'exit'
$bExit.ForeColor = 'red'
$bExit.FlatStyle = 'Flat'
$bExit.AutoSize = $true
$bExit.FlatAppearance.BorderSize = 1

$bConfig.Text = "Open config"
$bConfig.FlatStyle = 'Flat'
$bConfig.AutoSize = $true
$bConfig.FlatAppearance.BorderSize = 1

$cMenuIcon.BackColor = $Color3
$cMenuIcon.ShowImageMargin = $false

$ciOpen = $cShortcuts.Items.Add('Edit')
$ciOpen.BackColor = $Color3
$ciOpen.ForeColor = $ForeColor

$ciFont = $cRTextMenue.Items.Add('Change Font')
$ciFont.BackColor = $Color3
$ciFont.ForeColor = $ForeColor

$ciColor = $cRTextMenue.Items.Add('Change Color')
$ciColor.BackColor = $Color3
$ciColor.ForeColor = $ForeColor


$ciDelete = $cShortcuts.Items.Add('Delete')
$ciDelete.BackColor = $Color3
$ciDelete.ForeColor = 'red'

$ciExit = $cMenuIcon.Items.Add('Exit')
$ciExit.BackColor = $Color3
$ciExit.ForeColor = 'red'


$rText.Dock = 'fill'
$rText.BackColor = $Color3
$rText.ForeColor = $ForeColor
$rText.BorderStyle = 'None'
$rText.ContextMenuStrip = $cRTextMenue

$bSave.text = 'Save'
$bSave.BackColor = $Color3
$bSave.ForeColor = $ForeColor
$bSave.FlatStyle = 'Flat'
$bSave.dock = 'bottom'
$bSave.FlatAppearance.BorderSize = 1

$tPrompt.dock = 'fill'
$tPrompt.Multiline = $true
$tPrompt.BackColor = $Color3
$tPrompt.ForeColor = $ForeColor
$tPrompt.BorderStyle = 'None'

$bInvokeAI.Text = 'Invoke-AI'
$bInvokeAI.FlatStyle = 'Flat'
$bInvokeAI.dock = 'fill'
$bInvokeAI.FlatAppearance.BorderSize = 1

$bAICall.dock = 'right'
$bAICall.Text = '📞'
$bAICall.AutoSize = $true
$bAICall.FlatStyle = 'Flat'
$bAICall.FlatAppearance.BorderSize = 1

$pAIControls = [System.Windows.Forms.panel]::new()
$pAIControls.dock = 'bottom'
$pAIControls.Controls.AddRange($bAICall,$bInvokeAI)
$pAIControls.Size = "30,30"


structuring of objects

$pTopControls.Controls.AddRange(
    $cPin,
    $bConfig,
    $bExit
)

$gKeyInfo.Controls.Add($tKeyInfo)

$gNotes.Controls.AddRange(
    $tSizer,
    $rText,
    $bSave
)

$gAI.Controls.AddRange(
    $tPrompt,
    $pAIControls
)

$pMid.Controls.AddRange(
    $gNotes, 
    $gKeyInfo,
    $gAI
)


$fDesk.Controls.AddRange($pMid,
    $pTopControls,
    $pBottomControls
)

