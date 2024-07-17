-- Constantes
local ID = "shorlak.voltar"

-- Dependências
local Node = require("node")

-- Criar node
local node = Node:new(ID) ---@type Node
node.description = "Você decide voltar mas todo esse calor te deixou confuso e perdido!" ..
" Sem falar que a sede está insuportável."

-- Adicionar choices
node:addChoice(
    "shorlak.avancar",
    "Ignorar o calor e continuar avançando."
)
node:addChoice(
    "shorlak.start",
    "Voltar para o ponto incial do deserto."
)
node:addChoice(
    "shorlak.figura_misteriosa",
    "Seguir figura misteriosa no horizonte!",
    function()
        -- 50% de chance de ver uma miragem!
        return math.random() > 0.5
    end
)

return node
