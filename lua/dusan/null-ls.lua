local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	vim.notify("Could not find null-ls")
	return
end

local callback = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.rustfmt.with({
			extra_args = { "--edition=2021" },
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.clang_format.with({
			extra_args = { "--style=webkit" },
		}),
		null_ls.builtins.diagnostics.checkmake,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				-- callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				--vim.lsp.buf.formatting_sync()
				-- end,
				callback = function()
					callback(bufnr)
				end,
			})
		end
	end,
})
