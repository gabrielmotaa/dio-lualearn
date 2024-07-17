-- Constantes
local ID = "kalandra.explorar_caverna"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Calabouço de Kalandra"
node.description = "Você encontra um calabouço secreto que parece não ser visitado por centenas de anos. Você está de frente para um longo porém estreito corredor, e tudo de diz que existem armadilhas escondidas nesse lugar. Há uma porta dourada do outro lado desse corredor, mas também existem diversas passagens ao seu lado."

-- Adicionar choices
node:addChoice(
    "kalandra.armadilha",
    "Seguir pelo corredor, as armadilhas provavelmente não funcionam mais depois de tanto tempo."
)
node:addChoice(
    "kalandra.buraco_estreito",
    "Seguir pela esquerda por um estreito buraco na parede que parece levar até algum lugar."
)
node:addChoice(
    "kalandra.armadilha",
    "Puxar uma alavanca ao seu lado. É obviamente uma armadilha."
)

return node
