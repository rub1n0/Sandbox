# Windows Sandbox Environment Setup

This repository contains `sandbox_setup.py`, a Python script that generates a preconfigured Windows Sandbox environment with tools automatically installed.

## 🔧 What It Does

Running `sandbox_setup.py` will:

1. Create a directory called `sandbox_env` in the current working folder.
2. Generate two files in that directory:
   - **`setup.bat`** – A batch script that downloads and installs:
     - [7-Zip](https://www.7-zip.org/)
     - [Python 3.12](https://www.python.org/)
     - [Visual Studio Code](https://code.visualstudio.com/)
       - Installs the following extensions:
         - `ms-python.python`
         - `esbenp.prettier-vscode`
         - `ms-vscode.hexeditor`
         - `ms-vscode.powershell`
   - **`sandbox.wsb`** – A Windows Sandbox configuration file that maps the `sandbox_env` folder and runs `setup.bat` automatically on launch.

## ▶️ How to Use

1. **Enable Windows Sandbox (if not already enabled)**  
   - Go to **Control Panel** → **Programs** → **Turn Windows features on or off**  
   - Check **Windows Sandbox**, then click **OK**
   - Restart your computer if prompted

   Or use PowerShell (Run as Administrator):
   ```powershell
   Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
   ```

2. **Run the script**  
   ```
   python sandbox_setup.py
   ```

3. **Launch the Sandbox**  
   Double-click `sandbox_env/sandbox.wsb` to start the Windows Sandbox.

4. **Automated Installation**  
   The sandbox will:
   - Start a virtual Windows instance
   - Automatically run `setup.bat`
   - Download and silently install the applications
   - Log output to the sandbox user's `Documents\setup.log` file

## 📁 Folder Structure

```
sandbox_env/
├── setup.bat         # Installation script
└── sandbox.wsb       # Sandbox configuration file
```

## ⚠️ Requirements

- Windows 10/11 **Pro**, **Enterprise**, or **Education**
- Windows Sandbox feature enabled
- Admin privileges to enable features and launch sandbox
- Internet access in the sandbox for downloading installers