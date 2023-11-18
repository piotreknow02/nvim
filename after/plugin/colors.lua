function InitColors()
    -- Theme
    color = color or "moonfly"
	vim.cmd.colorscheme(color)

    -- No bg
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Airline theme
    airline = airline or "simple"
    vim.cmd.AirlineTheme(airline)
end

InitColors()
