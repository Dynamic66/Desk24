
$fDesk.add_shown({
        Load-Shortcuts
        Set-FormVisibility -Visible $true
        $rText.LoadFile($pathNotes) 
    })

$fDesk.add_closed({
        $nIcon.Visible = $false
        $rText.SaveFile($pathNotes)
    })


$nIcon.add_click({
    if($args[1].Button -eq 'Left'){
        Set-FormVisibility -Visible $true
    }
    })


$ciExit.add_Click({
        $fDesk.Close()
    })

$bExit.add_click({
        $fDesk.Close()
    })

$tKeyInfo.add_keydown({
        param(
            $Sender,
            $event
        )
        $Sender.text = "KeyValue: $($event.KeyValue)
KeyData: $($event.KeyData)"
    })

$bAddShortcut.add_click({
        $fileDialog = [System.Windows.Forms.OpenFileDialog]::new()
        if ($fileDialog.ShowDialog() -eq 'OK') {

            $shell = New-Object -ComObject WScript.Shell
            $file = Get-Item $fileDialog.FileName
            $pathSave = "$pathShortcuts\$($file.basename).lnk"

            $shortcut = $shell.CreateShortcut($pathSave)
            $shortcut.TargetPath = $file.fullname
            $shortcut.Save()
            $shell = $null

        }

        Load-Shortcuts
    })



$ciDelete.add_click({
        Remove-Item -Path $cShortcuts.SourceControl.tag -Force
        Load-Shortcuts
    })

$ciOpen.add_click({
        Invoke-Item $pathShortcuts
        Load-Shortcuts
    })


$cPin.add_Click({
        if ($args[0].checked) {
            $fDesk.TopMost = $true
        }
        else {
            $fDesk.TopMost = $false
        }
    })


$bSave.add_Click({
        $rText.SaveFile($pathNotes)
    })

$bInvokeAI.add_click({
        $response = Get-OllamaResponse -prompt $tPrompt.text -responseOnly
        [System.Windows.Forms.MessageBox]::Show($response)
    })

$bConfig.add_click({
        Start-Process notepad.exe $pathConfig
    })


$ciFont.add_click({
        $dialog = [System.Windows.Forms.FontDialog]::new() 
        $null = $dialog.ShowDialog()
        $rText.SelectionFont = $dialog.Font
    })

$ciColor.add_click({
        $dialog = [System.Windows.Forms.ColorDialog]::new() 
        $null = $dialog.ShowDialog()
        $rText.SelectionColor = $dialog.Color
    })

$bAICall.add_Click({
        Invoke-Item $AIScript
    })


$tSizer.add_ValueChanged({
        $gNotes.Size = "$($gNotes.Size.Width),$(($args[0].value * 10))"
    })

$fDesk.add_mouseLeave({
    # is not reliable enought 
        start-sleep  -Milliseconds 200
        if([System.Windows.Forms.Cursor]::Position.X -le $fDesk.Bounds.X ){
            Set-FormVisibility -Visible $false
        }    
    })