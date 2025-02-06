local theme = {}

theme.colors = {
    bg = "#0A0A0A",
    fg = "#D0D0D0",
    selection_bg = "#303030",
    selection_fg = "#FFFFFF",
    comment = "#777777",
    cursor = "#D0D0D0",

    -- Accents
    purple = "#A187C9",        -- Muted purple (types, constants)
    function_blue = "#7F9FCC", -- Distinct blue for function names

    -- Supporting colors
    red = "#D75F5F",
    green = "#5F9F75",
    yellow = "#D7D787",
    blue = "#7F88D0",

    bright_comment = "#888888",
    bright_red = "#E27B7B",
}

theme.setup = function()
    local colors = theme.colors
    vim.cmd("highlight clear")
    vim.opt.background = "dark"

    -- Base UI
    vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)
    vim.cmd("highlight Cursor guifg=" .. colors.bg .. " guibg=" .. colors.cursor)
    vim.cmd("highlight Visual guibg=" .. colors.selection_bg .. " guifg=" .. colors.selection_fg)
    vim.cmd("highlight LineNr guifg=" .. colors.comment)
    vim.cmd("highlight StatusLine guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)
    vim.cmd("highlight CursorLine guibg=" .. colors.selection_bg)

    -- Syntax Highlights (Final Fix)
    vim.cmd("highlight Comment guifg=" .. colors.comment .. " gui=italic")
    vim.cmd("highlight Function guifg=" .. colors.function_blue)     -- Function names now distinct
    vim.cmd("highlight Type guifg=" .. colors.purple .. " gui=bold") -- Types in your favorite purple
    vim.cmd("highlight Statement guifg=" .. colors.yellow .. " gui=bold")
    vim.cmd("highlight Keyword guifg=" .. colors.yellow)
    vim.cmd("highlight String guifg=" .. colors.green)
    vim.cmd("highlight Constant guifg=" .. colors.purple) -- Keeps constants visually distinct

    -- LSP Highlights (Subtle but Effective)
    vim.cmd("highlight LspReferenceText guibg=" .. colors.selection_bg)
    vim.cmd("highlight LspReferenceRead guibg=" .. colors.selection_bg)
    vim.cmd("highlight LspReferenceWrite guibg=" .. colors.selection_bg)
    vim.cmd("highlight DiagnosticError guifg=" .. colors.red)
    vim.cmd("highlight DiagnosticWarn guifg=" .. colors.yellow)
    vim.cmd("highlight DiagnosticInfo guifg=" .. colors.blue)
    vim.cmd("highlight DiagnosticHint guifg=" .. colors.purple)

    -- UI Elements
    vim.cmd("highlight Pmenu guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)
    vim.cmd("highlight PmenuSel guibg=" .. colors.purple .. " guifg=" .. colors.bg)
    vim.cmd("highlight CursorLine guibg=" .. colors.selection_bg)
    vim.cmd("highlight MatchParen guibg=" .. colors.purple)
end

return theme
