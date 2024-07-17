local class = require("libs.middleclass")

--- @class Node
local Node = class("Node")

--- Configura uma instância de 'Node' para middleclass.
--- @param id string
function Node:initialize(id)
  self.id = id
  self.title = nil        --- @type string
  self.description = nil  --- @type string
  self.header = nil       --- @type string
  self.choices = {}       --- @type Choice[]
  self.gameOver = false   --- @type boolean
  self.gameWon = false    --- @type boolean
end

return Node
