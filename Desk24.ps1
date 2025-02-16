
try {
    $startupTime = (Measure-Command -Expression { 

        Add-Type -AssemblyName 'system.windows.forms'
        Add-Type -AssemblyName 'system.drawing'
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $pathDir = $MyInvocation.MyCommand.Path | Split-Path -Parent
        
        if(test-path $pathDir){
            Write-Host -ForegroundColor Yellow  'Loading Config file - ' -NoNewline
            . "$pathDir\Config.ps1"
            Write-Host -ForegroundColor green -Object 'Success' 
    
            Write-Host -ForegroundColor Yellow  -Object 'Loading Form file - ' -NoNewline
            . "$pathDir\Form.ps1"
            Write-Host -ForegroundColor green -Object 'Success'
    
            Write-Host -ForegroundColor Yellow  -Object 'Loading Events file - '  -NoNewline
            . "$pathDir\Events.ps1"
            Write-Host -ForegroundColor green -Object 'Success'
    
            Write-Host -ForegroundColor Yellow -Object 'Loading Functions file - '  -NoNewline
            . "$pathDir\Functions.ps1"
            Write-Host -ForegroundColor green -Object 'Success'
        }else{
            throw "$pathDir is not available"
        }

    }).TotalSeconds

    Write-host -Object "Loading compleated after: $startupTime" -ForegroundColor DarkMagenta
    [System.Windows.Forms.Application]::Run($fDesk)
}
catch {
    Write-Host -ForegroundColor Red -Object 'ERROR'
    write-host -ForegroundColor red "Error while loading: $_. Check if config.ps1, Form.ps1, Events.ps1, Functions.ps1 exist in the same folder as $pathdir"
    Pause
}




