vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", ":browse oldfiles<CR>")
vim.keymap.set("n", "<leader>c", ":noh<CR>") -- Clear search highlight

function OpenManPage()
    local word = vim.fn.expand('<cword>')
    if word ~= '' then
        vim.cmd('silent! Man ' .. word)
    else
        print('No word under cursor')
    end
end

vim.keymap.set("n", "<leader>pl", function()
    if next(vim.opt.colorcolumn:get()) == nil then
        vim.opt.colorcolumn = "120"
    else
        vim.opt.colorcolumn = ""
    end
end, {silent = true})
vim.keymap.set("n", "<leader>k", OpenManPage, {silent = true})

-- Toggle decorations
vim.keymap.set("n", "<leader>po", function()
    if vim.opt.number._value or vim.opt.relativenumber._value then
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn='no'
    else
        vim.opt.relativenumber = true
        vim.opt.signcolumn='number'
    end
end, {silent = true})
