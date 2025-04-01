#!/bin/bash

# Store the current directory (where the script is called)
CURRENT_DIR="$(pwd)"

# Navigate to the directory where the script is located (current directory)
cd "$CURRENT_DIR"

# Perform git pull to fetch the latest changes
echo "Pulling latest changes from the repository..."
git pull

# Check if the virtual environment exists
if [ ! -f "venv/bin/activate" ]; then
    echo "Virtual environment not found. Creating a new one..."
    
    # Create the virtual environment
    python3 -m venv venv

    # Activate the virtual environment to install dependencies
    source venv/bin/activate

    # Check if requirements.txt exists, and install dependencies if it does
    if [ -f "requirements.txt" ]; then
        echo "Installing dependencies from requirements.txt..."
        pip install -r requirements.txt
    else
        echo "requirements.txt not found. Skipping dependency installation."
    fi

    # Deactivate the virtual environment
    deactivate
else
    echo "Virtual environment found. Activating..."
    # Activate the virtual environment
    source venv/bin/activate

    # Check for outdated or missing packages in the virtual environment
    if [ -f "requirements.txt" ]; then
        echo "Checking for outdated or missing dependencies..."
        pip install --upgrade -r requirements.txt
    else
        echo "requirements.txt not found. Skipping dependency check."
    fi
fi

# Run the Python script (app.py)
echo "Running Python script..."
python3 app.py

# Deactivate the virtual environment (it will automatically deactivate at the end of the script)
deactivate
