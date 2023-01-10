local status_ok, treesitter_conf = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Could not find nvim-treesitter.configs")
	return
end

treesitter_conf.setup({
	ensure_installed = { "c", "lua", "cpp", "rust", "make", "cmake" },
	sync_install = true,
	highlight = {
		enable = true,
	},
})
