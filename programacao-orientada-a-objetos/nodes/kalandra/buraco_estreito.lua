-- Constantes
local ID = "kalandra.buraco_estreito"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Calabouço de Kalandra"
node.description = [[Você chegou até a porta dourada! Ela é imponente e reluzente, e emana um poder incrível de alguma forma.
Você nota uma fechadura de ouro, que parece pedir uma chave equivalente.]]

-- Adicionar choices
node:addChoice(
    "kalandra.sucesso",
    "Usar a chave de ouro",
    function()
        return game.hasKey == true
    end
)
node:addChoice(
    "kalandra.start",
    "Voltar para a praia de Kalandra."
)
node:addChoice(
    "kalandra.armadilha",
    "Tentar abrir a porta à força."
)

return node
