local c = require("custom16").get_palette()
local utils = require("custom16.colors")

c.bo = "bold"
c.re = "reverse"
c.it = "italic"
c.ul = "underline"
c.st = "strikethrough"
c.no = nil

local hl_groups = {}

local bg = c.main[1]
local red = c.main[2]
local green = c.main[3]
local yellow = c.main[4]
local blue = c.main[5]
local magenta = c.main[6]
local teal = c.main[7]
local fg = c.main[8]
local bg1 = c.main[9]
local red1 = c.main[10]
local green1 = c.main[11]
local yellow1 = c.main[12]
local blue1 = c.main[13]
local magenta1 = c.main[14]
local teal1 = c.main[15]
local fg1 = c.main[16]

local accent = c.extras["accent"]
local comment = c.extras["comment"]
local split = c.extras["split"]
local cursorline = c.extras["cursorline"]
local inactivelinenr = c.extras["inactivelinenr"]

local dimmed_red = utils.merge(red, bg, 0.5)
local dimmed_yellow = utils.merge(yellow, bg, 0.5)
local dimmed_blue = utils.merge(blue, bg, 0.5)
local dimmed_teal = utils.merge(teal, bg, 0.5)
local dimmed_magenta = utils.merge(magenta, bg, 0.5)

local nontext = utils.merge(comment, bg, 0.5)
local hl_bg_light = { fg = c.no, bg = utils.merge(comment, bg, 0.15), {} }
local hl_bg = { fg = c.no, bg = nontext, {} }

---Returns an highlight group with dimmed bg
---@param color string
---@param dim? number
---@param opts? table
local function dimmed_bg(color, dim, opts)
    return { fg = color, bg = utils.merge(color, bg, dim or 0.3), extras = opts or {} }
end

---Returns an highlight group for diff files
---@param color string
---@param dim? number
---@param opts? table
local function diff_bg(color, dim, opts)
    return { fg = color, bg = utils.dim(color, dim or 0.45), extras = opts or {} }
end

local type_to_color = {
    ["Comment"] = comment,
    ["Variable"] = blue,
    ["Constant"] = fg,
    ["String"] = green,
    ["Character"] = green1,
    ["Boolean"] = yellow1,
    ["Number"] = teal,
    ["Float"] = teal,
    ["Identifier"] = magenta,
    ["Function"] = green,
    ["Label"] = red,
    ["Operator"] = fg,
    ["Keyword"] = red,
    ["Exception"] = red,
    ["Include"] = yellow,
    ["Define"] = red1,
    ["Macro"] = red,
    ["Type"] = yellow,
    ["Structure"] = yellow,
    ["Error"] = red,
    ["Todo"] = magenta,
    ["Statement"] = red,
    ["Special"] = yellow,
}

hl_groups = {
    ["Accent"] = { fg = fg, bg = c.no, extras = {} },
    ["Inactive"] = { fg = comment, bg = c.no, extras = {} },

    ----------------
    -- Statusline --
    ----------------
    ["NormalMode"] = { fg = bg, bg = green, extras = { c.bo } },
    ["VisualMode"] = { fg = bg, bg = magenta, extras = { c.bo } },
    ["SelectMode"] = { fg = bg, bg = magenta1, extras = { c.bo } },
    ["InsertMode"] = { fg = bg, bg = yellow, extras = { c.bo } },
    ["ReplaceMode"] = { fg = bg, bg = teal, extras = { c.bo } },
    ["CommandMode"] = { fg = bg, bg = yellow1, extras = { c.bo } },
    ["ExMode"] = { fg = bg, bg = blue1, extras = { c.bo } },
    ["PromptMode"] = { fg = bg, bg = yellow1, extras = { c.bo } },
    ["TerminalMode"] = { fg = bg, bg = yellow1, extras = { c.bo } },
    ["UnknownMode"] = { fg = bg, bg = red, extras = { c.bo } },
    ["StatusLine"] = { fg = fg, bg = bg, extras = {} },
    ["StatusLineDim"] = { fg = comment, bg = bg, extras = {} },
    ["StatusBar"] = { fg = fg, bg = bg, extras = {} },
    ["WinBar"] = { fg = fg, bg = bg, extras = { c.bo } },
    ["WinBarNC"] = { fg = comment, bg = bg, extras = {} },
    ["StatusBarIcon"] = { fg = fg, bg = bg, extras = {} },
    ["StatusLineNC"] = { fg = comment, bg = bg, extras = {} },
    ["StatusLineSep"] = { fg = accent, bg = bg, extras = {} },
    ["LspServer"] = { fg = accent, bg = bg, extras = {} },
    ["StatusLineError"] = { fg = red, bg = bg, extras = {} },
    ["StatusLineWarn"] = { fg = yellow, bg = bg, extras = {} },
    ["StatusLineInfo"] = { fg = green, bg = bg, extras = {} },
    ["StatusLineHint"] = { fg = blue, bg = bg, extras = {} },

    ["HomeRed"] = { fg = red, bg = c.no, extras = { c.bo } },
    ["HomeTeal"] = { fg = teal, bg = c.no, extras = { c.bo } },
    ["HomeMagenta"] = { fg = magenta, bg = c.no, extras = { c.bo } },
    ["HomeBlue"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["HomeGreen"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["HomeYellow"] = { fg = yellow, bg = c.no, extras = { c.bo } },
    ["HomeWhite"] = { fg = fg, bg = c.no, extras = { c.bo } },
    ["HomeGrey"] = { fg = comment, bg = c.no, extras = { c.bo } },
    ["HomeBlueGrey"] = { fg = utils.merge(blue, comment, 0.5), bg = c.no, extras = { c.bo } },
    ["HomeIcon"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["HomeText"] = { fg = fg, bg = c.no, extras = { c.bo } },
    ["HomeMapping"] = { fg = comment, bg = c.no, extras = { c.bo } },
    ["HomeDarkYellow"] = { fg = utils.dim(yellow, 0.6), bg = c.no, extras = { c.bo } },
    ["HomeDarkYellow1"] = { fg = utils.dim(yellow, 0.7), bg = c.no, extras = { c.bo } },
    ["HomeDarkYellow2"] = { fg = utils.dim(yellow, 0.8), bg = c.no, extras = { c.bo } },
    ["HomeDarkYellow3"] = { fg = utils.dim(yellow, 0.9), bg = c.no, extras = { c.bo } },

    -------------------
    -- Comments.nvim --
    -------------------
    ["ErrorComment"] = { fg = red, bg = c.no, extras = { c.it } },
    ["WarningComment"] = { fg = yellow, bg = c.no, extras = {} },
    ["InfoComment"] = { fg = green, bg = c.no, extras = {} },
    ["HintComment"] = { fg = blue, bg = c.no, extras = {} },
    ["TodoComment"] = { fg = blue, bg = c.no, extras = {} },

    -------------
    -- Rainbow --
    -------------
    ["RainbowDelimiterRed"] = { fg = red, bg = c.no, extras = {} },
    ["RainbowDelimiterYellow"] = { fg = yellow, bg = c.no, extras = {} },
    ["RainbowDelimiterBlue"] = { fg = blue, bg = c.no, extras = {} },
    ["RainbowDelimiterOrange"] = { fg = yellow1, bg = c.no, extras = {} },
    ["RainbowDelimiterGreen"] = { fg = green, bg = c.no, extras = {} },
    ["RainbowDelimiterViolet"] = { fg = magenta, bg = c.no, extras = {} },
    ["RainbowDelimiterCyan"] = { fg = teal, bg = c.no, extras = {} },

    ---------------
    -- Vim bases --
    ---------------
    ["Normal"] = { fg = fg, bg = bg, extras = {} },
    ["Bold"] = { fg = c.no, bg = c.no, extras = { c.bo } },
    ["Italic"] = { fg = c.no, bg = c.no, extras = { c.it } },
    ["Underlined"] = { fg = c.no, bg = c.no, extras = { c.ul } },
    ["ColorColumn"] = hl_bg,
    ["Conceal"] = { fg = comment, bg = c.no, extras = {} },
    ["Cursor"] = { fg = c.no, bg = c.no, extras = { c.re } },
    ["CursorIM"] = { fg = c.no, bg = c.no, extras = {} },
    ["CursorColumn"] = { fg = c.no, bg = cursorline, extras = {} },
    ["CursorLine"] = { fg = c.no, bg = cursorline, extras = {} },
    ["Directory"] = { fg = blue, bg = c.no, extras = {} },
    ["ErrorMsg"] = { fg = red, bg = c.no, extras = {} },
    ["VertSplit"] = { fg = split, bg = c.no, extras = {} },
    ["Folded"] = { fg = comment, bg = c.no, extras = {} },
    ["FoldColumn"] = { fg = comment, bg = c.no, extras = {} },
    ["Search"] = hl_bg,
    ["IncSearch"] = hl_bg,
    ["LineNr"] = { fg = inactivelinenr, bg = c.no, extras = {} },
    ["CursorLineNr"] = { fg = accent, bg = c.no, extras = {} },
    ["MatchParen"] = { fg = c.no, bg = comment, extras = {} },
    ["ModeMsg"] = { fg = c.no, bg = c.no, extras = {} },
    ["MoreMsg"] = { fg = c.no, bg = c.no, extras = {} },
    ["NonText"] = { fg = nontext, bg = c.no, extras = {} },
    ["Pmenu"] = { fg = fg, bg = bg, extras = {} },
    ["PMenuSel"] = hl_bg_light,
    ["PMenuSbar"] = { fg = c.no, bg = c.no, extras = {} },
    ["PMenuThumb"] = { fg = c.no, bg = c.no, extras = {} },
    ["Question"] = { fg = c.no, bg = c.no, extras = {} },
    ["SpecialKey"] = { fg = c.no, bg = c.no, extras = {} },
    ["Whitespace"] = { fg = comment, bg = c.no, extras = {} },
    ["Title"] = { fg = accent, bg = c.no, extras = {} },
    ["Visual"] = { fg = c.no, bg = c.no, extras = { c.re } },
    ["Syntax"] = { fg = c.no, bg = c.no, extras = {} },
    ["VisualNOS"] = { fg = c.no, bg = c.no, extras = {} },
    ["WarningMsg"] = { fg = c.no, bg = c.no, extras = {} },
    ["TooLong"] = { fg = red, bg = c.no, extras = {} },
    ["WildMenu"] = { fg = c.no, bg = c.no, extras = {} },
    ["SignColumn"] = { fg = c.no, bg = c.no, extras = {} },
    ["QuickFixLine"] = { fg = c.no, bg = c.no, extras = {} },
    ["healthSuccess"] = { fg = green, bg = c.no, extras = {} },
    ["WinSeparator"] = { fg = split, bg = c.no, extras = {} },
    ["EndOfBuffer"] = { fg = comment, bg = c.no, extras = {} },
    ["TabLineFill"] = { fg = c.no, bg = c.no, extras = {} },
    ["TabLine"] = { fg = fg, bg = c.no, extras = {} },
    ["TabLineSel"] = { fg = accent, bg = c.no, extras = { c.re } },

    --------------
    -- Defaults --
    --------------
    ["Comment"] = { fg = type_to_color["Comment"], bg = c.no, extras = {} },
    ["Variable"] = { fg = type_to_color["Variable"], bg = c.no, extras = {} },
    ["Constant"] = { fg = type_to_color["Constant"], bg = c.no, extras = {} },
    ["String"] = { fg = type_to_color["String"], bg = c.no, extras = {} },
    ["Character"] = { fg = type_to_color["Character"], bg = c.no, extras = {} },
    ["Boolean"] = { fg = type_to_color["Boolean"], bg = c.no, extras = {} },
    ["Number"] = { fg = type_to_color["Number"], bg = c.no, extras = {} },
    ["Float"] = { fg = type_to_color["Float"], bg = c.no, extras = {} },
    ["Identifier"] = { fg = type_to_color["Identifier"], bg = c.no, extras = { c.bo } },
    ["Function"] = { fg = type_to_color["Function"], bg = c.no, extras = { c.bo } },
    ["Label"] = { fg = type_to_color["Label"], bg = c.no, extras = {} },
    ["Operator"] = { fg = type_to_color["Operator"], bg = c.no, extras = { c.bo } },
    ["Keyword"] = { fg = type_to_color["Keyword"], bg = c.no, extras = {} },
    ["Exception"] = { fg = type_to_color["Exception"], bg = c.no, extras = { c.ul } },
    ["Include"] = { fg = type_to_color["Include"], bg = c.no, extras = {} },
    ["Define"] = { fg = type_to_color["Define"], bg = c.no, extras = {} },
    ["Macro"] = { fg = type_to_color["Macro"], bg = c.no, extras = {} },
    ["Type"] = { fg = type_to_color["Type"], bg = c.no, extras = {} },
    ["Structure"] = { fg = type_to_color["Structure"], bg = c.no, extras = { c.bo } },
    ["Error"] = { fg = type_to_color["Error"], bg = c.no, extras = { c.bo, c.ul } },
    ["Statement"] = { fg = type_to_color["Statement"], bg = c.no, extras = { c.bo } },
    ["Special"] = { fg = type_to_color["Special"], bg = c.no, extras = { c.bo } },
    ["Todo"] = "TodoComment",
    ["Delimiter"] = { fg = fg, bg = c.no, extras = {} },
    ["NormalFloat"] = { fg = c.no, bg = bg, extras = {} },
    ["FloatBorder"] = { fg = fg, bg = bg, extras = {} },
    ["SpecialComment"] = { fg = c.no, bg = c.no, extras = {} },

    ----------
    -- Help --
    ----------
    ["helpCommand"] = { fg = green, bg = c.no, extras = {} },
    ["helpExample"] = { fg = blue, bg = c.no, extras = {} },
    ["helpHeader"] = { fg = red, bg = c.no, extras = {} },
    ["helpSectionDelim"] = { fg = comment, bg = c.no, extras = {} },

    ---------------
    -- Telescope --
    ---------------
    ["TelescopeSelection"] = "CursorLine",
    ["TelescopeMultiSelection"] = { fg = accent, bg = c.no, extras = {} },
    ["TelescopeNormal"] = { fg = c.no, bg = c.no, extras = {} },
    ["TelescopeBorder"] = { fg = accent, bg = c.no, extras = {} },
    ["TelescopeMatching"] = { fg = accent, bg = c.no, extras = {} },
    ["TelescopePromptPrefix"] = { fg = accent, bg = c.no, extras = {} },

    --------------
    -- WhichKey --
    --------------
    ["WhichKeyGroup"] = { fg = blue, bg = c.no, extras = {} },
    ["WhichKeyDesc"] = { fg = magenta, bg = c.no, extras = {} },
    ["WhichKey"] = { fg = teal, bg = c.no, extras = {} },
    ["WhichKeySeparator"] = "Comment",

    ---------
    -- LSP --
    ---------
    ["LspCodeLens"] = { fg = comment, bg = c.no, extras = {} },
    ["LspInfoBorder"] = { fg = fg, bg = c.no, extras = {} },
    ["LspReferenceText"] = hl_bg,
    ["LspInlayHint"] = { fg = blue, bg = comment, extras = {} },
    ["SnippetTabstop"] = { fg = c.no, bg = c.no, extras = {} },

    ----------------
    -- Diagnostic --
    ----------------
    ["DiagnosticError"] = { fg = red, bg = c.no, extras = {} },
    ["DiagnosticWarn"] = { fg = yellow, bg = c.no, extras = {} },
    ["DiagnosticInfo"] = { fg = green, bg = c.no, extras = {} },
    ["DiagnosticHint"] = { fg = blue, bg = c.no, extras = {} },

    ["DiagnosticUnderlineError"] = { fg = red, bg = c.no, extras = { c.ul } },
    ["DiagnosticUnderlineWarn"] = { fg = yellow, bg = c.no, extras = { c.ul } },
    ["DiagnosticUnderlineInfo"] = { fg = green, bg = c.no, extras = { c.ul } },
    ["DiagnosticUnderlineHint"] = { fg = blue, bg = c.no, extras = { c.ul } },

    ["DiagnosticFloatingError"] = "DiagnosticError",
    ["DiagnosticFloatingWarn"] = "DiagnosticWarn",
    ["DiagnosticFloatingInfo"] = "DiagnosticInfo",
    ["DiagnosticFloatingHint"] = "DiagnosticHint",
    ["DiagnosticSignError"] = "DiagnosticError",
    ["DiagnosticSignWarn"] = "DiagnosticWarn",
    ["DiagnosticSignInfo"] = "DiagnosticInfo",
    ["DiagnosticSignHint"] = "DiagnosticHint",

    ["DiagnosticVirtualTextError"] = dimmed_bg(red, 0.2),
    ["DiagnosticVirtualTextWarn"] = dimmed_bg(yellow, 0.2),
    ["DiagnosticVirtualTextInfo"] = dimmed_bg(green, 0.2),
    ["DiagnosticVirtualTextHint"] = dimmed_bg(blue, 0.2),

    ----------------
    -- Completion --
    ----------------
    ["BlinkCmpMenu"] = { fg = c.no, bg = c.no, extras = {} },
    ["BlinkCmpLabel"] = { fg = fg, bg = c.no, extras = {} },
    ["BlinkCmpLabelDeprecated"] = { fg = c.no, bg = c.no, extras = { c.st } },
    ["BlinkCmpLabelMatch"] = { fg = accent },
    ["BlinkCmpMenuBorder"] = "Pmenu",
    ["BlinkCmpMenuSelection"] = hl_bg_light,
    ["BlinkCmpDoc"] = "NormalFloat",
    ["BlinkCmpDocBorder"] = "FloatBorder",
    ["BlinkCmpDocCursorLine"] = "Visual",
    ["BlinkCmpSignatureHelp"] = "NormalFloat",
    ["BlinkCmpSignatureHelpBorder"] = "FloatBorder",
    ["BlinkCmpSignatureHelpActiveParameter"] = "LspSignatureActiveParameter",

    ["BlinkCmpKind"] = { fg = comment, bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindField"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindProperty"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindEvent"] = { fg = type_to_color["PreProc"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindText"] = { fg = type_to_color["Comment"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindEnum"] = { fg = yellow, bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindKeyword"] = { fg = type_to_color["Keyword"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindConstant"] = { fg = type_to_color["Constant"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindConstructor"] = { fg = type_to_color["Special"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindReference"] = { fg = type_to_color["Identifier"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindFunction"] = { fg = type_to_color["Function"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindStruct"] = { fg = type_to_color["Structure"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindClass"] = { fg = type_to_color["Type"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindModule"] = { fg = magenta1, bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindOperator"] = { fg = type_to_color["Operator"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindVariable"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindFile"] = { fg = type_to_color["Identifier"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindUnit"] = { fg = type_to_color["Number"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindSnippet"] = { fg = type_to_color["Macro"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindFolder"] = { fg = type_to_color["Todo"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindMethod"] = { fg = type_to_color["Function"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindValue"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindEnumMember"] = { fg = type_to_color["Constant"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindInterface"] = { fg = type_to_color["Type"], bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindColor"] = { fg = teal, bg = c.no, extras = { c.bo } },
    ["BlinkCmpKindTypeParameter"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },

    -------------
    -- Harpoon --
    -------------
    ["HarpoonWindow"] = { fg = c.no, bg = c.no, extras = {} },
    ["HarpoonBorder"] = { fg = blue, bg = c.no, extras = {} },

    ------------------------
    -- LSP SEMANTIC TOKEN --
    ------------------------
    ["@variable"] = "Variable",
    ["@module"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["@lsp.type.variable"] = "Variable",

    -- ZIG
    ["@lsp.type.namespace.zig"] = "Include",

    -- LUA
    ["@constructor.lua"] = "Delimiter",

    ----------------
    -- Treesitter --
    ----------------
    ["TreesitterContextBottom"] = { sp = cursorline, bg = c.no, extras = { c.ul } },
    ["@variable.rust"] = { fg = c.no, bg = c.no, extras = {} },

    -- Tex
    ["texInputFile"] = { fg = blue, bg = c.no, extras = {} },
    ["texMatcherNM"] = { fg = c.no, bg = c.no, extras = { c.it } },
    ["texDelimiter"] = { fg = accent, bg = c.no, extras = { c.it } },
    ["texGroup"] = { fg = red, bg = c.no, extras = { c.bo } },
    ["texMathZoneEnv"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texMathGroup"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texMathZoneTI"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texPartArgTitle"] = { fg = c.no, bg = c.no, extras = { c.bo } },
    ["texEnvArgName"] = { fg = c.no, bg = c.no, extras = { c.bo, c.ul } },
    ["texMathDelim"] = { fg = c.no, bg = c.no, extras = { c.bo } },
    ["texMathArg"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texMathSymbol"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texCmd"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["texCmdEnv"] = { fg = yellow, bg = c.no, extras = { c.bo } },
    ["texMathSub"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["texFileArg"] = { fg = c.no, bg = c.no, extras = { c.ul } },
    ["@markup.math.latex"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["@function.latex"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["@module.latex"] = { fg = yellow, bg = c.no, extras = { c.bo } },
    ["@punctuation.bracket.latex"] = { fg = red, bg = c.no, extras = { c.bo } },

    -- Markdown
    ["@markup.list.markdown"] = { fg = blue, bg = c.no, extras = {} },
    ["@markup.raw.markdown_inline"] = { fg = blue, bg = utils.merge(bg, fg, 0.95), extras = {} },
    ["@markup.raw.block.markdown"] = { fg = c.no, bg = utils.merge(bg, fg, 0.95), extras = {} },
    ["@keyword.directive.markdown"] = { fg = comment, bg = c.no, extras = {} },
    ["CodeBlock"] = { fg = c.no, bg = utils.merge(bg, fg, 0.95), extras = {} },
    ["RenderMarkdownBullet"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["RenderMarkdownUnchecked"] = { fg = comment, bg = c.no, extras = {} },
    ["RenderMarkdownChecked"] = { fg = green, bg = c.no, extras = {} },
    ["RenderMarkdownQuote"] = { fg = accent, bg = c.no, extras = {} },
    ["MarkdownTableBorder"] = { fg = fg, bg = c.no, extras = {} },
    ["RenderMarkdownInfo"] = { fg = blue, bg = c.no, extras = {} },
    ["RenderMarkdownSuccess"] = { fg = green, bg = c.no, extras = {} },
    ["RenderMarkdownHint"] = { fg = teal, bg = c.no, extras = {} },
    ["RenderMarkdownWarn"] = { fg = yellow, bg = c.no, extras = {} },
    ["RenderMarkdownError"] = { fg = red, bg = c.no, extras = {} },
    ["RenderMarkdownLink"] = { fg = blue, bg = c.no, extras = { c.ul, c.it } },
    ["RenderMarkdownMath"] = { fg = accent, bg = c.no, extras = { c.ul, c.it } },

    -- Zsh
    ["zshKSHFunction"] = { fg = type_to_color["Function"], bg = c.no, extras = { c.bo } },
    ["zshVariable"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["zshBrackets"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },
    ["PreProc"] = { fg = type_to_color["Variable"], bg = c.no, extras = { c.bo } },

    -- Sh
    ["shFunctionKey"] = { fg = type_to_color["Keyword"], bg = c.no, extras = { c.bo } },
    ["shFunction"] = { fg = type_to_color["Function"], bg = c.no, extras = { c.bo } },
    ["shDblBrace"] = "SpecialChar",

    -- Default popup
    ["NeogitFloatHeaderHighlight"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["NeogitSectionHeader"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["NeogitPopupActionKey"] = { fg = accent, bg = c.no, extras = { c.it } },
    ["NeogitPopupConfigKey"] = { fg = teal, bg = c.no, extras = { c.it } },
    ["NeogitPopupSwitchKey"] = { fg = blue, bg = c.no, extras = {} },
    ["NeogitPopupOptionKey"] = { fg = green, bg = c.no, extras = {} },
    ["NeogitBranch"] = { fg = accent, bg = c.no, extras = { c.bo, c.it, c.ul } },
    ["NeogitStatusHEAD"] = { fg = fg, bg = c.no, extras = { c.bo } },
    ["NeogitBranchHead"] = "NeogitBranch",
    ["NeogitRemote"] = "NeogitBranch",
    ["NeogitTagName"] = { fg = accent },
    ["NeogitTagDistance"] = { fg = fg },

    ["NeogitPopupSectionTitle"] = { fg = accent, bg = c.no, extras = { c.bo } },

    -- Graph
    ["NeogitGraphAuthor"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["NeogitGraphBlack"] = { fg = bg, bg = c.no, extras = {} },
    ["NeogitGraphBlackBold"] = { fg = bg, bg = c.no, extras = { c.bo } },
    ["NeogitGraphRed"] = { fg = red, bg = c.no, extras = {} },
    ["NeogitGraphRedBold"] = { fg = red, bg = c.no, extras = { c.bo } },
    ["NeogitGraphGreen"] = { fg = green, bg = c.no, extras = {} },
    ["NeogitGraphGreenBold"] = { fg = green, bg = c.no, extras = { c.bo } },
    ["NeogitGraphYellow"] = { fg = yellow, bg = c.no, extras = {} },
    ["NeogitGraphYellowBold"] = { fg = yellow, bg = c.no, extras = { c.bo } },
    ["NeogitGraphBlue"] = { fg = blue, bg = c.no, extras = {} },
    ["NeogitGraphBlueBold"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["NeogitGraphPurple"] = { fg = magenta, bg = c.no, extras = {} },
    ["NeogitGraphPurpleBold"] = { fg = magenta, bg = c.no, extras = { c.bo } },
    ["NeogitGraphCyan"] = { fg = teal, bg = c.no, extras = {} },
    ["NeogitGraphCyanBold"] = { fg = teal, bg = c.no, extras = { c.bo } },
    ["NeogitGraphWhite"] = { fg = fg, bg = c.no, extras = {} },
    ["NeogitGraphWhiteBold"] = { fg = fg, bg = c.no, extras = { c.bo } },
    ["NeogitGraphGray"] = { fg = comment, bg = c.no, extras = {} },
    ["NeogitGraphBoldGray"] = { fg = comment, bg = c.no, extras = { c.bo } },
    ["NeogitGraphOrange"] = { fg = yellow1, bg = c.no, extras = {} },

    -- Commit
    ["NeogitCommitViewHeader"] = { fg = accent, bg = c.no, extras = { c.bo } },
    ["NeogitCommitViewDescription"] = { fg = accent, bg = c.no, extras = { c.it } },

    -- Diff
    ["NeogitDiffContext"] = { fg = fg, bg = bg },
    ["NeogitHunkHeader"] = diff_bg(accent, nil, { c.bo, c.it }),
    ["NeogitDiffHeader"] = diff_bg(accent, nil, { c.bo, c.it, c.ul }),
    ["NeogitDiffAdd"] = diff_bg(green),
    ["NeogitDiffDelete"] = diff_bg(red),

    -- Hunk
    ["NeogitHunkHeaderHighlight"] = "NeogitHunkHeader",
    ["NeogitDiffAddHighlight"] = "NeogitDiffAdd",
    ["NeogitDiffDeleteHighlight"] = "NeogitDiffDelete",
    ["NeogitDiffHeaderHighlight"] = "NeogitDiffHeader",
    ["NeogitHunkHeaderCursor"] = "NeogitHunkHeader",
    ["NeogitDiffContextHighlight"] = "NeogitDiffContext",
    ["NeogitDiffContextCursor"] = "NeogitDiffContext",
    ["NeogitDiffAddCursor"] = "NeogitDiffAdd",
    ["NeogitDiffDeleteCursor"] = "NeogitDiffDelete",
    ["NeogitDiffHeaderCursor"] = "NeogitDiffHeader",

    -- Changes
    ["NeogitChangeModified"] = { fg = magenta },
    ["NeogitChangeModifiedCursor"] = { fg = magenta },
    ["NeogitChangeAdded"] = { fg = green },
    ["NeogitChangeDeleted"] = { fg = red },
    ["NeogitChangeRenamed"] = { fg = blue },
    ["NeogitChangeUpdated"] = { fg = magenta1 },
    ["NeogitChangeCopied"] = { fg = blue1 },
    ["NeogitChangeNewFile"] = { fg = green1 },
    ["NeogitChangeUnmerged"] = { fg = yellow1 },

    ["NeogitCursorLine"] = { fg = c.no, bg = c.no },

    ----------
    -- Lazy --
    ----------
    ["LazyButtonActive"] = { fg = accent, bg = c.no, extras = { c.bo, c.it } },

    -- ------------
    -- -- Snacks --
    -- ------------
    -- ["SnacksBackdrop"] = { fg = c.no, bg = bg, extras = {} },
    -- ["SnacksDashboardKey"] = { fg = comment, bg = c.no, extras = {} },
    -- ["SnacksDashboardIcon"] = { fg = accent, bg = c.no, extras = {} },
    -- ["SnacksDashboardDesc"] = { fg = accent, bg = c.no, extras = { c.bo } },
    -- ["SnacksDashboardFooter"] = { fg = comment, bg = c.no, extras = {} },
    -- ["SnacksDashboardSpecial"] = { fg = accent, bg = c.no, extras = {} },
    -- ["SnacksDashboardHeader"] = { fg = fg, bg = c.no, extras = {} },

    ----------------
    -- Mini.icons --
    ----------------
    ["MiniIconsAzure"] = { fg = utils.dim(blue, 1.1), bg = c.no, extras = {} },
    ["MiniIconsBlue"] = { fg = blue, bg = c.no, extras = {} },
    ["MiniIconsCyan"] = { fg = teal, bg = c.no, extras = {} },
    ["MiniIconsGreen"] = { fg = green, bg = c.no, extras = {} },
    ["MiniIconsGrey"] = { fg = comment, bg = c.no, extras = {} },
    ["MiniIconsOrange"] = { fg = yellow1, bg = c.no, extras = {} },
    ["MiniIconsPurple"] = { fg = magenta, bg = c.no, extras = {} },
    ["MiniIconsRed"] = { fg = red, bg = c.no, extras = {} },
    ["MiniIconsYellow"] = { fg = yellow, bg = c.no, extras = {} },

    ---------
    -- FZF --
    ---------
    ["FzfLuaNormal"] = { fg = fg, bg = bg, extras = {} },
    ["FzfLuaFzfCursorLine"] = "CursorLine",
    ["FzfLuaFzfMatch"] = "Accent",
    ["FzfLuaFzfBorder"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfScrollbar"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfSeparator"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfGutter"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfHeader"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfInfo"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfPointer"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfMarker"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfSpinner"] = "Comment",
    ["FzfLuaFzfPrompt"] = { fg = c.no, bg = c.no, extras = {} },
    ["FzfLuaFzfQuery"] = { fg = c.no, bg = c.no, extras = {} },

    ----------
    -- Dap --
    ----------
    ["DapUIBreakpointsInfo"] = { fg = green, bg = c.no, extras = {} },
    ["DapUIBreakpointsPath"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUIBreakpointsLine"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUIFieldValue"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["DapUIModifiedValue"] = { fg = blue, bg = c.no, extras = { c.bo } },
    ["DapUICurrentFrameName"] = { fg = green, bg = c.no, extras = {} },
    ["DapUISource"] = { fg = magenta, bg = c.no, extras = {} },
    ["DapUIType"] = { fg = magenta, bg = c.no, extras = {} },
    ["DapUIDecoration"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUIScope"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUIStoppedThread"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUILineNumber"] = { fg = blue, bg = c.no, extras = {} },
    ["DapUIWatchesEmpty"] = { fg = magenta1, bg = c.no, extras = {} },
    ["DapUIWatchesValue"] = { fg = green, bg = c.no, extras = {} },
    ["DapUINormal"] = { fg = fg, bg = bg, extras = {} },
    ["DapUIPlayPause"] = { fg = green, bg = bg, extras = {} },
    ["DapUIRestart"] = { fg = green, bg = bg, extras = {} },
    ["DapUIStepBack"] = { fg = blue, bg = bg, extras = {} },
    ["DapUIStepInto"] = { fg = blue, bg = bg, extras = {} },
    ["DapUIStepOver"] = { fg = blue, bg = bg, extras = {} },
    ["DapUIStepOut"] = { fg = blue, bg = bg, extras = {} },
    ["DapUIUnavailable"] = { fg = comment, bg = bg, extras = {} },
    ["DapUIStop"] = { fg = magenta, bg = bg, extras = {} },
    ["DapUIPlayPauseNC"] = "DapUIPlayPause",
    ["DapUIRestartNC"] = "DapUIRestart",
    ["DapUIStepBackNC"] = "DapUIStepBack",
    ["DapUIStepIntoNC"] = "DapUIStepInto",
    ["DapUIStepOutNC"] = "DapUIStepOut",
    ["DapUISidebar"] = { fg = fg, bg = bg, extras = {} },

    --------------
    -- Gitsigns --
    --------------
    ["DiffAdd"] = { fg = green, bg = c.no, extras = {} },
    ["DiffChange"] = { fg = blue, bg = c.no, extras = {} },
    ["DiffDelete"] = { fg = red, bg = c.no, extras = {} },

    ["GitSignsAdd"] = "DiffAdd",
    ["GitSignsChange"] = "DiffChange",
    ["GitSignsDelete"] = "DiffDelete",
    ["GitSignsChangedelete"] = { fg = red1, bg = c.no, extras = {} },
    ["GitSignsTopdelete"] = "DiffDelete",
    ["GitSignsUntracked"] = { fg = comment, bg = c.no, extras = {} },
    ["GitSignsChangeLn"] = { fg = c.no, bg = c.no, extras = {} },
    ["GitSignsCurrentLineBlame"] = { fg = comment, bg = c.no, extras = {} },
    -- ["GitSignsAddInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for added word diff regions in inline previews.
    --
    -- -- Fallbacks: `TermCursor`
    -- -- *hl-GitSignsDeleteInline*
    -- ["GitSignsDeleteInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for deleted word diff regions in inline previews.
    --
    -- -- Fallbacks: `TermCursor`
    -- -- *hl-GitSignsChangeInline*
    -- ["GitSignsChangeInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for changed word diff regions in inline previews.
    --
    -- -- Fallbacks: `TermCursor`
    -- -- *hl-GitSignsAddLnInline*
    -- ["GitSignsAddLnInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for added word diff regions when `config.word_diff == true`.
    --
    -- -- Fallbacks: `GitSignsAddInline`
    -- -- *hl-GitSignsChangeLnInline*
    -- ["GitSignsChangeLnInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for changed word diff regions when `config.word_diff == true`.
    --
    -- -- Fallbacks: `GitSignsChangeInline`
    -- -- *hl-GitSignsDeleteLnInline*
    -- ["GitSignsDeleteLnInline"] = { fg = c.no, bg = c.no, extras = {} },
    -- -- Used for deleted word diff regions when `config.word_diff == true`.
}

local md_headers = { red, yellow, green, blue, teal, magenta }
for i, color in ipairs(md_headers) do
    hl_groups[table.concat({ "@markup.heading.", i, ".markdown" })] = { fg = color, bg = c.no, extras = { c.bo } }
    hl_groups[table.concat({ "Headline", i })] = dimmed_bg(color)
end

return hl_groups
