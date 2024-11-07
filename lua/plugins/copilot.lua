-- Copilot autocomplete plugins

return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap('i', '<A-CR>', 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
    end,
}
