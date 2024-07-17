-- Constantes
local ID = "shorlak.figura_misteriosa"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "No horizonte você enxergou uma figura misteriosa... Uma pessoa!" ..
" A chance de encontrar alguém no deserto poderia salvar sua vida. Você decidiu seguir" ..
" a figura até seu corpo não aguentar mais e cair no chão. Infelizmente, o deserto te enganou com uma miragem."
node.gameOver = true

return node
