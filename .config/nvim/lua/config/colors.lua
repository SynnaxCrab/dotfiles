local colors = { 'monokai', 'rose-pine', 'gruvbox', 'tokyonight-moon' }

local randomIndex = math.random(#colors)
local color = colors[randomIndex]
vim.cmd.colorscheme(color)
