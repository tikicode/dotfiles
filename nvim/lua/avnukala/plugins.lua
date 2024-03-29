--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer
--- false: if packer has been installed
local ensure_packer = function()    
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'sheerun/vim-polyglot'
    use 'navarasu/onedark.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'seandewar/nvimesweeper'
    use 'nvim-tree/nvim-tree.lua'
    use 'neovim/nvim-lspconfig'
    use 'lervag/vimtex'
    use 'simrat39/symbols-outline.nvim'
    use {
        'ms-jpq/coq_nvim', branch = 'coq'
    }
    use {
        'ms-jpq/coq.artifacts', branch = 'artifacts'
    }
    use {
        'ms-jpq/coq.thirdparty', branch = '3p'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        'aserowy/tmux.nvim',
        config = function() return require('tmux').setup() end
    })
    use{
        'christoomey/vim-tmux-navigator',
        lazy=false,
    }
    use 'p00f/clangd_extensions.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


