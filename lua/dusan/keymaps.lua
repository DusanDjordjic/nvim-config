local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Splits and split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Make splits even
-- keymap("n", "<C-E>", "<C-w>=", opts)

-- Resize windows
keymap("n", "+", "<C-w>2+", opts)
keymap("n", "_", "<C-w>2-", opts)
keymap("n", "<", "<C-w>2<", opts)
keymap("n", ">", "<C-w>2>", opts)

-- Make Splits
keymap("n", "<leader>V", ":vsp<cr>", opts)
keymap("n", "<leader>H", ":sp<cr>", opts)

-- For moving lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Tree view
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Quit highlight
keymap("n", "<C-q>", ":noh<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep the previous copy
keymap("v", "p", '"_dP', opts)

-- Copy & Paste from Clipboard
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>p", '"+p', opts)

-- Telescope stuff
keymap(
	"n",
	"<leader>ff",
	"<cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>",
	opts
)

vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, opts)

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
