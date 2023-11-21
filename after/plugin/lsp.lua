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
