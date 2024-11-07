-- Format code

return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({

            sources = {
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.diagnostics.intelephense"),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.pretty_php,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.formatting.pint,
            },
        })

        vim.keymap.set("n", "<C-A-l>", vim.lsp.buf.format, {})

        -- List of tools to autoinstall
        local tools = {
            "stylua",
            "prettier",
            "pretty-php",
            "google-java-format",
            "pint",
        }

        -- Function to ensure tools are installed
        local mason_registry = require("mason-registry")
        for _, tool in ipairs(tools) do
            local package = mason_registry.get_package(tool)
            if not package:is_installed() then
                package:install()
            end
        end
    end,
}
