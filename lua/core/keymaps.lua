local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)


vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set({ "n", "i", "v" }, "<A-F>", vim.lsp.buf.format, { desc = "Format File" })


-- Terminal mode escape to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })


vim.keymap.set('n', "<leader>l", function() print(vim.fn.expand("%")) end,
    { desc = "Show relative path to the current file" })
