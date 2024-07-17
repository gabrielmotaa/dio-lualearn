local class = require("libs.middleclass")

--- @class GameData
local GameData = class("GameData")

--- Configura uma instância de 'GameData' para middleclass.
function GameData:initialize()
  self.activeNode = nil   --- @type Node
  self.isOver = false     --- @type boolean
  self.hasKey = false     --- @type boolean
  self.medoDoMar = false  --- @type boolean
end

return GameData
