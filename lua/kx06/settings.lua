-- Disable vim.tbl_flatten deprecation warning specifically
if vim.deprecate then
	local orig_deprecate = vim.deprecate
	vim.deprecate = function(name, alt, version, plugin, backtrace)
		if name == "vim.tbl_flatten" then
			return
		end
		return orig_deprecate(name, alt, version, plugin, backtrace)
	end
end

if vim.fn.has("nvim-0.10") == 1 then
	rawset(vim, "tbl_flatten", function(t)
		return vim.iter(t):flatten(math.huge):totable()
	end)
end

local global = vim.g
local o = vim.opt

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true
o.wrap = false
