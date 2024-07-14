local inspect = require("libs.inspect")

local GameData = require("game_data")
local Engine = require("engine")
local nodeLoader = require("node_loader")

warn("@on")

local gameData = GameData:new()  --- @type GameData
_G.game = gameData

nodeLoader.loadNodes()
game.activeNode = nodeLoader.getInitialNode()

if nodeLoader.hasErrors() then
  print("Encontrou erros no NodeLoader, abortando execução!")
  os.exit(1)
end

local engine = Engine:new()
engine:runMainLoop()
