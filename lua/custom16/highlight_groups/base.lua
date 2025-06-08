local utils = require("custom16.colors")
local c = utils.parse_palette()

return {
    Comment = { fg = c.comment, italic = true }, -- any comment
    ColorColumn = { bg = c.bg }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.bgfg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.mid_bg }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.cursorline }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.green }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.yellow }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.red }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.fg }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { fg = c.red }, -- error messages on the command line
    VertSplit = { fg = c.accent }, -- the column separating vertically split windows
    WinSeparator = { fg = c.accent, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.mid_bg }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = c.bg, fg = c.comment }, -- column where |signs| are displayed
    -- SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.bg }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.accent, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.accent, bold = true, reverse = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg = { fg = c.fg_dark, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea = { fg = c.fg }, -- Area for messages and cmdline
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.mid_bg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = c.dimmmed }, -- normal text in non-current windows
    -- NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg, bg = c.bg }, -- Normal text in floating windows.
    FloatBorder = { fg = c.accent, bg = c.bg },
    FloatTitle = { fg = c.accent, bg = c.bg },
    Pmenu = { bg = c.bg, fg = c.fg }, -- Popup menu: normal item.
    PmenuMatch = { bg = c.cursorline, fg = c.fg }, -- Popup menu: Matched text in normal item.
    PmenuSel = { bg = utils.merge(c.fg, c.bg, 0.8) }, -- Popup menu: selected item.
    PmenuMatchSel = { bg = utils.merge(c.fg, c.bg, 0.8), fg = c.blue1 }, -- Popup menu: Matched text in selected item.
    PmenuSbar = { bg = utils.merge(c.bg, c.fg, 0.5) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.cursorline, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.very_dimmed_accent, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.yellow1, fg = c.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = "IncSearch",
    SpecialKey = { fg = c.comment }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    StatusLine = { fg = c.fg, bg = c.bg }, -- status line of current window
    StatusLineNC = { fg = c.dimmed_fg, bg = c.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    ["NormalMode"] = { fg = c.bg, bg = c.green, bold = true },
    ["VisualMode"] = { fg = c.bg, bg = c.magenta, bold = true },
    ["SelectMode"] = { fg = c.bg, bg = c.magenta1, bold = true },
    ["InsertMode"] = { fg = c.bg, bg = c.yellow, bold = true },
    ["ReplaceMode"] = { fg = c.bg, bg = c.teal, bold = true },
    ["CommandMode"] = { fg = c.bg, bg = c.yellow1, bold = true },
    ["ExMode"] = { fg = c.bg, bg = c.blue1, bold = true },
    ["PromptMode"] = { fg = c.bg, bg = c.yellow1, bold = true },
    ["TerminalMode"] = { fg = c.bg, bg = c.yellow1, bold = true },
    ["UnknownMode"] = { fg = c.bg, bg = c.red, bold = true },
    ["StatusLineDim"] = { fg = c.comment, bg = c.bg },
    ["StatusBar"] = { fg = c.fg, bg = c.bg },
    ["WinBar"] = { fg = c.fg, bg = c.bg, bold = true },
    ["WinBarNC"] = { fg = c.comment, bg = c.bg },
    ["StatusBarIcon"] = { fg = c.fg, bg = c.bg },
    ["StatusLineSep"] = { fg = c.accent, bg = c.bg },
    ["LspServer"] = { fg = c.accent, bg = c.bg },
    ["StatusLineError"] = { fg = c.red, bg = c.bg },
    ["StatusLineWarn"] = { fg = c.yellow, bg = c.bg },
    ["StatusLineInfo"] = { fg = c.green, bg = c.bg },
    ["StatusLineHint"] = { fg = c.blue, bg = c.bg },

    TabLine = { bg = c.dimmed_bg, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.bg }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.bg, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.accent, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { reverse = true }, -- Visual mode selection
    VisualNOS = { bg = c.red }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.yellow }, -- warning messages
    Whitespace = { fg = c.dimmed_fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.cursorline }, -- current match in 'wildmenu' completion

    Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    Constant = { fg = c.yellow1 }, -- (preferred) any constant
    Debug = { fg = c.yellow1 }, --    debugging statements
    Delimiter = "Special", --  character that needs attention
    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Function = { fg = c.blue }, -- function name (also: methods for classes)
    Identifier = { fg = c.magenta, bold = true }, -- (preferred) any variable name
    Italic = { italic = true, fg = c.fg }, -- (preferred) any italic text
    Keyword = { fg = c.teal, bold = true }, --  any other keyword
    Conditional = { fg = c.red, bold = true }, --  any other keyword
    Operator = { fg = c.fg }, -- "sizeof", "+", "*", etc.
    PreProc = { fg = c.teal1 }, -- (preferred) generic Preprocessor
    Special = { fg = c.blue1 }, -- (preferred) any special symbol
    Statement = { fg = c.magenta }, -- (preferred) any statement
    String = { fg = c.green }, --   a string constant: "this is a string"
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type = { fg = c.blue1 }, -- (preferred) int, long, char, etc.
    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    debugBreakpoint = { bg = utils.merge(c.blue, c.bg, 0.1), fg = c.blue }, -- used for breakpoint colors in terminal-debug
    debugPC = { bg = c.cursorline }, -- used for highlighting the current line in terminal-debug
    dosIniLabel = "@property",
    helpCommand = { bg = c.bg, fg = c.blue },
    htmlH1 = { fg = c.magenta, bold = true },
    htmlH2 = { fg = c.blue, bold = true },
    qfFileName = { fg = c.blue },
    qfLineNr = { fg = c.dimmed_fg },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText = { bg = c.very_dimmed_fg }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.very_dimmed_fg }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.very_dimmed_fg }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = c.cursorline, bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = utils.merge(c.blue1, c.bg, 0.1), fg = c.dimmed_fg },
    LspInfoBorder = { fg = c.accent, bg = c.bg },

    -- diagnostics
    DiagnosticError = { fg = c.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.comment }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextError = { bg = utils.merge(c.red, c.bg, 0.1), fg = c.red }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = utils.merge(c.yellow, c.bg, 0.1), fg = c.yellow }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = utils.merge(c.blue, c.bg, 0.1), fg = c.blue }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = utils.merge(c.green, c.bg, 0.1), fg = c.green }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = { undercurl = true, sp = c.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.green }, -- Used to underline "Hint" diagnostics

    -- Health
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.yellow },
}
