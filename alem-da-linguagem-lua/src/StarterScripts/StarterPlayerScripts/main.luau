-- Carregar gameData
_G.gameData = require(game.ReplicatedStorage.gameData)

-- Dependências
local Tile = require(game.ReplicatedStorage.tile)
local growthManager = require(game.ReplicatedStorage.growthManager)

-- Serviços
local RunService = game:GetService("RunService")

-- Hack para GetChildren não retornar uma tabela vazia
local tileFolder = game.Workspace.Tiles
tileFolder:WaitForChild("Tile")

-- Criar objetos Tile
local tilesChildren = tileFolder:GetChildren()
for _, tileInstance in tilesChildren do
	local tile = Tile:new(tileInstance)
	table.insert(_G.gameData.tiles, tile)
end

-- Criar loop pro growthManager com delta time
RunService.Heartbeat:Connect(function(deltaTime)
	growthManager:run(deltaTime)
end)