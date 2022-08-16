local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Could not find lspconfig")
    return
end

require("dusan.lsp.lsp-installer")
require("dusan.lsp.handlers").setup()
