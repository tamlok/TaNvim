# NeoVim's Setup Utils on Windows
# Le Tan (tamlokveer at gmail.com)
# https://github.com/tamlok/tanvim

# We use scoop to manage neovim binary.
function Setup-Neovim
{
    Write-Host "Setup NeoVim"
    $filesFolder = $env:USERPROFILE + '\AppData\Local\nvim'
    Remove-Item -Path "$filesFolder" -Recurse -Force
    robocopy ".\" "$filesFolder" /E /MT /XD .git /XF .git* > $null
}

Setup-Neovim
