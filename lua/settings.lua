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
}

for k, v in pairs(options) do 
	vim.opt[k] = v
end

