vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Me_Fugitive = vim.api.nvim_create_augroup("Me_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Me_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}

        -- Commit
        vim.keymap.set("n", "<leader>gc", "<cmd>Git commit -m \"\"<Left>", opts)

        -- Push
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, opts)

        -- Pull with rebase
        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)
    end,
})
