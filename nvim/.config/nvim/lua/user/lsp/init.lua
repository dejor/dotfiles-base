local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

-- autocmd to set filtype helm
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml',
    callback = function() vim.opt_local.filetype = 'helm' end
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/zsh/*',
    callback = function() vim.opt_local.filetype = 'bash' end
})

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
