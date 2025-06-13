
        @echo off
        setlocal
        set "LOG=%USERPROFILE%\Documents\setup.log"
        set "DL=%USERPROFILE%\Downloads"

        echo [STARTING INSTALL] > "%LOG%"

        where curl >> "%LOG%" 2>&1
        curl --version >> "%LOG%" 2>&1

        :: 7-Zip
        echo [7-Zip] Downloading... >> "%LOG%"
        curl -L -o "%DL%\7z.exe" https://www.7-zip.org/a/7z2301-x64.exe >> "%LOG%" 2>&1
        if exist "%DL%\7z.exe" (
            start /wait "" "%DL%\7z.exe" /S >> "%LOG%" 2>&1
        )

        :: VS Code
        echo [VS Code] Downloading... >> "%LOG%"
        curl -L -o "%DL%\vscode.exe" https://update.code.visualstudio.com/latest/win32-x64/stable >> "%LOG%" 2>&1
        if exist "%DL%\vscode.exe" (
            start /wait "" "%DL%\vscode.exe" /silent >> "%LOG%" 2>&1
            timeout /t 5 >nul
            set "CODE_BIN=C:\Program Files\Microsoft VS Code\bin\code.cmd"
        )

        :: Python
        echo [Python] Downloading... >> "%LOG%"
        curl -L -o "%DL%\python.exe" https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe >> "%LOG%" 2>&1
        if exist "%DL%\python.exe" (
            start /wait "" "%DL%\python.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 >> "%LOG%" 2>&1
        )

        :: VS Code Extensions
        if exist "%CODE_BIN%" (
            echo [VS Code Extensions] Installing... >> "%LOG%"
            "%CODE_BIN%" --install-extension ms-python.python >> "%LOG%" 2>&1
            "%CODE_BIN%" --install-extension ms-toolsai.jupyter >> "%LOG%" 2>&1
            "%CODE_BIN%" --install-extension ms-vscode.cpptools >> "%LOG%" 2>&1
            "%CODE_BIN%" --install-extension ms-vscode.cmake-tools >> "%LOG%" 2>&1
        )

        echo [COMPLETE] >> "%LOG%"
        endlocal
        