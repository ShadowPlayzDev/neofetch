# Neofetch
Neofetch is a system specification display tool that displays it visually and beautifully. Built with PowerShell, Batch, and Bash, it works on any PC!

## Neofetch is tested and working on:
[X] Windows/PowerShell
[X] Windows/Batch
[ ] Linux/Bash
[ ] MacOS/Bash
* Batch is installed alongside PowerShell so it can run in most terminals, if this is not something you want, you can delete the file.

# To get started, first select your Operating System and install method.
Then, run it as root or with administrative permissions

<details>
  # 🪟 Windows
  Install via command-line: <code>irm https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/win-ps/install.ps1</code>
  * [Install via PowerShell (.ps1)](https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/win-ps/install.ps1)

  Installer Hash: `CF593132B1933E6BBDA3A73EDF7CD1F57CEF6E16AECB9D09ADA7A484323B7491`
</details>

<details>
  # 🐧 Linux
  * Install via command-line:
  ```curl -sL https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/linux-sh/install.sh| sudo bash```
  * [Install via Bash (.sh)](https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/install.sh)
</details>

Once it is done installing, it will place the script in your system's PATH or something similar so you can type "neofetch" anywhere and it'll run.
To add the ASCII icon, download one of the icons located for your OS [here](https://github.com/ShadowPlayzDev/neofetch/tree/main/logos)
Make sure to place it inside the logos folder where you installed (<code>echo %neofetch%</code> will tell you where) and add the OS type to the OS_DIR line in the config, and the distro/version of your OS in the TextFile field
