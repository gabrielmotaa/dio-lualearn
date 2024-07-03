local player = {}

player.name = "Lyria"
player.description = "Uma ladina ágil e sorrateira, mestre em ataques furtivos e evasão."
player.class = "Ladina"
player.max_health = 7
player.health = 7
player.attack = 5
player.defense = 4
player.speed = 8

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
    name = "Golpe Sorrateiro",
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
          "%s golpeia %s e causa %d de dano.",
          player.name, enemy.name, damage
        )
      else
        message = string.format(
          "%s tenta golpear %s e falha!",
          player.name, enemy.name
        )
      end

      return message
    end,
  },
  {
    -- Lyria usa sua velocidade para se afastar do perigo, aumentando temporariamente sua chance de evasão.
    name = "Fuga Ágil",
    requirement = function() return math.random(10) < player.speed end,
    skip_turn = true,
    passive = false,
    execute = function(_)
      return string.format(
        "%s usa sua fuga ágil, evitando dano e pulando a rodada!",
        player.name
      )
    end,
  },
}

return player
