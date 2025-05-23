local dap = require("dap")
local dap_python = require("dap-python")

dap_python.setup("python")

table.insert(dap.configurations.python, {
    type = "python",
    request = "launch",
    name = "Django",
    program = "${workspaceFolder}/manage.py",
    args = { "runserver", "--noreload" },
    django = true,
})


