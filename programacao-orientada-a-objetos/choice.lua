local class = require("libs.middleclass")

--- @class Choice
local Choice = class("Choice")

--- Configura uma instância de 'Choice' para middleclass.
--- @param destination string
--- @param description string
--- @param condition fun(string):boolean
--- @param routine function
function Choice:initialize(destination, description, condition, routine)
  self.destination = destination
  self.description = description
  self.condition = condition
  self.routine = routine
end

--- Retorna se a escolha tem uma condição a ser executada.
--- @return boolean
function Choice:hasCondition()
  return self.condition ~= nil
end

--- Executa a função de condição e retorna se ela foi autorizada.
--- @return boolean
function Choice:runCondition()
  if self.condition ~= nil and type(self.condition) == "function" then
    return self.condition()
  end
  return true
end

--- Executa a rotina dessa escolha, caso haja uma.
function Choice:runRoutine()
  if self.routine ~= nil and type(self.routine) == "function" then
    self.routine()
  end
end

return Choice
