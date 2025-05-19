return { {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
        { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
        { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
        { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
        { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
        { "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
        { "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
        { "<leader>bd", "<cmd>bd<cr>",                             desc = "Delete buffer" },

    },
    opts = {
        options = {
            mode = "buffers",
            -- stylua: ignore
            close_command = function(n) Snacks.bufdelete(n) end,
            -- stylua: ignore
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            color_icons = true,
            show_tab_indicators = true,
            separator_style = "slant",
            indicator = {
                style = 'underline',
            },
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
                {
                    filetype = "snacks_layout_box",
                },
            },
        },
        highlights = {
            buffer_selected = {
                bold = true,
                italic = false,
            }
        }
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,

}
}
