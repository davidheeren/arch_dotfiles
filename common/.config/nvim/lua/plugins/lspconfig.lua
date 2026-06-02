return {
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        },
        opts = {
            -- registries = {
            --     "github:mason-org/mason-registry",
            --     "github:crashdummyy/mason-registry"
            -- },
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            format = { defaultConfig = { max_line_length = "240" } }
                        }
                    }
                },
                -- csharp_ls = {},
                -- csharpier = {},
                -- omnisharp = {},
                bashls = {},
                -- hyprls = {},
                html = {},
                cssls = {},
                -- ts_ls = {},
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    maxLineLength = 9999, -- Set a very high number
                                },
                            },
                        },
                    },
                },
                -- clangd = {
                --     cmd = {
                --         "clangd",
                --         "--fallback-style=webkit"
                --     }
                -- },
                jsonls = {}
            }
        },
        config = function(_, opts)
            require("mason").setup(opts)

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(opts.servers)
            })

            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.diagnostic.config({
                -- virtual_lines = true,
                underline = true
            })
        end
    },
    -- {
    --     "seblyng/roslyn.nvim",
    --     ---@module 'roslyn.config'
    --     ---@type RoslynNvimConfig
    --     ft = { "cs", "razor" },
    --     opts = {
    --         -- your configuration comes here; leave empty for default settings
    --     },
    -- },
}
