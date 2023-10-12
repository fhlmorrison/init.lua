-- Debug Keymaps
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<S-F11>", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl_open()<CR>")

require('dapui').setup()
require('nvim-dap-virtual-text').setup()

local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = { vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7' },
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
        runInTerminal = false,
    },
    {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
