local utils = require("custom16.colors")
local c = utils.parse_palette()

return {
    ----------------
    -- Completion --
    ----------------
    ["BlinkCmpMenu"] = { fg = c.no, bg = c.no },
    ["BlinkCmpLabel"] = { fg = c.fg, bg = c.no },
    ["BlinkCmpLabelDeprecated"] = { fg = c.no, bg = c.no, strikethrough = true },
    ["BlinkCmpLabelMatch"] = { fg = c.accent },
    ["BlinkCmpMenuSelection"] = c.hl_bg_light,
    ["BlinkCmpDoc"] = "NormalFloat",
    ["BlinkCmpDocBorder"] = "FloatBorder",
    ["BlinkCmpDocCursorLine"] = "Visual",
    ["BlinkCmpSignatureHelp"] = "NormalFloat",
    ["BlinkCmpSignatureHelpBorder"] = "FloatBorder",
    ["BlinkCmpSignatureHelpActiveParameter"] = "LspSignatureActiveParameter",

    ["BlinkCmpKind"] = { fg = c.comment, bg = c.no, bold = true },
    ["BlinkCmpKindField"] = "Variable",
    ["BlinkCmpKindProperty"] = "Variable",
    ["BlinkCmpKindEvent"] = "PreProc",
    ["BlinkCmpKindText"] = "Comment",
    ["BlinkCmpKindEnum"] = { fg = c.yellow, bg = c.no, bold = true },
    ["BlinkCmpKindKeyword"] = "Keyword",
    ["BlinkCmpKindConstant"] = "Constant",
    ["BlinkCmpKindConstructor"] = "Special",
    ["BlinkCmpKindReference"] = "Identifier",
    ["BlinkCmpKindFunction"] = "Function",
    ["BlinkCmpKindStruct"] = "Structure",
    ["BlinkCmpKindClass"] = "Type",
    ["BlinkCmpKindModule"] = { fg = c.magenta1, bg = c.no, bold = true },
    ["BlinkCmpKindOperator"] = "Operator",
    ["BlinkCmpKindVariable"] = "Variable",
    ["BlinkCmpKindFile"] = "Identifier",
    ["BlinkCmpKindUnit"] = "Number",
    ["BlinkCmpKindSnippet"] = "Macro",
    ["BlinkCmpKindFolder"] = "Todo",
    ["BlinkCmpKindMethod"] = "Function",
    ["BlinkCmpKindValue"] = "Variable",
    ["BlinkCmpKindEnumMember"] = "Constant",
    ["BlinkCmpKindInterface"] = "Type",
    ["BlinkCmpKindColor"] = { fg = c.teal, bg = c.no, bold = true },
    ["BlinkCmpKindTypeParameter"] = "Variable",

    -- ===============
    -- ===== FZF =====
    -- ===============
    ["FzfLuaNormal"] = { fg = c.fg, bg = c.bg },
    ["FzfLuaFzfNormal"] = "FzfLuaNormal",
    ["FzfLuaFzfCursorLine"] = "CursorLine",
    ["FzfLuaFzfPrompt"] = { fg = c.accent, bg = c.no, bold = true, italic = true },
    ["FzfLuaFzfMatch"] = "Accent",
    ["FzfLuaFzfBorder"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfScrollbar"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfSeparator"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfGutter"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfHeader"] = { fg = c.accent, bg = c.no },
    ["FzfLuaFzfInfo"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfPointer"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfMarker"] = { fg = c.no, bg = c.no },
    ["FzfLuaFzfSpinner"] = "Comment",
    -- ["FzfLuaFzfPrompt"] = { fg = c.no, bg = c.no,  },
    ["FzfLuaFzfQuery"] = { fg = c.no, bg = c.no },

    -- ==================
    -- ===== SNACKS =====
    -- ==================
    ["SnacksIndentScope"] = { fg = c.accent, bg = c.no },

    -- ================
    -- ===== LAZY =====
    -- ================
    ["LazyButtonActive"] = { fg = c.accent, bg = c.no, bold = true, italic = true },

    -- ======================
    -- ===== Mini.icons =====
    -- ======================
    ["MiniIconsAzure"] = { fg = utils.dim(c.blue, 1.1), bg = c.no },
    ["MiniIconsBlue"] = { fg = c.blue, bg = c.no },
    ["MiniIconsCyan"] = { fg = c.teal, bg = c.no },
    ["MiniIconsGreen"] = { fg = c.green, bg = c.no },
    ["MiniIconsGrey"] = { fg = c.comment, bg = c.no },
    ["MiniIconsOrange"] = { fg = c.yellow1, bg = c.no },
    ["MiniIconsPurple"] = { fg = c.magenta, bg = c.no },
    ["MiniIconsRed"] = { fg = c.red, bg = c.no },
    ["MiniIconsYellow"] = { fg = c.yellow, bg = c.no },

    -- =======================
    -- ===== DEBUGMASTER =====
    -- =======================
    ["dCursor"] = { fg = c.green, bg = c.green },
    ["DapUIBreakpointsInfo"] = { fg = c.green, bg = c.no },
    ["DapUIBreakpointsPath"] = { fg = c.blue, bg = c.no },
    ["DapUIBreakpointsLine"] = { fg = c.blue, bg = c.no },
    ["DapUIFieldValue"] = { fg = c.blue, bg = c.no, bold = true },
    ["DapUIModifiedValue"] = { fg = c.blue, bg = c.no, bold = true },
    ["DapUICurrentFrameName"] = { fg = c.green, bg = c.no },
    ["DapUISource"] = { fg = c.magenta, bg = c.no },
    ["DapUIType"] = { fg = c.magenta, bg = c.no },
    ["DapUIDecoration"] = { fg = c.blue, bg = c.no },
    ["DapUIScope"] = { fg = c.blue, bg = c.no },
    ["DapUIStoppedThread"] = { fg = c.blue, bg = c.no },
    ["DapUILineNumber"] = { fg = c.blue, bg = c.no },
    ["DapUIWatchesEmpty"] = { fg = c.magenta1, bg = c.no },
    ["DapUIWatchesValue"] = { fg = c.green, bg = c.no },
    ["DapUINormal"] = { fg = c.fg, bg = c.bg },
    ["DapUIPlayPause"] = { fg = c.green, bg = c.bg },
    ["DapUIRestart"] = { fg = c.green, bg = c.bg },
    ["DapUIStepBack"] = { fg = c.blue, bg = c.bg },
    ["DapUIStepInto"] = { fg = c.blue, bg = c.bg },
    ["DapUIStepOver"] = { fg = c.blue, bg = c.bg },
    ["DapUIStepOut"] = { fg = c.blue, bg = c.bg },
    ["DapUIUnavailable"] = { fg = c.comment, bg = c.bg },
    ["DapUIStop"] = { fg = c.magenta, bg = c.bg },
    ["DapUIPlayPauseNC"] = "DapUIPlayPause",
    ["DapUIRestartNC"] = "DapUIRestart",
    ["DapUIStepBackNC"] = "DapUIStepBack",
    ["DapUIStepIntoNC"] = "DapUIStepInto",
    ["DapUIStepOutNC"] = "DapUIStepOut",
    ["DapUISidebar"] = { fg = c.fg, bg = c.bg },

    -- ====================
    -- ===== WHICHKEY =====
    -- ====================
    ["WhichKeyGroup"] = { fg = c.blue, bg = c.no, bold = true },
    ["WhichKeyDesc"] = { fg = c.fg, bg = c.no },
    ["WhichKey"] = { fg = c.accent, bg = c.no },
    ["WhichKeySeparator"] = "Comment",

    -- =========================
    -- ===== COMMENTS.NVIM =====
    -- =========================
    ["ErrorComment"] = { fg = c.red, bg = c.no, italic = true },
    ["WarningComment"] = { fg = c.yellow, bg = c.no },
    ["InfoComment"] = { fg = c.green, bg = c.no },
    ["HintComment"] = { fg = c.blue, bg = c.no },
    ["TodoComment"] = { fg = c.blue, bg = c.no },

    -- ===================
    -- ===== RAINBOW =====
    -- ===================
    ["RainbowDelimiterRed"] = { fg = c.red, bg = c.no },
    ["RainbowDelimiterYellow"] = { fg = c.yellow, bg = c.no },
    ["RainbowDelimiterBlue"] = { fg = c.blue, bg = c.no },
    ["RainbowDelimiterOrange"] = { fg = c.yellow1, bg = c.no },
    ["RainbowDelimiterGreen"] = { fg = c.green, bg = c.no },
    ["RainbowDelimiterViolet"] = { fg = c.magenta, bg = c.no },
    ["RainbowDelimiterCyan"] = { fg = c.teal, bg = c.no },

    -- ====================
    -- ===== GITSIGNS =====
    -- ====================
    ["DiffAdd"] = { fg = c.green, bg = c.no },
    ["DiffChange"] = { fg = c.blue, bg = c.no },
    ["DiffDelete"] = { fg = c.red, bg = c.no },

    ["GitSignsAdd"] = "DiffAdd",
    ["GitSignsChange"] = "DiffChange",
    ["GitSignsDelete"] = "DiffDelete",
    ["GitSignsChangedelete"] = { fg = c.red1, bg = c.no },
    ["GitSignsTopdelete"] = "DiffDelete",
    ["GitSignsUntracked"] = { fg = c.comment, bg = c.no },
    ["GitSignsChangeLn"] = { fg = c.no, bg = c.no },
    ["GitSignsCurrentLineBlame"] = { fg = c.comment, bg = c.no },
}
