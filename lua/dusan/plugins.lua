local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print("Installing packer close and reopen Neovim...")
    vim.cmd [[packadd packer.nvim]]
end

-- Autoreload when plugins.lua file is edited
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't get error out on firts use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Install all the plugins
return packer.startup(function(use)

    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "sainnhe/sonokai"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "David-Kunz/cmp-npm"
    use "hrsh7th/cmp-nvim-lsp"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use {"akinsho/toggleterm.nvim", tag = 'v2.*' }
    use {"jose-elias-alvarez/null-ls.nvim"}
    use {"lukas-reineke/lsp-format.nvim"}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

