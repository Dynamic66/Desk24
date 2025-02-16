Function Set-FormVisibility {
    Param (
        [parameter(Mandatory = $true)]
        [boolean]$Visible
    )
    If ($visible) {
        $fDesk.Opacity = 0.95
        $fDesk.TopMost = $true
        $fDesk.TopMost = $false
    }
    Else {
        $fDesk.TopMost = $false
        $fDesk.Opacity = 0
    }
}

function Load-Shortcuts {

    if (-not (Test-Path $pathShortcuts)) {
        New-Item $pathShortcuts -ItemType Directory -Force
    }

    $pBottomControls.Controls.Clear()

    $pBottomControls.Controls.Add($bAddShortcut)

    Get-ChildItem -Path $pathShortcuts -Filter '*.lnk' | ForEach-Object {
        
        $obj = [System.Windows.Forms.Button]::new()
        $obj.text = $_.BaseName
        $obj.tag = $_.FullName
        $obj.ContextMenuStrip = $cShortcuts
        $obj.FlatAppearance.BorderSize = 1
        $obj.FlatStyle = 'flat'
        $obj.Image = [System.Drawing.Icon]::ExtractAssociatedIcon($_.FullName) 
        $obj.TextImageRelation = 'ImageBeforeText'
        $obj.AutoSize = $true
        $obj.AutoSizeMode = 'GrowAndShrink'
        $obj.add_click({ Invoke-Item $($args[0].tag) })

        $pBottomControls.Controls.Add($obj)
    }
}

function Get-OllamaResponse {
    param
    (
        [parameter(ParameterSetName = 'Prompt')]
        [string]$prompt,
        [parameter(ParameterSetName = 'Prompt')]
        [string]$Model = $AiModel,
        [parameter(ParameterSetName = 'Prompt')]
        [int]$seed,
        [parameter(ParameterSetName = 'Prompt')]
        [int]$Temperature = $AiTemperature,
        [parameter(ParameterSetName = 'Json')]
        [string]$Json,
        [switch]$responseOnly,
        [switch]$asJob,
        [string]$API = 'http://localhost:11434/api/generate'

    )
    
    if ($Prompt) {
        $request = @{ 
            model   = $Model
            options = {
                seed=$seed
                temperature=$Temperature
            }
            prompt  = $prompt
        } | ConvertTo-Json

        $output = curl $api -d $request | ConvertFrom-Json -AsHashtable
        
    }
    elseif ($Json) {
        $output = curl $api -d $Json
    }

    if ($responseOnly) {
        $output.response
    }
    else {
        $output 
    }
}
