local utils = require("custom16.colors")
local c = utils.parse_palette()

---Flattens a table containing dict-like elements.
---@param tbl table
---@return table
local function flatten_raw(tbl)
    local result = {}
    for i = 1, #tbl do
        local dict = tbl[i]
        for k, v in pairs(dict) do
            result[k] = v
        end
    end
    return result
end

local type_to_color = {
    ["Comment"] = c.comment,
    ["Variable"] = c.blue,
    ["Constant"] = c.fg,
    ["String"] = c.green,
    ["Character"] = c.green1,
    ["Boolean"] = c.yellow1,
    ["Number"] = c.teal,
    ["Float"] = c.teal,
    ["Identifier"] = c.magenta,
    ["Function"] = c.green,
    ["Label"] = c.red,
    ["Operator"] = c.fg,
    ["Keyword"] = c.red,
    ["Exception"] = c.red,
    ["Include"] = c.yellow,
    ["Define"] = c.red1,
    ["Macro"] = c.red,
    ["Type"] = c.yellow,
    ["Structure"] = c.yellow,
    ["Error"] = c.red,
    ["Todo"] = c.magenta,
    ["Statement"] = c.red,
    ["Special"] = c.yellow,
}

local defaults = {}

---Returns an highlight group with dimmed bg
---@param color string
---@param dim? number
local function dimmed_bg(color, dim, ...)
    return { fg = color, bg = utils.merge(color, c.bg, dim or 0.3) }
end

---Returns an highlight group for diff files
---@param color string
---@param dim? number
local function diff_bg(color, dim, ...)
    return { fg = color, bg = utils.dim(color, dim or 0.45) }
end

local base = require("custom16.highlight_groups.base")
local treesitter = require("custom16.highlight_groups.treesitter")
local plugins = require("custom16.highlight_groups.plugins")

local md_headers = { c.red, c.yellow, c.green, c.blue, c.teal, c.magenta }
for i, color in ipairs(md_headers) do
    treesitter[table.concat({ "@markup.heading.", i, ".markdown" })] = { fg = color, bg = c.no, bold = true }
    treesitter[table.concat({ "Headline", i })] = dimmed_bg(color)
end

local hl_groups = {
    base,
    treesitter,
    plugins,
}

return flatten_raw(hl_groups)
