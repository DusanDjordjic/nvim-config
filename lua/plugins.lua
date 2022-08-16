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

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

