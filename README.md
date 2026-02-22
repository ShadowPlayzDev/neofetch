<div align=center font-size=20>Neofetch</div>
<div align="center">Neofetch is a system specification display tool that displays it visually and beautifully. Built with PowerShell, Batch, and Bash, it works on any PC!</div>

## Neofetch is tested and working on:
* [X] **Windows/PowerShell**
* [X] **Windows/Batch**
* [ ] Linux/Bash
* [ ] MacOS/Bash

> [!NOTE]
> Batch is installed alongside PowerShell so it can run in most terminals. If this is not something you want, you can delete the file.

---

### To get started, first select your Operating System and install method.
Then, run it as root or with administrative permissions.

<details>
  <summary><h3>🪟 Windows</h3></summary>
  
  Install via command-line:
  <pre><code>irm https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/win-ps/install.ps1 | iex</code></pre>

  * **[Install via PowerShell (.ps1)](https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/win-ps/install.ps1)**

  **Installer Hash:** `CF593132B1933E6BBDA3A73EDF7CD1F57CEF6E16AECB9D09ADA7A484323B7491`
</details>

<details>
  <summary><h3>🐧 Linux</h3></summary>
  
  * Install via command-line:
  <pre><code>curl -sL https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/linux-sh/install.sh | sudo bash</code></pre>

  * **[Install via Bash (.sh)](https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/linux-sh/install.sh)**
</details>

---

Once it is done installing, it will place the script in your system's PATH or something similar so you can type `neofetch` anywhere and it'll run.

### Customization
To add the ASCII icon, download one of the icons located for your OS [here](https://github.com/ShadowPlayzDev/neofetch/tree/main/logos).

1. Place it inside the **logos** folder where you installed.
2. Use `echo %neofetch%` in your terminal to find your install directory.
3. Add the OS type to the `OS_DIR` line in the config.
4. Add the distro/version of your OS to the "TEXT_FILE" line in the config
It should be inside %neofetch%/logos/os/distro/version.txt with os being your os and distro being your distro (or version being your version)
Ex.
`OS_DIR=win
TEXT_FILE=11.txt`
Once you are done, type in "neofetch" in your terminal, you should see the logo now.
