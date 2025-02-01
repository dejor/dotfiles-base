local dap = require "dap"
local ui = require "dapui"

require("dapui").setup()
require("dap-python").setup("python")
require("nvim-dap-virtual-text").setup()

-- Eval var under cursor
vim.keymap.set("n", "<F7>",
               function() require("dapui").eval(nil, {enter = true}) end)

--vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dap.run_to_cursor)
vim.keymap.set("n", "<F8>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F9>", dap.step_back)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<S-F11>", dap.step_out)
vim.keymap.set("n", "<F12>", dap.restart)


dap.listeners.before.attach.dapui_config = function() ui.open() end
dap.listeners.before.launch.dapui_config = function() ui.open() end
-- dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
-- dap.listeners.before.event_exited.dapui_config = function() ui.close() end
