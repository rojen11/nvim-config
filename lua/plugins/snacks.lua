return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        animate = {},
        bigfile = { enabled = true },
        dashboard = { enabled = true, example = "advanced" },
        explorer = {
            enabled = true,
            replace_netrw = true
        },
        indent = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    layout = { layout = { position = "right" } }
                }
            },
            win = {
                input = {
                    keys = {
                        ["<CR>"] = { "confirm", mode = { "i", "n" } }
                    }
                },
                list = {
                    keys = {
                        ["<CR>"] = { "confirm", mode = { "i", "n" } }
                    }
                }
            }
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true }, -- Wrap notifications
                relative = "editor",  -- Position notifications relative to the editor
            }
        }
    },
    keys = {
        { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
        { "<leader>gg", function() Snacks.lazygit() end,  desc = "Lazygit" },
    }
}
