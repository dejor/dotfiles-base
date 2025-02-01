vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- autocmd to set filtype helm; also prevent yaml lsps to attach
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml',
    callback = function() vim.opt_local.filetype = 'helm' end
})
