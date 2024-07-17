local ID = "shorlak.start"

local Node = require("node")

local node = Node:new(ID) --- @type Node
node.title = "Dunas de Shorlak"
node.description = "As dunas se estendem infinitamente, com colinas de areia dourada " ..
"sob um céu implacável. O calor é opressivo, e cada passo afunda os pés na areia escaldante." ..
" À medida que você avança, a sede aumenta e a sensação de desorientação se intensifica."

node.header = [[
           %{green},,                               %{yellow}.-.
          %{green}|| |                               %{yellow}) )
          %{green}|| |   ,                          %{yellow}'-'
          %{green}|| |  | |
          %{green}|| '--' |
    %{green},,    || .----'
   %{green}|| |   || |
   %{green}|  '---'| |
   %{green}'------.| |                                  %{green}_____
   %{green}((_))  || |      %{green}(  _                       %{green}/ /|\ \
   %{green}(o o)  || |      %{green}))("),                    %{green}| | | | |
%{yellow}____%{green}\_/%{yellow}___%{green}||_|%{yellow}_____%{green}((__^_))%{yellow}____________________%{green}\_\|/_/%{yellow}__
]]

node:addChoice(
    "shorlak.oasis",
    "Procurar por um oásis para se hidratar."
)
node:addChoice(
    "shorlak.voltar",
    "Se for para passar calor, prefiro a praia! Ir para Kalandra!",
    function()
        return game.thirsty == false
    end,
    function()
        game.thirsty = true
    end
)
node:addChoice(
    "shorlak.avancar",
    "Ignorar o calor e continuar avançando.",
    nil,
    function()
        game.thirsty = true
    end
)

return node
