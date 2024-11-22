local function buffer_name()
    local name = vim.fn.expand('%')
    if vim.bo.filetype == 'oil' then
        name = name:gsub('oil://', '', 1)
        name = vim.fn.fnamemodify(name, ':~:.')
        name = name:match('(.*)/') or name
    elseif vim.bo.buftype == 'terminal' then
        local command = name:match('term://.*:(.*)')
        if not command then return name end
        local path = name:match('term://(.*)/%d+:.*')
        if not path then return name end
        path = vim.fn.fnamemodify(path, ':~:.')
        path = path:match('(.*)/') or path
        name = path == '' and command or ('[' .. path .. ']: ' .. command)
    end

    return name
end

local function get_readonly()
    if vim.bo.readonly then
        return '[RO]'
    end
    return ''
end

local function get_modified()
    if vim.bo.modified then
        return '[+]'
    end
    if not vim.bo.modifiable then
        return '[-]'
    end
    return ''
end

local function buffer_flags()
    return table.concat({get_readonly(), get_modified()})
end

return {
    'ojroques/nvim-hardline',

    dependencies = {
       'justinhj/battery.nvim',
    },

    config = function()
        require('hardline').setup({
            bufferline = false,  -- disable bufferline
            bufferline_settings = {
                exclude_terminal = true,  -- don't show terminal buffers in bufferline
                show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
            },
            theme = 'gruvbox_minimal',   -- change theme
            sections = {         -- define sections
                {class = 'high', item = function() return vim.fn.strftime('%H:%M') end}, -- time
                {class = 'low', item = require('battery').get_status_line}, -- battery
                {class = 'bufferline', item = buffer_name},
                {class = 'bufferline', item = buffer_flags},
                '%<',
                {class = 'med', item = '%='},
                {class = 'error', item = require('hardline.parts.lsp').get_error},
                {class = 'warning', item = require('hardline.parts.lsp').get_warning},
                {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
                {class = 'mode', item = require('hardline.parts.mode').get_item},
            },
        })
    end
}
