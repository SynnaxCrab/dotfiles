local lsp_zero = require('lsp-zero')

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
  lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'eslint',
    'rust_analyzer',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  preselect = 'none',
  window = {
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
    },
    documentation = {
      max_height = 50,
      max_width = 60,
      border = 'rounded',
      col_offset = 0,
      side_padding = 1,
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
      zindex = 1001
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }),
})
