-- Constantes
local ID = "kalandra.armadilha"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Ops"
node.gameOver = true
node.description = "Você sem querer ativou uma armadilha do calabouço, e não resistiu."

return node
