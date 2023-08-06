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

vim.keymap.set("n", "<leader>k", OpenManPage, {silent = true})
