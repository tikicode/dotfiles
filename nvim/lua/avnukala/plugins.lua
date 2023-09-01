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
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'sheerun/vim-polyglot'
    use 'navarasu/onedark.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'seandewar/nvimesweeper'
    use 'preservim/nerdtree'
    use 'neovim/nvim-lspconfig'
    use 'lervag/vimtex'
    use 'github/copilot.vim'
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
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


