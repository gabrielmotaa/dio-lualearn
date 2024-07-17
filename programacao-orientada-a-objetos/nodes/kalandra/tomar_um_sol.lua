-- Constantes
local ID = "kalandra.tomar_um_sol"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Fim da aventura"
node.gameWon = true
node.description = "Você ficou por mais algumas horas na praia e descansou bastante. Quando acordou, decidiu voltar para casa."

return node
