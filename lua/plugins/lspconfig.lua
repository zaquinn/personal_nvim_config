return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local on_attach = function(client, bufnr)
			local bufmap = function(mode, lhs, rhs, desc)
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
			end

			bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition")
			bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation")
			bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
			bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "References")
			bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if cmp_ok then
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		end

		local lspconfig = require("lspconfig")
		local servers = {
			ts_ls = {},
			html = {},
			cssls = {},
			zls = {},
			gopls = {},
			pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "strict",
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				},
			},
		}

		for server, opts in pairs(servers) do
			lspconfig[server].setup(vim.tbl_extend("force", {
				on_attach = on_attach,
				capabilities = capabilities,
			}, opts))
		end
	end,
}
