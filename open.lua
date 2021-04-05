local shell = require("shell")
local component = require("component")
local file = io.open("/ReactorDoor","r")
local ReactorDoorAddress = file:read()
file:close()
local args, opts = shell.parse(...)
if args[1] == "ReactorAccess" then
    local success,reason = component.proxy(ReactorDoorAddress).open(args[2])
    if success then
        print("Opening")
    else
        io.stderr:write("Could Not Open, reason: ".. tostring(reason))
    end
elseif args[1] == nil then
    io.stderr:write("Please specify a door to open")
else
    io.stderr:write("Door not found")
end