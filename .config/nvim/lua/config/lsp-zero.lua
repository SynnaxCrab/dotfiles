local lsp_zero = require('lsp-zero')

lsp_zero.extend_lspconfig()

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
local cmp_format = lsp_zero.cmp_format({ details = true })

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  preselect = 'none',
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),

  formatting = cmp_format,
})
