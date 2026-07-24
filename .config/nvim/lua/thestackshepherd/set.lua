vim.opt.guicursor = ""

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

 -- smart indentation
vim.opt.smartindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.list = true
vim.opt.listchars = "eol:.,tab:>-,trail:~,extends:>,precedes:<"

-- disable line wrapping
vim.opt.wrap = false

-- disable swap and backup files, set undo directory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable search highlight, enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable true color support
vim.opt.termguicolors = true

-- better scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- decrease update time for faster completion
vim.opt.updatetime = 50

-- display partial commands in the last line of the screen
vim.opt.showcmd = true
vim.opt.showmode = false

-- highlight the current line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d79921", bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
