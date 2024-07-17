-- Constantes
local ID = "nyff.topo"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description =
[[Ufa, os lobos foram embora. Depois de muito esforço você chega no topo, e vê uma vista incrível, que aventura!

No topo da montanha você encontra um baú contendo uma chave de ouro, alguém deve ter a esquecido aqui.]]

-- Adicionar choices
node:addChoice(
    "kalandra.start",
    "Pegar a chave e seguir para a praia de Kalandra! Qualquer coisa pra sair desse frio...",
    nil,
    function()
        game.hasKey = true
    end
)

return node
