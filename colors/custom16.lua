package.loaded["custom16"] = nil
package.loaded[_G.custom16_palette_path] = nil

if _G.custom16_reload_terminal_cmd ~= nil then
    vim.cmd(_G.custom16_reload_terminal_cmd)
end

require("custom16").set_colors()
