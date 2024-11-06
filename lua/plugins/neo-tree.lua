return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker"
	},
	config = function()
        vim.api.nvim_set_keymap('n', '<A-1>', ':Neotree toggle<CR>', { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end
}
