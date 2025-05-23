local loader = require("utils.loader")

return {
    -- Core DAP
    {
        "mfussenegger/nvim-dap",
        dependencies = { "mfussenegger/nvim-dap-python" },
        config = function()
            loader.require_all_from_dir("dap")
        end,
    },
}
