local map = function(mode, lhs, rhs, desc)
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(mode, lhs, rhs, { 
    desc = "Rust: " .. desc,
    silent = true,
    buffer = bufnr
})
end

map("n", "<leader>rk", "<cmd>RustLsp moveItem up<cr>", "Move Item Up")
map("n", "<leader>rj", "<cmd>RustLsp moveItem down<cr>", "Move Item Down")

map("n", "<leader>ra", "<cmd>RustLsp codeAction<cr>", "Code Actions")
map("n", "K", "<cmd>RustLsp hover actions<cr>", "Hover Actions")
map("n", "<leader>re", "<cmd>RustLsp explainError<cr>", "Explain Error")

map("n", "<leader>rR", "<cmd>RustLsp runnables<cr>", "Run Current (Runnables)")
map("n", "<leader>rD", "<cmd>RustLsp debuggables<cr>", "Debug Current")
map("n", "<leader>rm", "<cmd>RustLsp expandMacro<cr>", "Expand Macro")
map("n", "<leader>rc", "<cmd>RustLsp openCargo<cr>", "Open Cargo.toml")
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", "Testables")


