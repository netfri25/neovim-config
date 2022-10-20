local path = 'user/pluginconf/'
local plugins = vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/' .. path)

for _, plugin in ipairs(plugins) do
	if plugin ~= 'init.lua' then
		local ok, err = pcall(require, path .. plugin:gsub('%.lua$', ''))
		if not ok then
			vim.api.nvim_err_writeln('unable to load ' .. plugin .. ': ' .. err)
		end
	end
end
