local ui = require('openmw.ui')

local function potionBlocked()
    ui.showMessage("You cannot drink any more potions")
end

return {
    eventHandlers = {
        potionBlocked = potionBlocked,
    }
}
