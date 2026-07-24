require("thestackshepherd.set")
require("thestackshepherd.remap")
require("thestackshepherd.lazy_init")
require("thestackshepherd.ftdetect")

-- Create a user autocommand group for thestackshepherd
local augroup = vim.api.nvim_create_augroup
local thestackshepherd_group = augroup('thestackshepherd', {})

-- Create an autocommand group for highlighting yanks
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = thestackshepherd_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("BufEnter", {
	group = JadenSchwartzGroup,
	callback = function()
		pcall(vim.cmd.colorscheme, "gruvbox")
        pcall(vim.cmd.set, "background=dark")
	end,
})

autocmd('LspAttach', {
    group = thestackshepherd_group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0 -- disables the default banner in netrw
vim.g.netrw_winsize = 25 -- Set the default size of netrw windows to 25% of the screen
vim.g.netrw_fastbrowse = 0 -- Always get fresh directory listing
