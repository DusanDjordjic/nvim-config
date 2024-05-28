local cmp = require('cmp')
local lsp_zero = require('lsp-zero')
local cmp_action = lsp_zero.cmp_action()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.get({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, { buffer = bufnr })
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.hover(), {buffer = bufnr})
end)


lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['gopls'] = { 'go' },
        ['rust_analyzer'] = { 'rust' },
        ['clang'] = { 'c' },
        ['lua_ls'] = { 'lua' },
    }
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "gopls", "rust_analyzer", "templ", "clangd", "lua_ls" },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})
