-- Caracteres de desenho de caixas
-- https://en.wikipedia.org/wiki/Box-drawing_characters
local BOX_TOP <const> = "─"
local BOX_TOP_LEFT <const> = "┌"
local BOX_TOP_RIGHT <const> = "┐"
local BOX_MIDDLE_LEFT <const> = "│"
local BOX_MIDDLE_RIGHT <const> = "│"
local BOX_BOTTOM <const> = "─"
local BOX_BOTTOM_LEFT <const> = "└"
local BOX_BOTTOM_RIGHT <const> = "┘"

-- Comprimento da caixa
local BOX_WIDTH <const> = 56

-- Caracteres para barra de progresso
local PROGRESS_FILL_CHAR <const> = "⬛️"
local PROGRESS_EMPTY_CHAR <const> = "⬜️"

-- Valor máximo de atributos
local ATTRIBUTE_MAX_VALUE <const> = 10

--- Cria a linha que fica dentro da caixa.
local function draw_box_row(content, left_pad)
  content = string.rep(" ", left_pad) .. content
  local length = utf8.len(content)
  local pad_num = BOX_WIDTH - 2 - length
  return BOX_MIDDLE_LEFT .. content .. string.rep(" ", pad_num) .. BOX_MIDDLE_RIGHT
end

--- Desenha uma barra de progresso.
local function draw_progress_bar(attribute)
  local progress_bar = ""
  for i = 1, ATTRIBUTE_MAX_VALUE, 1 do
    if i <= attribute then
      progress_bar = progress_bar .. PROGRESS_FILL_CHAR
    else
      progress_bar = progress_bar .. PROGRESS_EMPTY_CHAR
    end
  end
  return progress_bar
end

-- Dados do Creeper
local name = "Creeper"
local emoji = "🧨️"
local description = "Criatura hostil, verde, sorrateira e explosiva"
local sound = "Tssss"
local spawnTime = "Noite"

local attack = 10
local defense = 2
local life = 4
local speed = 2
local inteligence = 4

-- Topo da caixa
print(BOX_TOP_LEFT .. string.rep(BOX_TOP, BOX_WIDTH - 2) .. BOX_TOP_RIGHT)
print(draw_box_row("", 0))

-- Meio da caixa
print(draw_box_row(name .. " " .. emoji, 4))
print(draw_box_row(description, 4))
print(draw_box_row("", 0))
print(draw_box_row("Som: " .. sound, 4))
print(draw_box_row("Horário de Spawn: " .. spawnTime, 4))
print(draw_box_row("", 0))
print(draw_box_row("Atributos:", 4))
print(draw_box_row("Ataque:       " .. draw_progress_bar(attack) , 8))
print(draw_box_row("Defesa:       " .. draw_progress_bar(defense) , 8))
print(draw_box_row("Vida:         " .. draw_progress_bar(life) , 8))
print(draw_box_row("Velocidade:   " .. draw_progress_bar(speed) , 8))
print(draw_box_row("Inteligência: " .. draw_progress_bar(inteligence), 8))

-- Fim da caixa
print(draw_box_row("", 0))
print(BOX_BOTTOM_LEFT .. string.rep(BOX_BOTTOM, BOX_WIDTH - 2) .. BOX_BOTTOM_RIGHT)
