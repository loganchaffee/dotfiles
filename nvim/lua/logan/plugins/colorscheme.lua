local function make_transparent()
	vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi NvimTreeWinSeparator guibg=none guifg=none")

	-- Transparent floating windows (hover, diagnostics, etc)
	vim.cmd("au ColorScheme * hi NormalFloat guibg=none")
	vim.cmd("au ColorScheme * hi FloatBorder guibg=none")
	vim.cmd("au ColorScheme * hi FloatTitle guibg=none")

	-- Diagnostic float messages
	vim.cmd("au ColorScheme * hi! link DiagnosticFloatingError DiagnosticError")
	vim.cmd("au ColorScheme * hi! link DiagnosticFloatingWarn DiagnosticWarn")
	vim.cmd("au ColorScheme * hi! link DiagnosticFloatingInfo DiagnosticInfo")
	vim.cmd("au ColorScheme * hi! link DiagnosticFloatingHint DiagnosticHint")

	-- Diagnostic signs with preserved color and transparent background
	vim.cmd("au ColorScheme * hi DiagnosticSignError guifg=#fb4934 guibg=none")
	vim.cmd("au ColorScheme * hi DiagnosticSignWarn  guifg=#fabd2f guibg=none")
	vim.cmd("au ColorScheme * hi DiagnosticSignInfo  guifg=#83a598 guibg=none")
	vim.cmd("au ColorScheme * hi DiagnosticSignHint  guifg=#8ec07c guibg=none")

	-- Telescope windows
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

	vim.cmd("let &fcs='eob: '")
end

return {
	"lunarvim/darkplus.nvim",
	priority = 1000,
	lazy = false,
	name = "darkplus",
	config = function()
		make_transparent()
		vim.cmd("colorscheme darkplus")
		make_transparent()
	end,
}
