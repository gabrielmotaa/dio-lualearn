local ID = "start"

local Node = require("node")

local node = Node:new(ID) --- @type Node
node.title = "Uma nova aventura"
node.description = "Em uma bela manhã ensolarada você acorda e se prepara para " ..
"embarcar em uma nova aventura, mas uma importante decisão deve ser tomada, Para " ..
"onde você vai?"
node.header = [[%{magenta}
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█ ▄▄▀█ ▄▀█▀███▀█ ▄▄█ ▄▄▀█▄ ▄█ ██ █ ▄▄▀█ ▄▄████
█ ▀▀ █ █ ██ ▀ ██ ▄▄█ ██ ██ ██ ██ █ ▀▀▄█ ▄▄████
█ ██ █▄▄████▄███▄▄▄█▄██▄██▄███▄▄▄█▄█▄▄█▄▄▄████
██████████████████████████████████████████████
███ ▄▄▄ ██▄██ ▄▀▄ █ ██ █ ██ ▄▄▀█▄ ▄█▀▄▄▀█ ▄▄▀█
███▄▄▄▀▀██ ▄█ █▄█ █ ██ █ ██ ▀▀ ██ ██ ██ █ ▀▀▄█
███ ▀▀▀ █▄▄▄█▄███▄██▄▄▄█▄▄█▄██▄██▄███▄▄██▄█▄▄█
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
]]

node:addChoice(
  "kalandra.start",
  "Para a praia ensolarada de Kalandra"
)
node:addChoice(
  "nyff.start",
  "Para as montanhas geladas de Nyff"
)
node:addChoice(
  "shorlak.start",
  "Para as dunas imperdoáveis de Shorlak"
)

return node
