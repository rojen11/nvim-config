return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic", -- or "strict"
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        }
                    }
                }
            })
        end
    },
    {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "mason-org/mason.nvim", },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls", "ruff", "eslint", "biome" },
                automatic_installation = true
            })
        end,
        keys = {
            {
                '<leader>gd',
                function() vim.lsp.buf.definition() end,
                mode = 'n',
                desc = 'Go to Definition',
                silent = true,
                noremap = true,
            },
            {
                '<leader>gr',
                function() require("telescope.builtin").lsp_references() end,
                mode = 'n',
                desc = 'Go to References',
                silent = true,
                noremap = true,
            },
            {
                '<leader>gi',
                function() vim.lsp.buf.implementation() end,
                mode = 'n',
                desc = 'Go to Implementation',
                silent = true,
                noremap = true,
            },
            {
                '<leader>rn',
                function() vim.lsp.buf.rename() end,
                mode = 'n',
                desc = 'Rename',
                silent = true,
                noremap = true,
            },
            {
                '<leader>ca',
                function() vim.lsp.buf.code_action() end,
                mode = 'n',
                desc = 'Code Action',
                silent = true,
                noremap = true,
            },
            {
                '<leader>gl',
                function() require("telescope.builtin").diagnostics() end,
                mode = 'n',
                desc = 'Show diagnostics',
                silent = true,
                noremap = true,
            }
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            -- cfg options
        },
 }
}

-- return {
--     {
--         "neovim/nvim-lspconfig",
--         dependencies = {
--             "nvim-telescope/telescope.nvim"
--         },
--         keys = {
--             {
--                 '<leader>gd',
--                 function() vim.lsp.buf.definition() end,
--                 mode = 'n',
--                 desc = 'Go to Definition',
--                 silent = true,
--                 noremap = true,
--             },
--             {
--                 '<leader>gr',
--                 function() require("telescope.builtin").lsp_references() end,
--                 mode = 'n',
--                 desc = 'Go to References',
--                 silent = true,
--                 noremap = true,
--             },
--             {
--                 '<leader>gi',
--                 function() vim.lsp.buf.implementation() end,
--                 mode = 'n',
--                 desc = 'Go to Implementation',
--                 silent = true,
--                 noremap = true,
--             },
--             {
--                 '<leader>rn',
--                 function() vim.lsp.buf.rename() end,
--                 mode = 'n',
--                 desc = 'Rename',
--                 silent = true,
--                 noremap = true,
--             },
--             {
--                 '<leader>ca',
--                 function() vim.lsp.buf.code_action() end,
--                 mode = 'n',
--                 desc = 'Code Action',
--                 silent = true,
--                 noremap = true,
--             },
--             {
--                 '<leader>gl',
--                 function() require("telescope.builtin").diagnostics() end,
--                 mode = 'n',
--                 desc = 'Show diagnostics',
--                 silent = true,
--                 noremap = true,
--             }
--         },
--     },
--     {
--         "williamboman/mason.nvim",
--         opts = {}
--     },
--
--     {
--         "williamboman/mason-lspconfig.nvim",
--         dependencies = {
--             "neovim/nvim-lspconfig",
--             "williamboman/mason.nvim",
--         },
--         config = function()
--             require("mason-lspconfig").setup({
--                 ensure_installed = { "pyright", "lua_ls", "ruff", "eslint", "biome" },
--             })
--
--             local lspconfig = require("lspconfig")
--             local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--             local mason_lspconfig = require("mason-lspconfig")
--
--             mason_lspconfig.setup_handlers()
--
--
--             -- require("mason-lspconfig").setup_handlers({
--             --     function(server_name)
--             --         lspconfig[server_name].setup({
--             --             capabilities = capabilities,
--             --         })
--             --     end,
--             -- })
--         end,
--     },
--
-- }
