return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local config = require("nvim-treesitter.configs")

            config.setup({
                ensure_installed = { "lua", "javascript", "php", "java", "typescript", "html", "css", "markdown", "bash" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "sn",
                        node_incremental = "sn",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end
    }
}
