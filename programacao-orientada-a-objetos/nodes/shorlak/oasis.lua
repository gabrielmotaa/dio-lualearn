-- Constantes
local ID = "shorlak.oasis"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Você chegou no oasis!"

-- Adicionar choices
node:addChoice(
  "shorlak.beber",
  "Matar a sede bebendo a água do oasis.",
  function()
    return game.thirsty
  end
)
node:addChoice(
  "shorlak.descansar",
  "Descansar na sombra e recuperar o folego.",
  nil,
  function()
    game.thirsty = true
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
