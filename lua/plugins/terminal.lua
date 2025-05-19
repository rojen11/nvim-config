local function toggle_tmux_term(direction)
    local toggleterm = require("toggleterm.terminal")
    local terminal_id = toggleterm.get_focused_id()

    if terminal_id then
        local terminal = toggleterm.get(terminal_id)
        terminal:toggle()
    else
        local Terminal = toggleterm.Terminal
        local cmd = [[
                      zsh -c '
                      REPO=$(git rev-parse --show-toplevel 2>/dev/null)
                      if [ -n "$REPO" ]; then
                        NAME=$(basename "$REPO")
                      else
                        NAME="default"
                      fi
                      exec tmux new-session -A -s "$NAME"
                      '
                ]]

        local tmux_term = Terminal:new({
            cmd = cmd,
            direction = direction
        })

        tmux_term:toggle()
    end
end

local function toggle_lazy_git()
    local Terminal = require("toggleterm.terminal").Terminal
    local cmd = [[
                      zsh -c 'lazygit
                      exit
                      '

                ]]

    local tmux_term = Terminal:new({
        cmd = cmd,
    })

    tmux_term:toggle()
end


return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = "float",
        float_opts = {
            border = "rounded",
            winblend = 3,
        },
        close_on_exit = true,
    },
    keys = {
        {
            "<leader>t",
            function() toggle_tmux_term("float") end,
            mode = "n",
            desc = "toggle terminal (float)"
        },
        {
            "<leader>T",
            function() toggle_tmux_term("horizontal") end,
            mode = "n",
            desc = "toggle terminal (horizontal)"
        },
        {
            "<leader>git",
            toggle_lazy_git,
            mode = "n",
            desc = "toggle lazygit (float)"
        },
        -- {
        --     "<C-t>",
        --     function() toggle_tmux_term("float") end,
        --     mode = "n",
        --     desc = "toggle terminal (float)"
        -- },
        -- {
        --     "<C-T>",
        --     function() toggle_tmux_term("horizontal") end,
        --     mode = "n",
        --     desc = "toggle terminal (float)"
        -- },
        -- {
        --     "<C-t>",
        --     "<cmd>ToggleTerm<CR>",
        --     mode = "t",
        --     desc = "Close terminal"
        -- },
    }
}
