return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"markdown",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"zig",
			"html",
			"css",
			"bash",
      "markdown_inline",
			"lua",
			"dockerfile",
			"gitignore",
			"python",
      "sql",
      "go",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	},
  lazy = false,
}
