-- Constantes
local ID = "shorlak.armadilha"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Ao investigar o baú com suas mãos, você sente um leve desconforto" ..
" nas mãos e a acaba perdendo a consciência. O baú tinha um dispositivo com veneno" ..
" que você acabou ativando."
node.gameOver = true

return node
