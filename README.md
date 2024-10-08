Devs, read what the install.sh will install if installing in your main machine.

If installing in a disposable VM with linux bash, just run:

curl -O https://raw.githubusercontent.com/EmanuellQA/telliot-qa-install-script/main/install.sh && chmod +x install.sh && ./install.sh && cd telliot-feeds-qa-test && source venv/bin/activate

The script will isntall telliot-feeds-qa, telliot-core-qa and optionally dvm-qa.
