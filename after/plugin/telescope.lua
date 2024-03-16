local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local nmap = function (keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        nmap("<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, "[D]ocument [S]ynmbols")
        nmap("<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "[W]orkspace [S]ymbols")
    end
})
