local loader = require('utils.loader')

return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            loader.require_all_from_dir("lsp")
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff","eslint", "biome" },
                automatic_installation = true
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            -- cfg options
        },
    }
}
