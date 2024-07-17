local class = require("libs.middleclass")

--- @class GameData
local GameData = class("GameData")

--- Configura uma instância de 'GameData' para middleclass.
function GameData:initialize()
  self.activeNode = nil   --- @type Node
  self.isOver = false
  self.hasKey = false
  self.thalassophobic = false
  self.thirsty = false
  self.hasMagicLamp = false
end

return GameData
