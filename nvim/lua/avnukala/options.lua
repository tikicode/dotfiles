vim.opt.fileencoding = "utf-8"

-- Enable 24bit colors in terminal
vim.opt.termguicolors = true

-- Auto-indent new lines
vim.opt.autoindent = true
-- Enable smart-indent
vim.opt.smartindent = true

-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of auto-indent spaces
vim.opt.shiftwidth = 2
-- Number of spaces per Tab
vim.opt.softtabstop = 2
-- Number of columns per tab
vim.opt.tabstop = 2

-- No wrap
vim.opt.wrap = false

-- Always case-insensitive
vim.opt.ignorecase = true
-- Enable smart-case search
vim.opt.smartcase = true
-- Searches for strings incrementally
vim.opt.incsearch = true

-- Show line numbers
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Display eol characters
vim.opt.list = true

-- No swap file
vim.opt.swapfile = false

-- Ignore LaTeX aux files
vim.opt.wildignore = {
    "*.aux",
    "*.lof",
    "*.lot",
    "*.fls",
    "*.out",
    "*.toc",
    "*.fmt",
    "*.fot",
    "*.cb",
    "*.cb2",
    ".*.lb",
    "__latex*",
    "*.fdb_latexmk",
    "*.synctex",
    "*.synctex(busy)",
    "*.synctex.gz",
    "*.synctex.gz(busy)",
    "*.pdfsync",
    "*.bbl",
    "*.bcf",
    "*.blg",
    "*.run.xml",
    "indent.log",
}


