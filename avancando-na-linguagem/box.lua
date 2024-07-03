local box = {}

box.width = 88
box.padding = 1
box.chars = {
  top_left = "┌",
  top_right = "┐",
  bottom_left = "└",
  bottom_right = "┘",
  horizontal = "─",
  vertical = "│",
  divider = "╌",
}

--- Centraliza um texto para um determinado comprimento.
--- @param text string
--- @param width number
--- @return string
local function center_text(text, width)
  if utf8.len(text) >= width then
    return text
  end

  local margin = width - utf8.len(text)
  local left_pad = margin // 2
  local right_pad = margin - left_pad
  return string.rep(" ", left_pad) .. text .. string.rep(" ", right_pad)
end

--- Faz o padding de um texto para ficar alinhado à esquerda.
--- @param text string
--- @param width number
--- @return string
local function left_text(text, width)
  local right_pad = width - utf8.len(text)
  return text .. string.rep(" ", right_pad)
end

--- Faz o padding de um text para ficar alinhado à direita.
--- @param text string
--- @param width number
--- @return string
local function right_text(text, width)
  local left_pad = width - utf8.len(text)
  return string.rep(" ", left_pad) .. text
end

local formatters = {
  center = center_text,
  left = left_text,
  right = right_text,
}

local colors = {
  red = "\27[31m",
  green = "\27[32m",
  yellow = "\27[33m",
  blue = "\27[34m"
}

--- @param bold? boolean
--- @return string
function box.text(str, pos, color, bold)
  pos = pos or "left"
  color = colors[color]

  -- Considerar o padding + chars de borda
  local limit_length = box.width - 2 - 2 * box.padding
  if utf8.len(str) > limit_length then
    error(string.format(
      "texto não pode ser maior que %d, foi: %d",
      limit_length,
      utf8.len(str)
      ), 2)
  end

  -- Mesmo caso de cima
  str = formatters[pos](str, box.width - 2 - 2 * box.padding)
  local need_reset = false

  if color then
    str = color .. str
    need_reset = true
  end

  if bold then
    str = "\27[1m" .. str
    need_reset = true
  end

  if need_reset then
    str = str .. "\27[0m"
  end

  str = string.rep(" ", box.padding) .. str .. string.rep(" ", box.padding)

  return str
end

--- Cria um divisor para ser utilizado em uma caixa.
--- @return string
function box.divider()
  -- Considerar os 2 chars de borda
  return string.rep(box.chars.divider, box.width - 2)
end

--- Renderiza uma caixa para ser impressa.
--- @param contents string[]
--- @return string
function box.render_box(contents)
  local box_contents = {}
  local center_width = box.width - 2

  table.insert(
    box_contents,
    string.format(
        "%s%s%s",
        box.chars.top_left,
        string.rep(box.chars.horizontal, center_width),
        box.chars.top_right
    )
  )

  for _, content in ipairs(contents) do
    table.insert(box_contents, box.chars.vertical..content..box.chars.vertical)
  end

  table.insert(
    box_contents,
    string.format(
        "%s%s%s",
        box.chars.bottom_left,
        string.rep(box.chars.horizontal, center_width),
        box.chars.bottom_right
    )
  )

  return table.concat(box_contents, "\n")
end

return box
