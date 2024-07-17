local utils = {}

--- Detecta se o script está rodando no Windows.
--- @return boolean
local function isWindows()
  return type(package) == "table" and type(package.config) == "string" and package.config:sub(1,1) == "\\"
end

--- Utilitário para limpar o terminal.
function utils.clearScreen()
  if isWindows() then
    os.execute("cls")
  else
    os.execute("clear")
  end
end

--- Renderiza um banner de Game Over.
--- @return string
function utils.getGenericGameOverHeader()
  return [[%{red}
 ▄▄ •  ▄▄▄· • ▌ ▄ ·. ▄▄▄ .         ▌ ▐·▄▄▄ .▄▄▄  
▐█ ▀ ▪▐█ ▀█ ·██ ▐███▪▀▄.▀·   ▄█▀▄ ▪█·█▌▀▄.▀·▀▄ █·
▄█ ▀█▄▄█▀▀█ ▐█ ▌▐▌▐█·▐▀▀▪▄  ▐█▌.▐▌▐█▐█•▐▀▀▪▄▐▀▀▄ 
▐█▄▪▐█▐█ ▪▐▌██ ██▌▐█▌▐█▄▄▌  ▐█▌.▐▌ ███ ▐█▄▄▌▐█•█▌
·▀▀▀▀  ▀  ▀ ▀▀  █▪▀▀▀ ▀▀▀    ▀█▄▀▪. ▀   ▀▀▀ .▀  ▀
]]
end

return utils
