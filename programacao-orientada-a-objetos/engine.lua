local class = require("libs.middleclass")
local ansicolors = require("libs.ansicolors")
local nodeLoader = require("node_loader")
local utils = require("utils")

--- @class Engine
local Engine = class("Engine")

--- Wrapper de ansicolors para print.
--- @param ... any
local function print(...)
  _G.print(ansicolors(...))
end

--- Wrapper de ansicolors para io.write
--- @param ... any
local function iowrite(...)
  io.write(ansicolors(...))
end

--- Inicia o loop principal do jogo.
function Engine:runMainLoop()

  while not game.isOver do
    -- Pegar node ativo
    local node = game.activeNode

    -- Limpar o terminal
    utils.clearScreen()

    -- Printar o node
    self:printNode(node)

    -- Processar fim do jogo
    if node.gameOver or node.gameWon then
      if node.gameOver then
        print()
        print("%{red}===== Game Over =====")
        print()
      else
        print()
        print("%{green}===== Você venceu o jogo! =====")
        print()
      end
      os.exit()
    end

    -- Obter escolhas válidas
    local validChoices = self:getValidChoices(node)
    if #validChoices == 0 then
      warn("Nenhuma escolha é válida para o node " .. node.id)
      os.exit(1)
    end

    -- Mostrar escolhas
    self:showChoices(validChoices)

    -- Perguntar para o usuário
    local choiceIndex = self:askForInput(#validChoices)
    local choice = validChoices[choiceIndex]

    choice:runRoutine()

    local destinationId = choice.destination
    local destinationNode = nodeLoader.getNode(destinationId)
    game.activeNode = destinationNode

  end
end

--- Cria um separador com o título provido.
--- @param title string|nil
--- @return string
local function createSeparator(title)
  local width = 50
  local result = "-----"
  local length = #result

  if title then
    result = string.format("%s[%%{yellow}%s%%{reset}]", result, title:upper())
    length = length + 2 + #title
  end

  result = result .. string.rep("-", width - length)

  return result
end

--- Faz o print de um node, com seu header, título e descrição.
--- @param node Node
function Engine:printNode(node)
  if node.header then
    print(node.header)
  elseif node.gameOver then
    print(utils.getGenericGameOverHeader())
  end
  print(createSeparator(node.title))
  print(node.description)
  print(createSeparator())
end

--- Coleta escolhas válidas de um node.
--- @param node Node
--- @return Choice[]
function Engine:getValidChoices(node)
  local result = {} --- @type Choice[]
  for _, choice in pairs(node.choices) do
    if (not choice:hasCondition()) or (choice:hasCondition() and choice:runCondition()) then
      table.insert(result, choice)
    end
  end
  return result
end

--- Faz o print de escolhas fornecidas.
--- @param choices Choice[]
function Engine:showChoices(choices)
  for i, choice in pairs(choices) do
    print(string.format("%d) %%{yellow}%s", i, choice.description))
  end
end

--- Coleta o input de um usuário, com validação.
--- @param amount number
--- @return number
function Engine:askForInput(amount)
  while true do
    iowrite("> ")
    local answerStr = io.read()
    local answer = tonumber(answerStr)
    local isAnswerValid = answer ~= nil and answer >= 1 and answer <= amount
    if isAnswerValid then
      return answer
    end
    print("%{red}Resposta inválida, tente novamente.")
  end
end

return Engine
