local enemy = {}

enemy.name = "Troll"
enemy.description = "Um monstro grande e forte, com uma regeneração rápida, mas lento em combate."
enemy.class = "Bruto"
enemy.max_health = 10
enemy.health = 10
enemy.attack = 8
enemy.defense = 6
enemy.speed = 2

enemy.actions = {
  {
    name = "Pancada Brutal",
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
          "%s atinge %s com uma pancada, tirando %d de sua vida.",
          enemy.name, player.name, damage
        )
      else
        message = string.format(
          "%s tenta atingir %s com uma pancada e falha!",
          enemy.name, player.name
        )
      end

      return message
    end,
  },
  {
    name = "Regeneração",
    requirement = function() return enemy.health < 10 end,
    skip_turn = false,
    passive = true,
    execute = function(_)
      local regen_points = math.min(10 - enemy.health, math.random(5))
      enemy.health = enemy.health + regen_points
      return string.format(
        "%s usou sua habilidade de regeneração, ganhando %d de vida.",
        enemy.name, regen_points
      )
    end,
  },
  {
    name = "Rugido Ameaçador",
    requirement = nil,
    skip_turn = false,
    passive = false,
    execute = function(player)
      local message
      if player.defense > 0 then
        local defense_damage = math.min(math.random(2), player.defense)
        player.defense = player.defense - defense_damage
        message = string.format(
          "%s rugiu, intimidando %s e fazendo sua defesa cair em %d.",
          enemy.name, player.name, defense_damage
        )
      else
        message = string.format(
          "%s rugiu, intimidando %s mas ele já está sem defesas!"
        )
      end
      return message
    end,
  },
}

return enemy
