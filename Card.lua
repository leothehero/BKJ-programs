local component = require("component")
local writer = component.os_cardwriter
local magReader = component.proxy("fc91d79f-5720-430c-a0d5-72b094262b99")
local shell = require("shell")
local dc = component.data
local args, opts = shell.parse(...)
local file = io.open("/.AuthPublicKey")
local PublicUserAuthKey = dc.deserializeKey(file:read())
file:close()
if args[1] == "CreateAuthPass" then
    print("Please enter the player's username, case and character sensitive: ")
    local Username = io.read()
    event


end