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

return M
