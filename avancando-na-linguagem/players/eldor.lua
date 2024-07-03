local player = {}

player.name = "Eldor"
player.description = "Um mago que combina feitiçaria com combate corpo a corpo, usando uma vara encantada."
player.class = "Mago de Batalha"
player.max_health = 6
player.health = 6
player.attack = 7
player.defense = 5
player.speed = 6

player.potions = 3

player.actions = {
  {
    name = "Tomar poção",
    requirement = function() return player.potions > 0 end,
    skip_turn = false,
    passive = true,
    execute = function(_)
      local message

      local current_health = player.health
      local raw_regen_points = math.random(player.max_health // 2, player.max_health)
      local regen_points = math.min(raw_regen_points, player.max_health - current_health)

      if regen_points > 0 then
        player.health = player.health + regen_points
        message = string.format(
          "%s tomou uma poção e recuperou %d de vida.",
          player.name, regen_points
        )

      else
        message = string.format(
          "%s tomou uma poção de vida com a vida cheia!",
          player.name
        )
      end

      player.potions = player.potions - 1
      return message
    end
  },
  {
    name = "Chama Arcana",
    requirement = nil,
    skip_turn = false,
    passive = false,
    execute = function(enemy)
      local message

      local success_change = player.speed / enemy.speed
      local success = math.random() < success_change

      if success then
        local raw_damage = player.attack - math.random() * enemy.defense
        local damage = math.min(math.max(1, math.ceil(raw_damage)), enemy.health)
        enemy.health = enemy.health - damage
        message = string.format(
          "%s joga a chama em %s e causa %d de dano.",
          player.name, enemy.name, damage
        )
      else
        message = string.format(
          "%s tenta jogar a chama em %s e falha!",
          player.name, enemy.name
        )
      end

      return message
    end,
  },
  {
    name = "Barreira Mágica",
    requirement = function() return player.defense < 8 end,
    skip_turn = false,
    passive = true,
    execute = function()
      player.defense = player.defense + 1
      return string.format("%s aumenta sua defesa em 1 ponto!", player.name)
    end,
  },
}

return player
