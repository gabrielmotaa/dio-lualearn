-- Constants
local ID = "nyff.trilha"

-- Dependencies
local Node = require("node")

-- Create node
local node = Node:new(ID) ---@type Node
node.description = [[Uma matilha de lobos te cercou, eles também estão sem comida, e adivinhe só, o banquete é você!]]

-- Create choices
node:addChoice(
    "nyff.lobos",
    "Correr o mais rápido que você puder, sem nem hesitar!"
)
node:addChoice(
    "nyff.topo",
    "Dividir sua comida com os lobos para que eles te deixem em paz."
)

return node
