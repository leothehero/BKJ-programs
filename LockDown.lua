local event = require("event")
local component = require("component")
local function lockdown()
    for k,v in pairs(component.list("rolldoorcontroller")) do
        component.proxy(k).close("LockDown") 
    end
    component.os_securityterminal.enable("LockDown")
end
event.listen("motion",lockdown)