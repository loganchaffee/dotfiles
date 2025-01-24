return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- { "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = DefaultWindowDimentions.width,
						height = DefaultWindowDimentions.width,
					},
				},
				sorting_strategy = "ascending",
			},
			-- extensions = {
			-- 	["ui-select"] = {
			-- 		require("telescope.themes").get_dropdown({
			-- 			prompt_position = "top",
			-- 		}),
			-- 	},
			-- },
		})

		-- Enable telescope extensions, if they are installed
		pcall(require("telescope").load_extension, "fzf")
		-- pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		-- vim.keymap.set("n", "<leader>st", builtin.grep_string, { desc = "[S]earch for [T]ext" })
		vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>s.", function()
			builtin.current_buffer_fuzzy_find()
		end, { desc = "[.] Fuzzily search in current buffer" })

		-- Shortcut for searching neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- Automatically focus any Telescope window when opened
		local focus_telescope_window = function()
			local win_id = vim.fn.win_getid() -- Get the current window ID
			vim.api.nvim_set_current_win(win_id) -- Set focus to that window
		end

		-- Focus the window on these Telescope events
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePromptOpen",
			callback = focus_telescope_window,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePreviewerOpen",
			callback = focus_telescope_window,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopeUISelectOpen",
			callback = focus_telescope_window,
		})
	end,
}
