local component = require("component")
local nano = component.os_nanofog_terminal
local coords = {66,64,20}
local areacoords = {70-coords[1],64-coords[2],15-coords[3],71-coords[1],65-coords[2],22-coords[3],"glass"}
nano.setArea(table.unpack(areacoords))
for x = areacoords[1],areacoords[4] do
    for y = areacoords[2],areacoords[5] do
        for z = areacoords[3],areacoords[6] do
            nano.setSolid(x,y,z)
            nano.setFilter(x,y,z,"player",false,true)
            nano.setDamage(5)
        end
    end
end