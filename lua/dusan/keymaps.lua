local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

keymap("n", "<S-k>", ":bnext<cr>", opts)
keymap("n", "<S-j>", ":bprevious<cr>", opts)

keymap("n", "<C-q>", ":noh<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- Telescope stuff
keymap(
	"n",
	"<leader>ff",
	"<cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>",
	opts
)
keymap(
	"n",
	"<leader>fg",
	"<cmd> lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>",
	opts
)
-- keymap("n", "<leader>fh", "<cmd> lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy())<cr>", opts)
keymap(
	"n",
	"<leader>fh",
	"<cmd> lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<cr>",
	opts
)
keymap(
	"n",
	"<leader>fb",
	"<cmd> lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy())<cr>",
	opts
)
function _G.set_terminal_keymaps()
	local optss = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], optss)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], optss)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], optss)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], optss)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], optss)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], optss)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
