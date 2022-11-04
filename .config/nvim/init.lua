vim.opt.mouse = 'a'

-- Tabbing
vim.opt.expandtab  = true
vim.opt.shiftwidth = 4
vim.opt.tabstop    = 4
vim.opt.autoindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs
vim.api.nvim_set_keymap('n','<F2>',':tabprevious<CR>',{noremap=true})
vim.api.nvim_set_keymap('n','<F3>',':tabNext<CR>',{noremap=true})

--Terminal
vim.api.nvim_set_keymap('t','<Esc>','<C-\\><C-n>',{noremap=true})

-- Highlighting
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.api.nvim_set_keymap('n','<F4>',':nohl<CR>',{noremap=true})

-- Other
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.opt.wrap       = false
vim.opt.laststatus = 2
vim.opt.clipboard  = 'unnamedplus,unnamed'
vim.api.nvim_set_keymap('n','<C-n>',':NERDTreeToggle<CR>',{noremap=true})

-- Colorscheme
vim.cmd('colorscheme codedark')

-- Language Stuff
vim.cmd('syntax on')
vim.opt.completeopt = 'menu,menuone,noselect'

local cmp = require'cmp'
cmp.setup({
    --Snippet Engine
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) --VSnip
        end,
    },
    window = {
      -- completion = cmd.config.window.bordered(),
      -- documentation = cmd.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['ccls'].setup {
    capabilities = capabilities
}
require'lspconfig'.pylsp.setup{
    capabilities = capabilities
}
