vim.cmd([[
filetype plugin on
" lua require ("init")
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
]])

-- Functions
function DateAuthor()
	local var1 = os.date("%c")
	vim.api.nvim_buf_set_lines(0, 0, 4, false, { "/*", "Author: mili", var1, "*/", "" })
end

-- Next fold
function NextClosedFold(dir)
	local cmd = "norm!z" .. dir
	local view = vim.fn.winsaveview()
	local l0, l, open = 0, view.lnum, true
	while l ~= l0 and open do
		vim.api.nvim_command(cmd)
		l0, l = l, vim.fn.line(".")
		open = vim.fn.foldclosed(l) < 0
	end
	if open then
		vim.fn.winrestview(view)
	end
end

-- Java project maker
function JavaRun()
	local name = vim.split(vim.fn.getline(1), " ")[1]
	local sze = #name
	local projName = string.sub(name, 1, sze - 1)
	local fileName = vim.fn.expand("%:r")
	local binDir = vim.fn.expand("cd %:~:h:h:h:h:h/bin")
	local curDir = vim.fn.getcwd()
	vim.api.nvim_command(binDir)
	vim.api.nvim_command("terminal java " .. projName .. "." .. fileName)
	vim.api.nvim_command("cd " .. curDir)
end

function CppComp1()
	DateAuthor()
	vim.api.nvim_buf_set_lines(0, 3, 3, false, { "#include<bits/stdc++.h>", "using namespace std;", "" })
	vim.api.nvim_command("r ~/.config/nvim/lua/templates/competitive-1.cpp")
end

function CppComp2()
	DateAuthor()
	vim.api.nvim_buf_set_lines(0, 3, 3, false, { "#include<bits/stdc++.h>", "using namespace std;", "" })
	vim.api.nvim_command("r ~/.config/nvim/lua/templates/competitive-2.cpp")
end

function JavaCompRead()
	vim.api.nvim_command("normal! dG")
	local name = vim.fn.expand("%:r")
	local nm = "public class " .. name
	vim.api.nvim_command("r ~/.config/nvim/lua/templates/Read.java")
	vim.api.nvim_buf_set_lines(0, 7, 7, false, { nm })
end

-- For C/C++ header files
function Insert_gates()
	local gatename = string.gsub(string.upper(vim.fn.expand("%:t")), "%.", "_")
	vim.api.nvim_command("normal! i#ifndef " .. gatename)
	vim.api.nvim_command("normal! o#define " .. gatename .. " ")
	vim.api.nvim_command("normal! Go#endif /* " .. gatename .. " */")
	vim.api.nvim_command("normal! kk")
end

function Insert_glsl()
	vim.api.nvim_command("normal! 7o")
	vim.api.nvim_buf_set_lines(0, 0, 4, false, { "#version 330 core", "", "", "void main() {" })
	vim.api.nvim_buf_set_lines(0, -1, -1, false, { "}", "" })
end

-- Python configs
function Insert_py()
	vim.api.nvim_command("normal! i#!/usr/bin/env python")
	vim.api.nvim_command("normal! o")
	vim.api.nvim_command("normal! o")
	-- Uncomment below if you need main
	-- vim.api.nvim_command("normal! o")
	-- vim.api.nvim_command("normal! oif __name__ == \"__main__\":")
end

-- Insert_sh
function Insert_sh()
	vim.api.nvim_command("normal! i#!/usr/bin/env sh")
	vim.api.nvim_command("normal! o")
	vim.api.nvim_command("normal! o")
end

-- AppendModeline
function AppendModeline()
	local modeline = string.format(
		" vim: set ts=%d sw=%d tw=%d %s :",
		vim.o.tabstop,
		vim.o.shiftwidth,
		vim.o.textwidth,
		vim.o.expandtab and "" or "no"
	)
	modeline = vim.fn.substitute(vim.o.commentstring, "%s", modeline, "")
	vim.api.nvim_command(string.format("call append(line('$'), '%s')", modeline))
end

vim.api.nvim_set_keymap("n", "<Leader>ml", ":call AppendModeline()<CR>", { silent = true })

-- GenerateFlags
function GenerateFlags()
	require("notify")("Compile flags generated", nil, { title = "Clangd Flags", timeout = 500 })
	vim.api.nvim_command("LspRestart")
	vim.api.nvim_command("NvimTreeRefresh")
end

-- MakeRun
function MakeRun()
	local var = vim.fn.system("grep PROG Makefile | awk '{print $3}'")
	vim.api.nvim_command("!make")
	vim.api.nvim_command(string.format(":vsp | terminal ./%s", var))
end
