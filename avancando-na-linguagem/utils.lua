local box = require("box")

local utils = {}

--- Concatena as tabelas com contents de caixa.
--- @param table1 string[]
--- @param table2 string[]
--- @param divisor? boolean
function utils.concat_content_tables(table1, table2, divisor)
  divisor = (divisor ~= false)
  if divisor then
    table.insert(table1, box.divider())
  end
  for _, value in ipairs(table2) do
    table.insert(table1, value)
  end
end

--- Coleta um valor numérico do usuário.
--- @param message string
--- @return number
function utils.prompt(message)
  local choice = nil

  repeat
    io.write(message)
    choice = tonumber(io.read("*l"))
  until choice

  return choice
end

--- Imprime a caixa de introdução do jogo.
--- @param players table
function utils.print_header(players)
  local contents = {
    box.text("SIMULADOR DE BATALHA", "center", "yellow", true),
    box.text("    /|   ", "center"),
    box.text("   |\\|   ", "center"),
    box.text("   |||   ", "center"),
    box.text("   |||   ", "center"),
    box.text("   |||   ", "center"),
    box.text("   |||   ", "center"),
    box.text("   |||   ", "center"),
    box.text("   |||   ", "center"),
    box.text("~-[{o}]-~", "center"),
    box.text("   |/|   ", "center"),
    box.text("   |/|   ", "center"),
    box.text("   `0'   ", "center"),
    box.text("Você empunha sua espada e se prepara para lutar.", "center"),
    box.text("É hora da batalha!", "center"),
    box.divider(),
    box.text("Personagens disponíveis:", "left", nil, true),
  }

  for i, player in ipairs(players) do
    table.insert(contents, box.text(string.format(
      "%d. %-6s %-17s  %2d Ataque | %2d Defesa | %2d Velocidade | %2d Vida",
      i, player.name, "("..player.class..")", player.attack,
      player.defense, player.speed, player.max_health
    )))
  end

  print(box.render_box(contents))
end

--- Gera linhas para uma caixa com informações do personagem.
--- @param character table
--- @param title string
--- @param title_color string
--- @param show_attr? boolean
--- @return string[]
local function render_character(character, title, title_color, show_attr)
  local contents = {
    box.text(title, "center", nil, true),
    box.text(""),
    box.text(character.name, "center", title_color, true),
    box.text("("..character.class..")", "center"),
    box.text(""),
    box.text(character.description, "center"),
  }

  if show_attr then
    local aditional_content = {
      box.text(""),
      box.text("Atributos", "center", nil, true),
      box.text(string.format("Vida:       %2d", character.max_health), "center"),
      box.text(string.format("Ataque:     %2d", character.attack), "center"),
      box.text(string.format("Defesa:     %2d", character.defense), "center"),
      box.text(string.format("Velocidade: %2d", character.speed), "center"),
    }
    for _, content in ipairs(aditional_content) do
      table.insert(contents, content)
    end
  end

  return contents
end

--- comment Gera linhas para uma caixa sobre jogador e sobre inimigo.
--- @param player table
--- @param enemy table
--- @return table
function utils.render_characters(player, enemy)
  local contents = {}

  for _, content in ipairs(render_character(player, "VOCÊ É", "blue")) do
    table.insert(contents, content)
  end

  table.insert(contents, box.divider())

  for _, content in ipairs(render_character(enemy, "LUTARÁ COM", "yellow", true)) do
    table.insert(contents, content)
  end

  return contents
end

--- Pega ações válidas do personagem.
--- @param character table
--- @return table
function utils.get_valid_actions(character)
  local valid_actions = {}

  for _, action in ipairs(character.actions) do
    local requirement = action.requirement
    local is_valid = requirement == nil or requirement()
    if is_valid then
      table.insert(valid_actions, action)
    end
  end

  return valid_actions
end

--- Gera linhas para uma caixa com ações válidas.
--- @param valid_actions table
--- @return string[]
function utils.render_actions(valid_actions)
  local contents = {
    box.text("Ações disponíveis", "center", nil, true),
  }

  for i, action in ipairs(valid_actions) do
    table.insert(contents, box.text(string.format("%d. %s", i, action.name)))
  end

  return contents
end

--- Gera linhas para uma caixa com dados do turno.
--- @param turn_number number
--- @param enemy_message? string
--- @param player_message? string
--- @return table
function utils.render_turn(turn_number, enemy_message, player_message)
  local contents = {
    box.text("RODADA "..turn_number, "center", nil, true),
    box.text(""),
  }

  if enemy_message then
    table.insert(contents, box.text(enemy_message, "left", "yellow"))
  end

  if player_message then
    table.insert(contents, box.text(player_message, "right", "blue"))
  end

  return contents
end

--- Gera uma barra de progresso com a vida do personagem.
--- @param character table
--- @return string
local function render_lifebar(character)
  return string.rep("⬜️", character.health) .. string.rep("⬛️", math.min(10 - character.health, 10))
end

--- Gera linhas para uma caixa com a vida dos personagens.
--- @param player table
--- @param enemy table
--- @return string[]
function utils.render_life(player, enemy)
  local contents = {
    box.text("Vida restante", "center", nil, true),
    box.text(""),
    box.text(string.format(
      "%10s: %s", player.name, render_lifebar(player)
    ), "center"),
    box.text(string.format(
      "%10s: %s", enemy.name, render_lifebar(enemy)
    ), "center"),
  }

  return contents
end

--- Imprime uma caixa com a mensagem final do jogo.
--- @param turn number
--- @param message string
--- @param color string
function utils.print_ending(turn, message, color)
  local contents = {
    box.text(message, "center", color, true),
    box.text(""),
  }

  local message
  if turn > 1 then
    message = string.format("O jogo durou %d rodadas!", turn)
  else
    message = "O jogo durou 1 rodada! Quais são as chances?"
  end

  table.insert(contents, box.text(message, "center"))

  print(box.render_box(contents))
end

return utils
