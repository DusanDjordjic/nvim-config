-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = { { 'nvim-lua/plenary.nvim' } } }
    use('rose-pine/neovim')
    use('folke/tokyonight.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { { "nvim-lua/plenary.nvim" } } }
    use("mbbill/undotree")
    use("projekt0n/github-nvim-theme")
    use("f-person/git-blame.nvim")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'mason-org/mason.nvim' },
            { 'mason-org/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
end)
