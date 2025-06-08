local M = {}

--- Dims color, taking into account the bg
---@param color string
---@param val number
---@return string
M.dim = function(color, val)
    color = string.sub(color, 2)
    local colorrgb = {
        r = tonumber(string.sub(color, 1, 2), 16), -- convert to number hexadecimal number
        g = tonumber(string.sub(color, 3, 4), 16), -- convert to number hexadecimal number
        b = tonumber(string.sub(color, 5, 6), 16), -- convert to number hexadecimal number
    }

    local out = {}
    for i, e in pairs(colorrgb) do
        out[i] = string.format("%.2x", e * val):sub(1, 2)
    end

    return table.concat({
        "#",
        out["r"],
        out["g"],
        out["b"],
    })
end

M.merge = function(color, base, val)
    color = string.sub(color, 2)
    base = string.sub(base, 2)

    local colorrgb = {
        r = tonumber(string.sub(color, 1, 2), 16),
        g = tonumber(string.sub(color, 3, 4), 16),
        b = tonumber(string.sub(color, 5, 6), 16),
    }

    local basergb = {
        r = tonumber(string.sub(base, 1, 2), 16),
        g = tonumber(string.sub(base, 3, 4), 16),
        b = tonumber(string.sub(base, 5, 6), 16),
    }

    local out = {}
    for i, _ in pairs(colorrgb) do
        out[i] = math.floor(colorrgb[i] * val + basergb[i] * (1 - val))
    end

    for i, value in pairs(out) do
        out[i] = string.format("%.2x", value):sub(1, 2)
    end

    return table.concat({
        "#",
        out["r"],
        out["g"],
        out["b"],
    })
end

M.parse_palette = function()
    local c = require("custom16").get_palette()

    local p = {
        bg = c.main[1],
        red = c.main[2],
        green = c.main[3],
        yellow = c.main[4],
        blue = c.main[5],
        magenta = c.main[6],
        teal = c.main[7],
        fg = c.main[8],
        bg1 = c.main[9],
        red1 = c.main[10],
        green1 = c.main[11],
        yellow1 = c.main[12],
        blue1 = c.main[13],
        magenta1 = c.main[14],
        teal1 = c.main[15],
        fg1 = c.main[16],

        accent = c.extras["accent"],
        comment = c.extras["comment"],
        split = c.extras["split"],
        cursorline = c.extras["cursorline"],
        inactivelinenr = c.extras["inactivelinenr"],
    }
    p.bgfg = M.merge(p.bg, p.fg, 0.7)
    p.dimmed_bg = M.dim(p.bg, 0.5)
    p.mid_bg = M.merge(p.comment, p.bg, 0.5)
    p.dimmed_fg = M.dim(p.fg, 0.5)
    p.very_dimmed_fg = M.dim(p.fg, 0.3)
    p.dimmed_accent = M.dim(p.accent, 0.7)
    p.very_dimmed_accent = M.dim(p.accent, 0.3)

    p.bo = "bold"
    p.re = "reverse"
    p.it = "italic"
    p.ul = "underline"
    p.st = "strikethrough"
    p.no = nil

    p.hl_bg_light = { fg = c.no, bg = M.merge(p.comment, p.bg, 0.15) }
    p.hl_bg = { fg = c.no, bg = p.mid_bg }

    return p
end

return M
