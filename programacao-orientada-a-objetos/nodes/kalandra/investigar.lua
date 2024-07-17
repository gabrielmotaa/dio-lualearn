-- Constantes
local ID = "kalandra.investigar"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.title = "Praia de Kalandra"
node.description = "Você explora a região e encontra uma trilha que leva a uma inóspita caverna, que também parece vazia e abandonada. Nas paredes da caverna existem escrituras sobre a Lenda do Kraken, e desenhos que te dão a entender que existe uma magia que pode derrota-lo."

-- Adicionar choices
node:addChoice(
    "kalandra.tomar_um_sol",
    "Kraken? Magia? O que é isso, um filme de aventura? Deixar essa bobagem de lado e voltar para a praia pra tomar um sol."
)
node:addChoice(
    "kalandra.explorar_caverna",
    "Incrível! Explorar a caverna mais a fundo para decifrar seus segredos."
)
node:addChoice(
    "kalandra.kraken_game_over",
    "Todo esse pavor por causa de um polvo? Voltar para a praia e dar um mergulho no mar pra provar que isso não existe."
)

return node
