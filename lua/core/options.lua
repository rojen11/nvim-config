vim.o.number = true
vim.o.relativenumber = true

vim.opt.laststatus = 3
vim.diagnostic.config({
    float = {
        border = "rounded",
        source = "always",
    }
})


-- Set tab-related options for 4 spaces per tab
vim.opt.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4   -- Number of spaces to use for each indentation level
vim.opt.expandtab = true -- Use spaces instead of tab characters
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for when editing


-- Tab
vim.o.showtabline = 2

-- Colors
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")

-- Dap

vim.api.nvim_set_hl(0, "DapStopped", { bg = "#ffff00" })

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = '', linehl = 'DapStopped', numhl = '' })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsLine", { bg = "#dae660" })
