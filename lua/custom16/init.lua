---Takes a name and a value and sets the hl group
---@param name string
---@param value table|string
local function set_hl(name, value)
    if type(value) == "string" then
        vim.api.nvim_set_hl(0, name, { link = value })
    else
        vim.api.nvim_set_hl(0, name, value)
    end
end

local M = {}

M.setup = function(opts)
    _G.custom16_palette_path = opts.palette_path or "custom16_palette"
    vim.cmd.colorscheme("custom16")
end

M.get_palette = function()
    return _G.custom16_palette
end

M.set_colors = function()
    _G.custom16_palette = require(_G.custom16_palette_path)

    -- -- reset colors
    -- if vim.g.colors_name then
    --     vim.cmd.hi("clear")
    -- end
    vim.g.colors_name = "custom16"
    vim.o.termguicolors = true

    package.loaded["custom16.highlight_groups"] = nil
    local hls = require("custom16.highlight_groups")

    for name, value in pairs(hls) do
        set_hl(name, value)
    end
end

return M
