local colors = { 'monokai', 'rose-pine', 'gruvbox' }

local randomIndex = math.random(#colors)
local color = colors[randomIndex]
vim.cmd.colorscheme(color)
