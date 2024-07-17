-- Constantes
local ID = "nyff.trilha"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = [[Uma matilha de lobos te cercou, eles também estão sem comida, e adivinhe só, o banquete é você!]]

-- Adicionar choices
node:addChoice(
    "nyff.lobos",
    "Correr o mais rápido que você puder, sem nem hesitar!"
)
node:addChoice(
    "nyff.topo",
    "Dividir sua comida com os lobos para que eles te deixem em paz."
)

return node
