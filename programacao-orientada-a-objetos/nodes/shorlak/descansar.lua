-- Constantes
local ID = "shorlak.descansar"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Você decide descansar, afinal ninguém é de ferro. Mas quanto" ..
" tempo você deve ficar por aqui?"

-- Adicionar choices
node:addChoice(
  "shorlak.beber",
  "Matar a sede bebendo a água do oasis.",
  function()
    return game.thirsty == true
  end,
  function()
    game.thirsty = false
  end
)
node:addChoice(
  "nyff.start",
  "Usar a lâmpada mágica e sair daqui!",
  function()
    return game.hasMagicLamp and not game.thirsty
  end
)
node:addChoice(
  "shorlak.bau",
  "Investigar baú enterrado debaixo de uma árvore.",
  function()
    return game.hasMagicLamp == false
  end
)

return node
