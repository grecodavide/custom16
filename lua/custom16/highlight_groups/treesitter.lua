local utils = require("custom16.colors")
local c = utils.parse_palette()

return {
    ["@keyword.directive"] = { fg = c.red, bg = c.no, bold = true },
    ["@annotation"] = "PreProc",
    ["@attribute"] = "PreProc",
    ["@boolean"] = "Boolean",
    ["@character"] = "Character",
    ["@character.printf"] = "SpecialChar",
    ["@character.special"] = "SpecialChar",
    ["@comment"] = "Comment",
    ["@comment.error"] = "ErrorComment",
    ["@comment.hint"] = "HintComment",
    ["@comment.info"] = "InfoComment",
    ["@comment.note"] = "NoteComment",
    ["@comment.todo"] = "TodoComment",
    ["@comment.warning"] = "WarningComment",
    ["@constant"] = "Constant",
    ["@constant.builtin"] = "Special",
    ["@constant.macro"] = "Define",
    ["@constructor"] = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@constructor.lua"] = "@constructor",
    ["@constructor.tsx"] = { fg = c.blue1 },
    ["@diff.delta"] = "DiffChange",
    ["@diff.minus"] = "DiffDelete",
    ["@diff.plus"] = "DiffAdd",
    ["@function"] = "Function",
    ["@function.builtin"] = "Special",
    ["@function.call"] = "@function",
    ["@function.macro"] = "Macro",
    ["@function.method"] = { fg = c.green, bg = c.no },
    ["@function.method.call"] = "@function.method",
    ["@keyword"] = "Keyword", -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"] = "Conditional",
    ["@keyword.coroutine"] = "@keyword",
    ["@keyword.debug"] = "Debug",
    ["@keyword.directive.define"] = "Define",
    ["@keyword.exception"] = "Exception",
    ["@keyword.function"] = { fg = c.magenta, italic = true }, -- For keywords used to define a function.
    ["@keyword.import"] = "Include",
    ["@keyword.operator"] = "@operator",
    ["@keyword.repeat"] = "Repeat",
    ["@keyword.return"] = "@keyword",
    ["@keyword.storage"] = "StorageClass",
    ["@label"] = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"] = "@none",
    ["@markup.emphasis"] = { italic = true },
    ["@markup.environment"] = "Macro",
    ["@markup.environment.name"] = "Type",
    ["@markup.heading"] = "Title",
    ["@markup.italic"] = { italic = true },
    ["@markup.link"] = { fg = c.teal },
    ["@markup.link.label"] = "SpecialChar",
    ["@markup.link.label.symbol"] = "Identifier",
    ["@markup.link.url"] = "Underlined",
    ["@markup.list"] = { fg = c.blue1 }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"] = { fg = c.green1 }, -- For brackets and parens.
    ["@markup.list.markdown"] = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"] = { fg = c.blue }, -- For brackets and parens.
    ["@markup.math"] = "Special",
    ["@markup.raw"] = "String",
    ["@markup.raw.markdown_inline"] = { bg = utils.merge(c.bg, c.fg, 0.9), fg = c.blue },
    ["CodeBlock"] = { fg = c.no, bg = utils.merge(c.bg, c.fg, 0.95) },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.underline"] = { underline = true },
    ["@module"] = "Directory",
    ["@module.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"] = "@variable.builtin",
    ["@none"] = {},
    ["@number"] = "Number",
    ["@number.float"] = "Float",
    ["@operator"] = { fg = c.blue1 }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"] = { fg = c.green1 },
    ["@punctuation.bracket"] = { fg = c.accent }, -- For brackets and parens.
    ["@punctuation.delimiter"] = { fg = c.blue1 }, -- For delimiters ie: `.`
    ["@punctuation.special"] = { fg = c.blue1 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { fg = c.yellow1 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"] = "String",
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.escape"] = { fg = c.magenta }, -- For escape characters within a string.
    ["@string.regexp"] = { fg = c.blue1 }, -- For regexes.
    ["@tag"] = "Label",
    ["@tag.attribute"] = "@property",
    ["@tag.delimiter"] = "Delimiter",
    -- ["@tag.delimiter.tsx"] = { fg = utils.merge(c.blue, 0.7) },
    ["@tag.tsx"] = { fg = c.red },
    ["@tag.javascript"] = { fg = c.red },
    ["@type"] = "Type",
    -- ["@type.builtin"] = { fg = utils.merge(c.blue1, c.bg, 0.8) },
    ["@type.definition"] = "Typedef",
    ["@type.qualifier"] = "@keyword",
    ["@variable"] = { fg = c.fg }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.member"] = { fg = c.green1 }, -- For fields.
    ["@variable.parameter"] = { fg = c.yellow }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = c.yellow }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@custom_var"] = { fg = c.fg, bold = true, italic = true }, -- Any variable name that does not have another highlight.
}
