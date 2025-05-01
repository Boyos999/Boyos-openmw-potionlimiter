local types = require('openmw.types')
local core = require('openmw.core')
local I = require('openmw.interfaces')

I.ItemUsage.addHandlerForType(types.Potion, function(potion, actor)
    if not potion then
        return
    end
    if not types.Player.objectIsInstance(actor) then
        return
    end

    local potionLimit = 3 
    local playerAlchemy = types.NPC.stats.skills.alchemy(actor).modified

    if playerAlchemy >= 100 then
        potionLimit = 6
    elseif playerAlchemy >= 75 then
        potionLimit = 5
    elseif playerAlchemy >= 50 then
        potionLimit = 4
    end

    local activePotions = 0
    for _, spell in pairs(types.Actor.activeSpells(actor)) do
        if types.Potion.record(spell.id) ~= nil then
            activePotions = activePotions + 1
        end
    end
    if activePotions >= potionLimit then
        actor:sendEvent("potionBlocked")
        return false
    end

end)
