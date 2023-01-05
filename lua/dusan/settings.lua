local options = {
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	number = true,
	relativenumber = true,
	syntax = "on",
	showmode = true,
	scrolloff = 10,
	sidescroll = 8,
	hlsearch = true,
	ignorecase = false,
	splitbelow = true,
	splitright = false,
	showtabline = 2,
	fileencoding = "utf-8",
	cmdheight = 2,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Other vim options
vim.cmd([[set iskeyword+=-]])
