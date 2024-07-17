-- Constantes
local ID = "nyff.lobos"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Banquete Canino"
node.gameOver = true
node.description = [[Os lobos te alcançaram e conseguiram achar comida, você! Foi um dia de sorte... para os lobos, claro.]]

return node
