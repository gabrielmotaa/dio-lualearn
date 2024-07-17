local class = require("libs.middleclass")

-- Dependências
local Choice = require('choice')

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

--- Adiciona uma instância de choice ao node.
--- @param destination string
--- @param description string
--- @param condition? fun(string):boolean
--- @param routine? function
function Node:addChoice(destination, description, condition, routine)
  table.insert(self.choices, Choice:new(
    destination,
    description,
    condition,
    routine
  ))
end

return Node
