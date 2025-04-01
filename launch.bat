@echo off
REM Store the current directory (where the .bat script is called)
set "CURRENT_DIR=%~dp0"

REM Navigate to the directory where the .bat file is located
cd /d "%CURRENT_DIR%"

REM Perform git pull to fetch the latest changes
git pull

REM Check if the virtual environment exists
IF NOT EXIST "venv\Scripts\activate.bat" (
    echo Virtual environment not found. Creating a new one...
    REM Create the virtual environment
    python -m venv venv
    
    REM Activate the virtual environment to install dependencies
    call "venv\Scripts\activate.bat"

    REM Check if requirements.txt exists, and install dependencies if it does
    IF EXIST "requirements.txt" (
        echo Installing dependencies from requirements.txt...
        pip install -r requirements.txt
    ) ELSE (
        echo requirements.txt not found. Skipping dependency installation.
    )

    REM Deactivate the virtual environment
    deactivate
) ELSE (
    echo Virtual environment found. Activating...
    REM Activate the virtual environment
    call "venv\Scripts\activate.bat"

    REM Check for outdated or missing packages in the virtual environment
    IF EXIST "requirements.txt" (
        echo Checking for outdated or missing dependencies...
        pip install --upgrade -r requirements.txt
    ) ELSE (
        echo requirements.txt not found. Skipping dependency check.
    )
)

REM Run the Python script (app.py)
python app.py

REM Deactivate the virtual environment (optional, it will deactivate automatically when the script finishes)
deactivate