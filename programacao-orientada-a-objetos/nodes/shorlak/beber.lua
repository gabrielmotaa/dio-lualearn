-- Constantes
local ID = "shorlak.beber"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Você dá um mergulho no lago do oásis e mata sua sede!" ..
" Nunca você achou que a água fosse tão saborosa!"

-- Adicionar choices
node:addChoice(
  "nyff.start",
  "Usar a lâmpada mágica e sair daqui!",
  function()
    return game.hasMagicLamp and not game.thirsty
  end
)
node:addChoice(
  "shorlak.descansar",
  "Descansar na sombra e recuperar o folego."
)
node:addChoice(
  "shorlak.bau",
  "Investigar baú enterrado debaixo de uma árvore.",
  function()
    return game.hasMagicLamp == false
  end
)

return node
