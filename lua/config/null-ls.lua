local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        -- diagnostics
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.yamllint,
        -- formatting
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        -- code actions
        null_ls.builtins.code_actions.refactoring,

    },
})
