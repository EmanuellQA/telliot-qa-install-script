#!/bin/bash

# Check if the directory already exists
if [ -d "$HOME/telliot-feeds-qa-test" ]; then
  echo "The folder 'telliot-feeds-qa-test' already exists. Please remove or rename it to save old configs."
  exit 1
fi

echo 
echo "This script will install Python, Telliot-feeds and Telliot-core"
echo "If installing in your main machine, please read the install.sh before continuing!"
echo
echo "Choose the environment to clone and install:"
echo "1 - main"
echo "2 - dev"
read -p "Enter 1-main or 2-dev: " environment_choice

echo "You entered: $environment_choice"

case $environment_choice in
  1)
    branch="main"
    ;;
  2)
    branch="main"
    ;;
  *)
    echo "Invalid choice. Please enter 1 for main or 2 for dev."
    exit 1
    ;;
esac

echo "Cloning branch: $branch"
echo

# Clone the repository with the selected branch
echo "Cloning telliot-feeds..."
git clone -b "$branch" https://github.com/EmanuellQA/telliot-feeds-qa-test.git

if [ $? -eq 0 ]; then
  echo "Repository cloned successfully."
else
  echo "Failed to clone repository."
  exit 1
fi

echo
echo "Moving to telliot-feeds folder..."
cd "$HOME/telliot-feeds-qa-test"

echo
echo "Installing Python 3.9 and venv..."
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y python3.9 python3.9-venv #python3-pip

# Create and activate the virtual environment
echo
echo "Creating and entering virtual environment..."
python3.9 -m venv venv
source venv/bin/activate

echo
echo "Installing telliot feeds"
pip install -e .

echo
echo "Cloning telliot-core..."
git clone -b "$branch" https://github.com/EmanuellQA/telliot-core-qa-test.git

if [ $? -eq 0 ]; then
  echo "Repository cloned successfully."
else
  echo "Failed to clone repository."
  exit 1
fi

echo
echo "Moving to telliot-core folder..."
cd "$HOME/telliot-core-qa-test"

echo
echo "Installing telliot core"
pip install -e .
telliot config init
cd

# Upgrade pip inside the virtual environment
#echo
#echo "Upgrading pip..."
#pip install --upgrade pip

# Install the `python-dotenv` module
#echo
#echo "Installing python-dotenv..."
#pip install python-dotenv

# Install Python dependencies
#echo
#echo "Installing Python dependencies..."
#pip install -r requirements.txt

# Install Foundry
#echo
#echo "Installing Foundry..."
#curl -L https://foundry.paradigm.xyz | bash

# Run foundryup directly from the .foundry/bin directory
#echo "Running foundryup to install Foundry..."
#"$HOME/.foundry/bin/foundryup"

echo
echo "Installation complete! Confirm you're inside venv before running telliot commands"
#echo
#echo -e "RESTART your terminal! \nRun 'cd ~/foundry-telliot-helper' to get in the folder\n Then run 'source foundryVenv/bin/activate' to activate python venv\n Don't forget to copy and edit the '.env.example' file!\n\n To run the tool: 'python3 main.py'"
