return {
	{
		"b0o/incline.nvim",

		enabled = false,
		config = function()
			-- require('incline').setup()
			require("configs.incline")
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
}
