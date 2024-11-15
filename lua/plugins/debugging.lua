return {
	"mfussenegger/nvim-dap",
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- just want to make sure that we have dap and dapui
		local has_dap, dap = pcall(require, "dap")
		if not has_dap then
			return
		end

		local has_dap_ui, dapui = pcall(require, "dapui")
		if not has_dap_ui then
			return
		end

		dap.adapters.php = {
			type = "executable",
			command = "node",
			-- change this to where you build vscode-php-debug
			args = { os.getenv("HOME") .. "/php-debug/out/phpDebug.js" },
		}

		dap.configurations.php = {
			-- to run php right from the editor
			{
				name = "run current script",
				type = "php",
				request = "launch",
				port = 9003,
				cwd = "${fileDirname}",
				program = "${file}",
				runtimeExecutable = "php",
			},
			-- to listen to any php call
			{
				name = "listen for Xdebug local",
				type = "php",
				request = "launch",
				port = 9003,
			},
			-- to listen to php call in docker container
			{
				name = "listen for Xdebug docker",
				type = "php",
				request = "launch",
				port = 9003,
				-- this is where your file is in the container
				pathMappings = {
					["/var/www/html/webapp/"] = "${workspaceFolder}",
					["/var/www/html/"] = "${workspaceFolder}",
				},
			},
		}

		-- toggle the UI elements after certain events
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		dapui.setup()

		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		map("n", "<F5>", require("dap").continue, {})
		map("n", "<F10>", require("dap").step_over, {})
		map("n", "<F11>", require("dap").step_into, {})
		map("n", "<F12>", require("dap").step_out, {})
		map("n", "<leader>b", require("dap").toggle_breakpoint, {})
		map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", {})

		-- you'll want this because we don't want xdebug to start automatically everytime
		function insert_xdebug()
			local pos = vim.api.nvim_win_get_cursor(0)[2]
			local line = vim.api.nvim_get_current_line()
			local nline = line:sub(0, pos) .. "xdebug_break();" .. line:sub(pos + 1)
			vim.api.nvim_set_current_line(nline)
		end

		map("n", "<leader>ds", "<cmd>lua insert_xdebug()<cr>")

		-- Highlighting breakpoints
		vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define("DapLogPoint", {
			text = "",
			texthl = "DapLogPoint",
			linehl = "DapLogPoint",
			numhl = "DapLogPoint",
		})
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)
	end,
}
