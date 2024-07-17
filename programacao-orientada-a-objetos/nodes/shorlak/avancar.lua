-- Constantes
local ID = "shorlak.avancar"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "No meio desse mar de amarelo você encontra uma rocha e decide" ..
" descansar em sua sombra. A sede e o calor é tanta que não percebeu que uma cobra" ..
" da areia se aproximava e acabou tomando uma mordida fatal!"
node.gameOver = true

return node
