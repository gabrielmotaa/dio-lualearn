local utils = require("utils")
local box = require("box")

local aurus = require("players.arus")
local lyria = require("players.lyria")
local eldor = require("players.eldor")
local players = {aurus, lyria, eldor}

local espectro = require("enemies.espectro")
local goblin = require("enemies.goblin")
local troll = require("enemies.troll")
local enemies = {espectro, goblin, troll}

utils.print_header(players)

local choice = nil
repeat
  choice = utils.prompt("Escolha seu personagem: ")
until choice >= 1 and choice <= #players

local player = players[choice]
local enemy = enemies[math.random(#enemies)]

local contents = {}

utils.concat_content_tables(
  contents,
  utils.render_characters(player, enemy), false
)

local turn = 0
while true do
  if player.health <= 0 and enemy.health <= 0 then
    print(box.render_box(contents))
    utils.print_ending(turn, "TODO MUNDO PERDEU 🤯️", "yellow")
  end

  if player.health <= 0 then
    print(box.render_box(contents))
    utils.print_ending(turn, "VOCÊ PERDEU 😭️", "red")
    break
  end

  if enemy.health <= 0 then
    print(box.render_box(contents))
    utils.print_ending(turn, "🥳️ VOCÊ GANHOU 🥳️", "green")
    break
  end

  turn = turn + 1
  local player_valid_actions = utils.get_valid_actions(player)

  utils.concat_content_tables(
    contents,
    utils.render_actions(player_valid_actions)
  )
  print(box.render_box(contents))
  contents = {}

  choice = nil
  repeat
    choice = utils.prompt("Escolha sua ação: ")
  until choice >= 1 and choice <= #player_valid_actions

  local player_action = player_valid_actions[choice]

  local enemy_valid_actions = utils.get_valid_actions(enemy)
  local enemy_action = enemy_valid_actions[math.random(#enemy_valid_actions)]

  if player_action.skip_turn then
    local enemy_message = nil
    if enemy_action.passive then
      enemy_message = enemy_action.execute(nil)
    end

    utils.concat_content_tables(
      contents,
      utils.render_turn(
        turn,
        enemy_message,
        player_action.execute(nil)
      ),
      false
    )

  elseif enemy_action.skip_turn then
    local player_message = nil
    if player_action.passive then
      player_message = player_action.execute(nil)
    end

    utils.concat_content_tables(
      contents,
      utils.render_turn(turn, enemy_action.execute(nil), player_message), false)
  else
    utils.concat_content_tables(
      contents,
      utils.render_turn(
        turn,
        enemy_action.execute(player),
        player_action.execute(enemy)
      ),
      false
    )
  end

  utils.concat_content_tables(contents, utils.render_life(player, enemy))
end
