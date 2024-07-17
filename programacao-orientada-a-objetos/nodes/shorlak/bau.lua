-- Constantes
local ID = "shorlak.bau"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Ao investigar melhor o oásis você descobre uma forma incomum" ..
" nos pés de uma árvore. Ao escavar com suas as mãos você encontra um baú desgastado" ..
" pelo tempo."

-- Adicionar choices
node:addChoice(
  "shorlak.armadilha",
  "Procurar por alguma fechadura ou dispositivo no baú."
)
node:addChoice(
  "shorlak.lampada",
  "Chutar o báu e tentar quebrar ele.",
  nil,
  function()
    game.hasMagicLamp = true
  end
)

return node
