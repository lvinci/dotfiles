return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "flex",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { "node_modules", ".git/", "build/", "%.g%.dart$" },
                    mappings = {
                        i = { ["<C-u>"] = false, ["<C-d>"] = false },
                    },
                },
            })

            -- Keybindings for quick searching
            vim.keymap.set("n", "<leader>ff", function()
                local is_git = vim.fn.system("git rev-parse --is-inside-work-tree")
                if vim.v.shell_error == 0 then
                    builtin.git_files()
                else
                    builtin.find_files()
                end
            end, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Search through Files" })
        end
    }
}

