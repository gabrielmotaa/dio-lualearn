-- Constantes
local ID = "shorlak.lampada"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Você chuta o baú com todas as suas forças e lascas de madeira voam" ..
" para todos os lados. No meio dos destroços você encontra uma lâmpada mágica e um" ..
" bilhete com o dizeres:\n\n" ..
"Para quem não suporta o calor, ofereço uma viagem ao frio! Esfregue a lâmpada!"

node.header = [[%{yellow}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣷⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡟⢿⣿⣿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣶⡄⠀⠀⠀⠀⠀⠹⢿⣷⣦⣍⡁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣅⡀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣦⠀
⠀⣴⠿⠿⢷⡄⠀⠀⠴⠿⠿⠿⠿⠿⠿⠆⠀⠀⠀⠀⣀⣤⣴⣿⣿⡿⠟
⠘⣿⡀⠀⠈⣿⣤⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⠿⠋⠀⠀
⠀⠙⢷⣤⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀
⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠛⠋⠉⠻⠿⣿⣿⣿⣿⣿⣿⠿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣼⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡆
]]

-- Adicionar choices
node:addChoice(
  "shorlak.beber",
  "Até quero ir, mas tenho que primeiro matar minha sede bebendo a água do oasis.",
  function()
    return game.thirsty == true
  end
)
node:addChoice(
  "shorlak.descansar",
  "Quem sabe mais tarde, quero descansar na sombra e recuperar o folego."
)
node:addChoice(
  "nyff.start",
  "Usar a lâmpada mágica e sair daqui!",
  function()
    return game.hasMagicLamp and not game.thirsty
  end
)

return node
