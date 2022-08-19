local api = vim.api
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


local function lsp_keymap(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', "<cmd>Telescope lsp_declarations<CR>", bufopts)
  vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<CR>", bufopts)
  vim.keymap.set('n', 'K', require("hover").hover, bufopts)
  vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<CR>", bufopts)
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", bufopts)
  vim.keymap.set('n', 'gl', "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.formatting, bufopts)

end

local on_attach = function(client, bufnr)
  lsp_keymap(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    api.nvim_create_autocmd('BufWritePre', {
      pattern = client.config.filetypes,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = true,
        })
      end,
    })
  end
end

lspconfig.gopls.setup({
  on_attach = on_attach,
  cmd = { 'gopls', '--remote=auto' },
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
})

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
      },
    },
  },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = 'module',
        importPrefix = 'self',
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'style',
        'tw'
      },
    },
  },
})

local servers = {
  'dockerls',
  'pyright',
  'tsserver',
  'bashls',
  'tailwindcss'
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
  })
end
