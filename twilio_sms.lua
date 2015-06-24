local ltn12 = require("ltn12")
local https = require('ssl.https')
local config = assert(io.open('config.txt', 'r'))

-- get config data
local lines = {}  -- NOTE: arrays are 1-based
for line in config:lines() do
    table.insert(lines, line)
end

local ACCOUNT_SID = lines[1]
local AUTH_TOKEN = lines[2]
local TWILIO_NUMBER = lines[3]

local to = '9998675309' -- CHANGEME
local msg = 'Yay!' -- CHANGEME

local request_body = string.format('To=%s&From=%s&Body=%s', to, TWILIO_NUMBER, msg)

https.request {
    method = 'POST',
    url = string.format('https://%s:%s@api.twilio.com/2010-04-01/Accounts/%s/SMS/Messages.json', ACCOUNT_SID, AUTH_TOKEN, ACCOUNT_SID),
    source = ltn12.source.string(request_body),
    headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded",
        ["content-length"] = string.len(request_body)
    },
    sink = ltn12.sink.file(io.stdout)
}

