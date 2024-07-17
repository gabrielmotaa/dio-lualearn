-- Constantes
local ID = "kalandra.mergulho"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Durante seu mergulho você encontra um navio pirata submerso, a poucos metros de profundidade. Algumas bolhas de ar saem de dentro dele."

-- Adicionar choices
node:addChoice(
    "kalandra.kraken_game_over",
    "Tomar um ar e mergulhar novamente para dar uma olhada mais de perto."
)
node:addChoice(
    "kalandra.kraken_game_over",
    "Ignorar o navio e continuar no mar aproveitando o dia."
)
node:addChoice(
    "kalandra.start",
    "Sinistro! Sair do mar e voltar para a praia.",
    nil,
    function()
        game.thalassophobic = true
    end
)

return node
