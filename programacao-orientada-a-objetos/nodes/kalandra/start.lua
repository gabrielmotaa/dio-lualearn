local ID = "kalandra.start"

local Node = require("node")

local node = Node:new(ID) --- @type Node
node.title = "Praias de Kalanga"
node.description = "As ondas dançam, a brisa voa, enquanto o Sol te acolhe " ..
"com um calor agradável, este lugar é tão belo como dizem as lendas. Mas " ..
"para a sua surpresa não tem mais ninguém aqui. Sua intuição diz que algo " ..
"está errado."
node.header = [[
%{green}_\/_          %{yellow}       |            %{green}    _\/_
%{green}/o\\          %{yellow}   \       /        %{green}    //o\
%{green} |            %{yellow}     .---.          %{green}      |
%{green}_|_______     %{yellow}--  /     \  --     %{green}______|__
%{cyan}         `~^~^~^~^~^~^~^~^~^~^~^~`
]]

node:addChoice(
    "kalandra.tomar_um_sol",
    "Aproveitar a praia deserta para descansar e pegar um sol."
)
node:addChoice(
    "kalandra.investigar",
    "Seguir sua intuição e investigar o desaparecimento das pessoas."
)
node:addChoice(
    "kalandra.mergulho",
    "Dar um mergulho no mar.",
    function()
        return game.medoDoMar ~= true
    end
)

return node
