require('trouble').setup({})

vim.keymap.set("n", "<leader>qf", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
