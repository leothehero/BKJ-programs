local component = require("component")
local nano = component.os_nanofog_terminal
local nanoCoords = {}
local motion = component.proxy()
local motionCoords = {}

local function box(px,py,pz)
    nano.setArea(px-2,py-2,pz-2,px+2,py+2,pz+2,"barrier")
    for x=px-2,px+2 do
        for y=py-2,py+2 do
            for z=pz-2,pz+2 do
                nano.setSolid(x,y,z)
                nano.setKnockback(x,y,z,0)
                nano.setDamage(x,y,z,5)
            end
        end
    end
end