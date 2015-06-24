## Setup

### Install lua and luarocks
    brew install lua
    brew install luarocks

### Install luarocks modules
    luarocks install luasocket
    luarocks install luasec

## Configure
Edit the config.txt file with your twilio account info (see [config.txt.example](config.txt.example)).

## Testing
A simple curl request as a backup to verify your twilio account info:

    curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/<ACCOUNT_SID>/Messages.json' \
    --data-urlencode 'To=<TO>' \
    --data-urlencode 'From=<TWILIO_NUMBER>' \
    --data-urlencode 'Body=test' \
    -u <ACCOUNT_SID>:<AUTH_TOKEN>
