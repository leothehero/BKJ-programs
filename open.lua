local shell = require("shell")
local component = require("component")
local event = require("event")
local SRL = require("serialization")
local file = io.open("/.ReactorDoor","r")
local ReactorDoorAddress = file:read()
file:close()
local args, opts = shell.parse(...)
if args[1] == "ReactorAccess" then
    local success,reason = component.proxy(ReactorDoorAddress).open(args[2])
    if success then
        print("Opening")
    else
        io.stderr:write("Could not open, reason: ".. tostring(reason))
    end
elseif args[1] == "ViewDoors" then
    --[[print("Administrator Biometric Authentication required, please have a registered user utilise the provided biometric scanner within the next minute.")
    local event,address,UUID = event.pull(15,"bioReader")
    if not(event) then
        io.stderr:write("No user has used the biometric scanner in the past minute, exiting.")
    else
        local file = io.open("/.ViewDoorAuthUsers","r")
        local AuthUsers = SRL.unserialize(file:read())
        file:close()
        print(UUID)
        print(AuthUsers[UUID])
        if AuthUsers[UUID] then
            print("User is authorised, attempting to open doors:")]]
            local file = io.open("/.ViewDoors")
            local ViewDoorAddresses = SRL.unserialize(file:read())
            for k,v in pairs(ViewDoorAddresses) do
                local success,reason = component.proxy(k).open(args[2])
                if success then
                    print("Opening "..k)
                else
                    io.stderr:write("Could not open "..k..", reason: ".. tostring(reason))
                end
            end
        --else
            --io.stderr:write("User is unauthorised to open these doors.")
        --end
    --end
elseif args[1] == nil then
    io.stderr:write("Please specify a door to open")
else
    io.stderr:write("Door not found")
end