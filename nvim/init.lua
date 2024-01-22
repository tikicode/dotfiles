-- Vim Commands
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- To call Vim functions e.g. fn.bufnr()
local g = vim.g      -- A table to access global variables
local opt = vim.opt  -- To set options

-- Disable netrw for NvimTree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true -- Enable highlight groups

-- Config 
require("impatient")
require("avnukala.options")
require("avnukala.plugins")
require("avnukala.mappings")

-- Nvim Tree Setup
require("nvim-tree").setup({
    filters = {
      dotfiles = true,
    },
})

-- Auto-start Nvim Tree
cmd [[autocmd VimEnter * NvimTreeOpen | wincmd p]]

-- COQ Third Party Plugins
require("coq_3p") {
    { src = "vimtex" },
}

-- Symbols-outline Setup
require("symbols-outline").setup()

-- OneDark Setup
local onedark = require('onedark')
onedark.load()

--Autostart COQ
cmd[[let g:coq_settings = { 'auto_start': 'shut-up' }]]

-- Setup for autocomplete
local lsp = require "lspconfig"
local coq = require "coq" -- add this

-- ClangD Extensions Setup
require("clangd_extensions.inlay_hints").setup_autocmd()
require("clangd_extensions.inlay_hints").set_inlay_hints()


-- LSP Settings
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
lsp.clangd.setup{}
lsp.clangd.setup(coq.lsp_ensure_capabilities{})
lsp.asm_lsp.setup{
    filetypes = { ".S", ".s" },
}
lsp.asm_lsp.setup(coq.lsp_ensure_capabilities{})
lsp.ocamllsp.setup{}
lsp.ocamllsp.setup(coq.lsp_ensure_capabilities{})
lsp.texlab.setup{}
lsp.texlab.setup(coq.lsp_ensure_capabilities{})
lsp.pyright.setup{}
lsp.pyright.setup(coq.lsp_ensure_capabilities{})
local servers = { 'texlab', 'pyright','clangd','asm_lsp'}
for _, lsps in ipairs(servers) do
    lsp[lsps].setup(require('coq').lsp_ensure_capabilities({
        on_attach = on_attach,
        flags = lsp_flags,
    }))
end
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)


-- General Settings
cmd 'filetype plugin indent on'
cmd 'syntax enable'
cmd 'colorscheme onedark'


-- Vimtex settings
cmd[[
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let maplocalleader = ","
set conceallevel=1
let g:tex_conceal='abdmg'
]]

-- setup for vimtex
cmd[[
    augroup vimtex_mac
        autocmd!
        autocmd User VimtexEventCompileSuccess call UpdateSkim()
    augroup END

    function! UpdateSkim() abort
        let l:out = b:vimtex.out()
        let l:src_file_path = expand('%:p')
        let l:cmd = [g:vimtex_view_general_viewer, '-r']

        if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
        endif

        call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
    endfunction

    augroup vimtex_mac
        autocmd!
        autocmd FileType tex call SetServerName()
    augroup END

    function! SetServerName()
        call system('echo ' . v:servername . ' > /tmp/curvimserver')
    endfunction
  ]]

-- Lualine setup
local lualine = require('lualine')

lualine.setup {
  options = {
    theme = 'onedark',
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

