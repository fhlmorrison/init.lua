vim.g.mapleader = " "

--Project View - Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted lines up and down (alt+up/down in VSCode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in position when appending next line (J)
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle when doing half-page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Do not copy on replace (keeps pasted in copy buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without copying
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Make ctrl-c same as escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Remove Q as ex mode keybind
vim.keymap.set("n", "Q", "<nop>")

-- Format document with lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>")

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

