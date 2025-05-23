local M = {}

function M.require_all_from_dir(module_dir)
    local config_dir = vim.fn.stdpath("config") .. "/lua/" .. module_dir

    for _, file in ipairs(vim.fn.glob(config_dir .. "/*.lua", true, true)) do
        local filename = vim.fn.fnamemodify(file, ":t:r") -- get basename without extension
        require(module_dir .. "." .. filename)
    end
end

return M
