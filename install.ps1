# NeoVim's Setup Utils on Windows
# Le Tan (tamlokveer at gmail.com)
# https://github.com/tamlok/tanvim

param(
    [string]$InstallMode
)

# We use scoop to manage neovim binary.
function Setup-Neovim
{
    Write-Host "Setup NeoVim"
    $filesFolder = $env:USERPROFILE + '\AppData\Local\nvim'
    if (Test-Path -Path $filesFolder) {
        Remove-Item -Path "$filesFolder" -Recurse -Force
    }

    if ($InstallMode -eq "copy") {
        Write-Host "Copying files to $filesFolder"
        robocopy ".\" "$filesFolder" /E /MT /XD .git /XF .git* > $null
    } else {
        Write-Host "Creating symlink to $filesFolder"
        New-Item -ItemType Junction -Path $filesFolder -Value $PSScriptRoot
    }
}

Setup-Neovim
