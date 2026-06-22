-- Local theme engine
local theme = {}
local config = require('theme.config')
local colors = require('theme.theme')
local utils = require('theme.utils')

-- Pass setup to config module
theme.setup = config.setup

-- Load colorscheme with a given or default style
---@param style? string
theme.load = function(style)
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'theme'
    if config.opts.terminal_colors then
        utils.terminal(require('theme.colors').get_colors())
    end

    local background = style or config.opts.style
    if background then
        vim.o.background = background
    end

    colors.set_highlights(config.opts)
    colors.link_highlight()

    if config.opts.group_overrides then
        for group, val in pairs(config.opts['group_overrides']) do
            vim.api.nvim_set_hl(0, group, val)
        end
    end
end

return theme
