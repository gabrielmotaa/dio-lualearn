local growthManager = {}

local growthChancePerSecond = 0.1


function growthManager:run(deltaTime)
	local tiles = _G.gameData.tiles
	for _, tile in tiles do
		-- Ignorar tiles completos
		if tile:isComplete() then
			continue
		end
		
		-- Calcular chance
		local chance = growthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end
		
		-- Crescer
		tile:setStage(tile.stage + 1)
	end
end

return growthManager
