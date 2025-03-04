local nodeLoader = {}

local nodeDictionary = {} --- @type table<string, Node>
local initialNode = nil   --- @type Node
local hasErrors = false

--- Carrega um node a partir de um arquivo lua.
--- @param path string
--- @return Node|nil
local function loadNode(path)
  local success, nodeOrErr = pcall(function()
    return require(path)
  end)
  if not success then
    warn("Falha ao carregar o node " .. path .. ". O arquivo não foi encontrado.")
    hasErrors = true
    return nil
  end
  local node = nodeOrErr --- @type Node
  if nodeDictionary[node.id] ~= nil then
    warn("Falha ao carregar o node " .. path .. ". O ID " .. node.id .. " já está registrado.")
    hasErrors = true
    return nil
  end
  nodeDictionary[node.id] = node
  return node
end

--- Carrega nodes a partir de escolhas de outro node.
--- @param parentNode Node
local function loadNodesFromChoices(parentNode)
  for _, choice in pairs(parentNode.choices) do
    local destinationId = choice.destination
    if not nodeDictionary[destinationId] then
      local childNode = loadNode("nodes." .. destinationId)
      if childNode then
        loadNodesFromChoices(childNode)
      end
    end
  end
end

--- Carrega todos os nodes internamente.
function nodeLoader.loadNodes()
  nodeDictionary = {}

  -- Carregar node incial
  initialNode = require("nodes.start")
  nodeDictionary[initialNode.id] = initialNode

  -- Carregar nodes recursivamente
  loadNodesFromChoices(initialNode)

  -- Validar destinations
  for id, node in pairs(nodeDictionary) do
    for _, choice in pairs(node.choices) do
      local destinationId = choice.destination
      local destinationNode = nodeDictionary[destinationId]
      if destinationNode == nil then
        warn("Uma das escolhas do node " .. node.id ..
        " tem como destino de um node inexistente: " .. destinationId)
        hasErrors = true
      end
    end
  end
end

--- Retorna todos os nodes criados por esse script.
--- @return table<string, Node>
function nodeLoader.getNodes()
  return nodeDictionary
end


--- Retorna o Node associado com o ID.
--- @param nodeId string
--- @return Node
function nodeLoader.getNode(nodeId)
  return nodeDictionary[nodeId]
end

--- Retorna o node inicial do simulador.
--- @return Node
function nodeLoader.getInitialNode()
  return initialNode
end

--- Retorna se esse módulo encontrou erros durante sua execução.
--- @return boolean
function nodeLoader.hasErrors()
  return hasErrors
end

return nodeLoader
