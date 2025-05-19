return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "debugpy" }, -- this auto-installs Python adapter
        handlers = {}, -- use default handler
      })

      require("nvim-dap-virtual-text").setup()
      dapui.setup()

      -- Setup python DAP adapter via nvim-dap-python
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

      -- Automatically open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

    end,
  },
}
