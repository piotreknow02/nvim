local lsp = require('lsp-zero')

lsp.preset('recomended')

require('mason').setup()

local lspconfig = require('mason-lspconfig')

lspconfig.setup {
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
		'dockerls',
		'elixirls',
		'eslint',
		'gopls',
		'biome',
        'jedi_language_server',
		'ruff_lsp',
		'sqlls',
		'cssls',
		'clangd',
		'astro',
		'svelte',
		'yamlls',
		'taplo',
		'zls',
        'emmet_language_server',
	},
	handlers = {
		lsp.default_setup,
	},
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
}

cmp.setup {
    mapping = cmp_mappings
}

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<leader>vhs", function() vim.lsp.buf.signature_help() end, opts)
end)

local rt = require('rust-tools')

local opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
}

rt.setup(opts)

vim.diagnostic.config({
    virtual_text = true
})

