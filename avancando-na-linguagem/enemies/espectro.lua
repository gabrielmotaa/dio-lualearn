local enemy = {}

enemy.name = "Espectro"
enemy.description = "Uma entidade etérea que causa medo e drena a energia vital de seus oponentes."
enemy.class = "Fantasma"
enemy.max_health = 5
enemy.health = 5
enemy.attack = 6
enemy.defense = 4
enemy.speed = 8

enemy.actions = {
  {
    name = "Toque Espectral",
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
        
        if enemy.health < 5 then
          enemy.health = math.min(5, enemy.health + damage)
        end

        message = string.format(
          "%s drena %d da energia vital de %s.",
          enemy.name, damage, player.name
        )
      else
        message = string.format(
          "%s tenta drenar energia vital de %s e falha!",
          enemy.name, player.name
        )
      end

      return message
    end
  },
  {
    name = "Grito Assombrador",
    requirement = nil,
    passive = false,
    skip_turn = false,
    execute = function(player)
      if player.speed == 0 then
        return string.format(
          "%s dá um grito assustador mas %s não tem mais velocidade!",
          enemy.name, player.name
        )
      end

      local speed_damage = math.min(math.random(1, 2), player.speed)
      player.speed = player.speed - speed_damage
      return string.format(
        "%s libera um grito assustador! %s perde %d de velocidade.",
        enemy.name, player.name, speed_damage
      )
    end
  },
  {
    name = "Aparição",
    requirement = nil,
    skip_turn = true,
    passive = false,
    execute = function(_)
      return string.format(
        "%s se torna intangível, evitando dano e pulando a rodada!",
        enemy.name
      )
    end
  },
}

return enemy
