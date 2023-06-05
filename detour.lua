GLOBAL_PANEL_FINDER = GLOBAL_PANEL_FINDER or {} -- namespaces are cool

local gpf = GLOBAL_PANEL_FINDER -- I didn't want to type that out everytime

gpf.storage = gpf.storage or {} -- where the data can be accessed
gpf.createx = gpf.createx or vgui.CreateX -- gotta grab the original function

function vgui.CreateX(...) -- detoure time
    local args = {...} -- do I need to do this in this context? probably not but I always do out of habit

    local panel = gpf.createx(unpack(args)) -- the original function returns the panel so I gotta call it in the middle

    gpf.storage[panel] = debug.traceback() -- store it and the traceback

    return panel -- done :)
end

--[[
    Example code I had to use one day:
    local panelInQuestion = vgui.GetWorldPanel():GetChildren()[28]
    print(gpf.storage[panelInQuestion])
]]