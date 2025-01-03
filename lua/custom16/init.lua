---Takes a name and a value and sets the hl group
---@param name string
---@param value table|string
local function set_hl(name, value)
    if type(value) == "string" then
        vim.api.nvim_set_hl(0, name, { link = value })
    else
        local args = {}
        args["fg"] = value["fg"]
        args["bg"] = value["bg"]
        args["sp"] = value["sp"]

        if value["extras"] ~= nil then
            for _, extra in pairs(value["extras"]) do
                args[extra] = true
            end
        end

        -- print("Setting " .. name .. " As " .. vim.inspect(args))
        args.force = true
        vim.api.nvim_set_hl(0, name, args)
    end
end

local M = {}
local term_cmd

M.setup = function(opts)
    _G.custom16_palette_path = opts.palette_path or "custom16_palette"
    if opts.reload_terminal_cmd then
        _G.custom16_reload_terminal_cmd = "silent !" .. opts.reload_terminal_cmd .. "&"
    end
    vim.cmd.colorscheme("custom16")
end

M.get_palette = function()
    return _G.custom16_palette
end

M.set_colors = function()
    _G.custom16_palette = require(_G.custom16_palette_path)

    -- reset colors
    if vim.g.colors_name then
        vim.cmd.hi("clear")
    end
    vim.g.colors_name = "custom16"
    vim.o.termguicolors = true

    package.loaded["custom16.highlight_groups.main"] = nil
    local hls = require("custom16.highlight_groups.main")

    for name, value in pairs(hls) do
        set_hl(name, value)
    end
end

return M
