vim.pack.add({
	"https://github.com/leoluz/nvim-dap-go.git",
	"https://github.com/mfussenegger/nvim-dap.git",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui.git",
	"https://github.com/mason-org/mason.nvim.git",
	"https://github.com/jay-babu/mason-nvim-dap.nvim.git",
})

local dap = require("dap")

dap.configurations.scala = {
	{
		type = "scala",
		request = "attach",
		name = "Attach to Play Framework",
		buildTarget = "root",
		hostName = "localhost",
		port = 5005,
	},
	{
		type = "scala",
		request = "attach",
		name = "Attach to Play Framework - New UX Server",
		buildTarget = "root",
		hostName = "localhost",
		port = 53385,
	},
	{
		type = "scala",
		request = "attach",
		name = "Attach to Play Framework - Patron Service",
		buildTarget = "root",
		hostName = "localhost",
		port = 53382,
	},
	{
		type = "scala",
		request = "attach",
		name = "Attach to Play Framework - Hotel Booking Service",
		buildTarget = "root",
		hostName = "localhost",
		port = 53389,
	},
	{
		type = "scala",
		request = "attach",
		name = "Attach to Play Framework - LED Wall Service",
		buildTarget = "root",
		hostName = "localhost",
		port = 53416,
	},
}

-- Basic debugging keymaps
vim.keymap.set("n", "<leader>Dc", function()
	dap.continue()
end, { desc = "Debug: Start/Continue" })

vim.keymap.set("n", "<leader>Dsi", function()
	dap.step_into()
end, { desc = "Debug: Step Into" })

vim.keymap.set("n", "<leader>Dso", function()
	dap.step_over()
end, { desc = "Debug: Step Over" })

vim.keymap.set("n", "<leader>DsO", function()
	dap.step_out()
end, { desc = "Debug: Step Out" })

vim.keymap.set("n", "<leader>Db", function()
	dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })

vim.keymap.set("n", "<leader>DB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Breakpoint" })

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set("n", "<leader>Dt", function()
	require("dapui").toggle()
end, { desc = "Debug: See last session result." })

local dapui = require("dapui")

dapui.setup({
	-- Set icons to characters that are more likely to work in every terminal.
	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	---@diagnostic disable-next-line: missing-fields
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = "⏭",
			step_out = "⏮",
			step_back = "b",
			run_last = "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Change breakpoint icons
vim.api.nvim_set_hl(0, "DapBreak", { fg = "#d20f39" })
vim.api.nvim_set_hl(0, "DapStop", { fg = "#df8e1d" })

local breakpoint_icons = vim.g.have_nerd_font
		and {
			Breakpoint = "",
			BreakpointCondition = "",
			BreakpointRejected = "",
			LogPoint = "",
			Stopped = "",
		}
	or {
		Breakpoint = "●",
		BreakpointCondition = "⊜",
		BreakpointRejected = "⊘",
		LogPoint = "◆",
		Stopped = "⭔",
	}

for type, icon in pairs(breakpoint_icons) do
	local tp = "Dap" .. type
	local hl = (type == "Stopped") and "DapStop" or "DapBreak"
	vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

-- Language specific Debuggers

-- Mason to manage debugger installations
require("mason-nvim-dap").setup({
	-- Makes a best effort to setup the various debuggers with
	-- reasonable debug configurations
	automatic_installation = true,

	-- You'll need to check that you have the required things installed
	-- online, please don't ask me how to install them :)
	ensure_installed = {
		-- Update this to ensure that you have the debuggers for the langs you want
		"delve",
	},
})

require("dap-go").setup()
