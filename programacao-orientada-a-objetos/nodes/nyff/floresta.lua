-- Constantes
local ID = "nyff.floresta"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Nyffville"
node.description = [[Depois de muito andar você encontrou uma pequena e modesta vila no meio da floresta. Os Villagers te recebem com alegria! O banquete de hoje está garantido.

Depois de uma bela noite de sono, é hora de continuar a aventura. Um dos Villagers sugere que você siga a trilha que da a volta na montanha, pois é o caminho mais longo e também mais seguro.]]

-- Adicionar choices
node:addChoice(
    "nyff.trilha",
    "Seguir pela trilha que dá a volta na montanha."
)
node:addChoice(
    "nyff.escalar",
    "Queremos chegar no topo ainda hoje, vamos escalar a montanha!"
)

return node
