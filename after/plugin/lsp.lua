require('mason').setup()

require('lspconfig')
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        'pyright',
        'clangd',
    }
})

require('cmp').setup {
    sources = {
        { name = 'nvim_lsp' }
    }
}

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete()
})
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp_mappings,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
}
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "<leader>gs", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "<leader>vu", function() vim.lsp.buf.incoming_calls() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vl", function()
            if vim.diagnostic.is_enabled() then
                vim.diagnostic.disable()
            else
                vim.diagnostic.enable()
            end
        end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

-- Use native lsp config
vim.lsp.enable('dartls')
vim.lsp.config('dartls', {})
vim.lsp.enable('serve_d')
vim.lsp.config('serve_d', {
    settings = {
        dfmt = {
            braceStyle = "otbs"
        }
    }
})
