local lsp = require('lsp-zero')

lsp.preset('recomended')

require('mason').setup()

require('mason-lspconfig').setup {
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
		'omnisharp',
		'dockerls',
		'elixirls',
		'eslint',
		'gopls',
		'biome',
		'jedi_language_server',
		'sqlls',
		'cssls',
		'clangd',
		'astro',
		'svelte',
		'yamlls',
		'taplo',
		'zls',
	},
	handlers = {
		lsp.default_setup,
	},
}

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
