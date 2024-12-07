local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end
vim.g.skip_ts_context_commentstring_module = true
local status_ts_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if status_ts_ok then
	ts_context_commentstring.setup({})
end

comment.setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")
		local location = nil

		if ctx.ctype == U.ctype.block then
			-- Block comment
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			-- Visual mode
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
