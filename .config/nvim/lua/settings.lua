vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- only use 2 spaces for dart files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.opt_local.shiftwidth = 2   -- Indentation level for auto-indent
        vim.opt_local.tabstop = 2      -- Number of spaces per tab
        vim.opt_local.softtabstop = 2  -- Ensures Tab key inserts 2 spaces
        vim.opt_local.expandtab = true -- Always use spaces instead of tab characters
    end,
})

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.netrw_list_hide = "\\.git,\\.g\\.dart$" -- Hide .g.dart files in Netrw
vim.g.netrw_banner = 0                        -- Disable Netrw header
vim.g.netrw_winsize = 25                      -- Optional: Set default Netrw size
