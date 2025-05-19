return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
        opts = function(_, opts)

            opts.pickers = {
                find_files = {
                    no_ignore = true,
                    hidden = true,
                },
                live_grep = {
                    no_ignore = true,
                    hidden = true,
                }
            }

            opts.extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }

            require("telescope").load_extension("fzf")

            return opts
        end,
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope: Find files" },
            { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Telescope: Live grep" },
            { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Telescope: Buffers" },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Telescope: Help tags" },
        },
    }

}
