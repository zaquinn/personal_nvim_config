return {
	"nvim-telescope/telescope.nvim",
	lazy = false, -- Change to `true` if you want to lazy-load Telescope
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Optional: Fuzzy finder extension for faster sorting (requires compilation)
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	keys = {
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
	},
	config = function()
		local telescope = require("telescope")
		local entry_display = require("telescope.pickers.entry_display")

		telescope.setup({
			defaults = {
				-- You can customize your defaults here
				prompt_prefix = "🔍 ",
				selection_caret = " ",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				winblend = 0,
				-- More defaults can be added as needed
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					--					previewer = false, -- Disable preview for a cleaner dropdown look
				},
				live_grep = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
					--					previewer = false,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- Enable fuzzy matching
					override_generic_sorter = true, -- Override the generic sorter
					override_file_sorter = true, -- Override the file sorter
					case_mode = "smart_case", -- Use smart case matching
				},
			},
		})

		-- Load the fzf extension if available
		pcall(function()
			telescope.load_extension("fzf")
		end)
	end,
}
