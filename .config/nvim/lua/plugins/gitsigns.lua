return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },       -- Green bar for added lines
                    change = { text = "│" },    -- Blue bar for modified lines
                    delete = { text = "_" },    -- Red underscore for deleted lines
                    topdelete = { text = "‾" }, -- Top-delete marker
                    changedelete = { text = "~" } -- Modified & deleted
                },
                numhl = false, -- Disable highlighting in number column
                signcolumn = true, -- Show Git signs in the sign column
                watch_gitdir = { interval = 1000, follow_files = true },
                attach_to_untracked = false,
                on_attach = function(bufnr)
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set("n", "]c", require("gitsigns").next_hunk, opts)
                    vim.keymap.set("n", "[c", require("gitsigns").prev_hunk, opts)
                    vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, opts)
                    vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, opts)
                end
            })
        end
    }
}

