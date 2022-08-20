local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("Could not find nvim-lsp-installer")
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("dusan.lsp.handlers").on_attach,
		capabilities = require("dusan.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("dusan.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_lua_opts = require("dusan.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
	end

	if server.name == "rust_analyzer" then
		local rust_analyzer_opts = require("dusan.lsp.settings.rust_analyzer")
		opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
	end
	server:setup(opts)
end)
