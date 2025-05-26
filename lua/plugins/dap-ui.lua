return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keymaps = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle()
                end,
                desc = "Toggle DAP UI",
            },
            {
                "<leader>dr",
                function()
                    require("dapui").repl.toggle()
                end,
                desc = "Toggle DAP REPL",
            },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup({
                layouts = {
                    {
                        -- You can change the order of elements in the sidebar
                        elements = {
                            -- Provide IDs as strings or tables with "id" and "size" keys
                            {
                                id = "scopes",
                                size = 0.25, -- Can be float or integer > 1
                            },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks",      size = 0.25 },
                            { id = "watches",     size = 0.25 },
                        },
                        size = 40,
                        position = "right", -- Can be "left" or "right"
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 10,
                        position = "bottom", -- Can be "bottom" or "top"
                    },
                }
            })

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
}
