--Doesnt work, I don't know why, but I guess it has to do with the nanofog terminal and how it handles too many requests in one second
local component = require("component")
local nano = component.os_nanofog_terminal
local nanoCoords = {104,64,0}
local motionAddress = "08975b1c-2e36-48a2-be7b-48a68bc9603f"
local motion = component.proxy(motionAddress)
motion.setSensitivity(0.1)
local motionCoords = {105,68,-15}
local event = require("event")
local XShift,YShift,ZShift = motionCoords[1]-nanoCoords[1],motionCoords[2]-nanoCoords[2],motionCoords[3]-nanoCoords[3]

local function resetRegion(x1,y1,z1,x2,y2,z2)
    return function ()
        for x=x1,x2 do
            for y=y1,y2 do
                for z=y1,y2 do
                    nano.reset(x,y,z)
                end
            end
        end
    end
end
local function box(eventName,address,Tx,Ty,Tz,entity)
    local px,py,pz = math.floor(Tx+XShift),math.floor(Ty+YShift),math.floor(Tz+ZShift)
    local x1,y1,z1,x2,y2,z2 = px,py,pz,px+2,py,pz+2
    nano.setArea(x1,y1,z1,x2,y2,z2,"glass")
    for x=x1,x2 do
        for y=y1,y2 do
            for z=y1,y2 do
                nano.setSolid(x,y,z)
                nano.setFilter(x,y,z,"player",false,true)
                nano.setKnockback(x,y,z,5)
                nano.setDamage(x,y,z,5)
            end
        end
    end
    event.timer(20,resetRegion(x1,y1,z1,x2,y2,z2))
end
event.listen("motion",box) 