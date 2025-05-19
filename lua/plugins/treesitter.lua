return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup(
            {
                ensure_installed = {"python", "lua", "bash", "javascript", "typescript"},
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                auto_install = true,
                playground = {
                    enable = true,
                }
            }
        )
    end,
    build = ":TSUpdate",
    dependencies = {
        'nvim-treesitter/playground',
    },
}
