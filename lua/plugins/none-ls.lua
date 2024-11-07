-- Format code

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.pretty_php,
                null_ls.builtins.formatting.google_java_format,
            },
        })

        vim.keymap.set("n", "<C-A-l>", vim.lsp.buf.format, {})
    end,
}
