return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "intelephense",
                    "phpactor",
                    "html",
                    "vuels",
                    "tailwindcss",
                    "css_variables",
                    "jdtls",
                    "eslint",
                    "lemminx",
                }
            });
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities
            })
            lspconfig.phpactor.setup({
                capabilities = capabilities
            })
            lspconfig.vuels.setup({
                capabilities = capabilities
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities
            })
            lspconfig.css_variables.setup({
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities
            })
            lspconfig.eslint.setup({
                capabilities = capabilities
            })
            lspconfig.lemminx.setup({
                capabilities = capabilities
            })


            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<a-cr>", vim.lsp.buf.code_action, {})
        end,
    },
}
