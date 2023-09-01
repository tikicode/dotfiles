-- config 
require("impatient")
require("avnukala.options")
require("avnukala.plugins")
require("avnukala.mappings")

-- COQ Third Party Plugins
require("coq_3p") {
    { src = "vimtex" },
}

-- OneDark Setup
local onedark = require('onedark')
onedark.load()

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options


--Autostart COQ
cmd[[let g:coq_settings = { 'auto_start': 'shut-up' }]]


-- Setup for autocomplete
local lsp = require "lspconfig"
local coq = require "coq" -- add this


-- NERDTree - autostart and put cursor in other window
cmd[[autocmd VimEnter * NERDTree | wincmd p]]


-- LSP settings
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

lsp.clangd.setup{}
local servers = { 'texlab', 'pyright','clangd' }
for _, lsps in ipairs(servers) do
    lsp[lsps].setup(require('coq').lsp_ensure_capabilities({
        on_attach = on_attach,
        flags = lsp_flags,
    }))
end


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


-- NERDTree setup
cmd[[
let g:NERDTreeGitStatusIndicatorMapCustom = {
                  \ 'Modified'  :'✹',
                  \ 'Staged'    :'✚',
                  \ 'Untracked' :'✭',
                  \ 'Renamed'   :'➜',
                  \ 'Unmerged'  :'═',
                  \ 'Deleted'   :'✖',
                  \ 'Dirty'     :'✗',
                  \ 'Ignored'   :'☒',
                  \ 'Clean'     :'✔︎',
                  \ 'Unknown'   :'?',
                  \ }
]]
