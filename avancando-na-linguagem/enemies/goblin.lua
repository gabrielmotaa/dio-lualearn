local enemy = {}

enemy.name = "Goblin"
enemy.description = "Uma criatura pequena e astuta, que ataca em bando e utiliza armas improvisadas."
enemy.class = "Monstro"
enemy.max_health = 4
enemy.health = 4
enemy.attack = 5
enemy.defense = 3
enemy.speed = 7

enemy.actions = {
  {
    name = "Facada Rápida",
    requirement = nil,
    skip_turn = false,
    passive = false,
    execute = function(player)
      local message

      local success_change = enemy.speed / player.speed
      local success = math.random() < success_change

      if success then
        local raw_damage = enemy.attack - math.random() * player.defense
        local damage = math.max(1, math.ceil(raw_damage))
        player.health = player.health - damage
        message = string.format(
          "%s atinge %s com uma facada, tirando %d de sua vida.",
          enemy.name, player.name, damage
        )
      else
        message = string.format(
          "%s tenta atingir %s com uma facada e falha!",
          enemy.name, player.name
        )
      end

      return message
    end,
  },
  {
    name = "Arremesso de Pedra",
    requirement = nil,
    skip_turn = false,
    passive = false,
    execute = function(player)
      local message

      local success_change = 0.7
      local success = math.random() < success_change

      if success then
        local raw_damage = enemy.attack - math.random() * player.defense
        local damage = math.max(1, math.ceil(raw_damage))
        player.health = player.health - damage
        message = string.format(
          "%s arremessa uma pedra em %s, tirando %d de sua vida.",
          enemy.name, player.name, damage
        )
      else
        message = string.format(
          "%s tenta arremessar uma pedra em %s e falha!",
          enemy.name, player.name
        )
      end

      return message
    end,
  },
  {
    name = "Esquiva",
    requirement = nil,
    skip_turn = true,
    passive = false,
    execute = function(_)
      return string.format(
        "%s usa esquiva, evitando dano e pulando a rodada!",
        enemy.name
      )
    end,
  },
}

return enemy
