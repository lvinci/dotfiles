return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- Auto-install & configure all available LSPs in Mason
            mason_lspconfig.setup({
                ensure_installed = {}, -- Leave empty to install manually
                automatic_installation = true,
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end
            })

            -- Flutter/Dart LSP setup (since Mason doesn't manage it)
            lspconfig.dartls.setup({
                cmd = { "dart", "language-server", "--protocol=lsp" },
                filetypes = { "dart" },
                root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
            })

            -- Basic LSP Keybindings
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf, silent = true }
                    local keymap = vim.keymap.set
                    keymap("n", "<Space>f", vim.lsp.buf.format, opts) -- Format shortcut
                    keymap("n", "gd", vim.lsp.buf.definition, opts)
                    keymap("n", "K", vim.lsp.buf.hover, opts)
                    keymap("n", "gr", vim.lsp.buf.references, opts)
                    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
                    keymap("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end,
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",         -- Minimal Autocomplete
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP-based completion
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end
    }
}
