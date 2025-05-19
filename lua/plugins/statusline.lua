return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            -- always_show_tabline = true,
            -- tabline = {
            --     lualine_a = {
            --         {
            --             'tabs',
            --             mode = 2,                        -- 0: tab nr, 1: tab name, 2: both
            --             tabs_color = {
            --                 active = 'lualine_a_normal', -- highlight group
            --                 inactive = 'lualine_a_inactive',
            --             },
            --         }
            --     },
            -- },
            disabled_filetypes = {
                statusline = {
                    'NvimTree',
                    'help',
                    'lazy',
                    'packer',
                    'startify',
                    'alpha',
                    'dashboard',
                    'TelescopePrompt',
                },
            },
            globalstatus = true,
        }
    }
}
