-- Icons
-- Used by global.lua to create a global variable g.ICONS
--
return {
  kind = {
    Array           = "  ",
    Boolean         = "  ",
    Class           = " ﴯ ",
    Color           = "  ",
    Constant        = "  ",
    Conditional     = "  ",
    Constructor     = "  ",
    Copilot         = "  ",
    Codeium         =  " ",
    Comment         = "  ",
    Enum            = "  ",
    EnumMember      = "  ",
    Event           = "  ",
    Field           = " ﰠ ",
    File            = "  ",
    Folder          = "  ",
    Function        = "  ",
    Interface       = "  ",
    Key             = "  ",
    Keyword         = "  ",
    KeywordFunction = "  ",
    KeywordOperator = "  ",
    KeywordReturn   = "  ",
    Method          = "  ",
    Module          = "  ",
    Namespace       = "  ",
    Null            = " 󰟢 ",
    Number          = "  ",
    Object          = "  ",
    Operator        = "  ",
    Package         = "  ",
    Property        = " ﰠ ",
    Reference       = "  ",
    Snippet         = "  ",
    String          = "  ",
    Struct          = " פּ ",
    Supermaven      = "  ",
    Text            = "  ",
    TypeParameter   = "  ",
    Unit            = "  ",
    Value           = "  ",
    Variable        = "  ",
    Spell           = "  ",
    Git             = "  ",
  },
  git = {
    LineAdded     = " ",
    LineModified  = " ",
    LineRemoved   = " ",
    FileDeleted   = " ",
    FileIgnored   = "◌",
    FileRenamed   = " ",
    FileStaged    = "S",
    FileUnmerged  = "",
    FileUnstaged  = "",
    FileUntracked = "U",
    Diff          = " ",
    Repo          = " ",
    Octoface      = " ",
    Copilot       = " ",
    Branch        = "",
  },
  ui = {
    ArrowCircleDown         = "",
    ArrowCircleLeft         = "",
    ArrowCircleRight        = "",
    ArrowCircleUp           = "",
    BoldArrowDown           = "",
    BoldArrowLeft           = "",
    BoldArrowRight          = "",
    BoldArrowUp             = "",
    BoldClose               = "",
    BoldDividerLeft         = "",
    BoldDividerRight        = "",
    BoldLineDashedMiddle    = "┋",
    BoldLineLeft            = "▎",
    BoldLineMiddle          = "┃",
    BookMark                = "",
    BoxChecked              = " ",
    Bug                     = " ",
    Calendar                = " ",
    Check                   = "",
    ChevronRight            = "",
    ChevronShortDown        = "",
    ChevronShortLeft        = "",
    ChevronShortRight       = "",
    ChevronShortUp          = "",
    Circle                  = " ",
    CircuitBoard            = " ",
    Close                   = "󰅖",
    CloudDownload           = " ",
    Code                    = "",
    Comment                 = "",
    Dashboard               = "",
    DebugConsole            = " ",
    DividerBackslash        = '',
    DividerBackslashThin    = '',
    DividerForwardSlash     = '',
    DividerForwardSlashThin = '',
    DividerLeft             = "",
    DividerRight            = "",
    DividerRoundLeft        = ' ',
    DividerRoundRight       = ' ',
    DoubleChevronRight      = "»",
    Ellipsis                = "",
    EmptyFolder             = " ",
    EmptyFolderOpen         = " ",
    File                    = " ",
    FileSymlink             = "",
    Files                   = " ",
    FindFile                = "󰈞",
    FindText                = "󰊄",
    Fire                    = "",
    Folder                  = "󰉋 ",
    FolderOpen              = " ",
    FolderSymlink           = " ",
    Forward                 = " ",
    Gear                    = " ",
    History                 = " ",
    Lightbulb               = " ",
    LineLeft                = "▏",
    LineMiddle              = "│",
    List                    = " ",
    Lock                    = " ",
    NewFile                 = " ",
    Note                    = " ",
    Package                 = " ",
    Pencil                  = "󰏫 ",
    Plus                    = " ",
    Project                 = " ",
    Robot                   = "󰚩 ",
    Scopes                  = "",
    Search                  = " ",
    SignIn                  = " ",
    SignOut                 = " ",
    Smiley                  = " ",
    Squirrel                = " ",
    Stacks                  = "",
    Tab                     = "󰌒 ",
    Table                   = " ",
    Tag                     = " ",
    Target                  = "󰀘 ",
    Telescope               = " ",
    Text                    = " ",
    Tree                    = "",
    Triangle                = "󰐊",
    TriangleShortArrowDown  = "",
    TriangleShortArrowLeft  = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp    = "",
    Watch                   = "",
    Watches                 = "󰂥",
  },
  diagnostics = {
    bold = {
      Error       = "",
      Warning     = "",
      Question    = "",
      Information = "",
      Hint        = "",
    },
    normal = {
      Error       = "",
      Warning     = "",
      Information = "",
      Question    = "",
      Hint        = "󰌶",
      Debug       = "",
      Trace       = "✎",
    }
  },
  completion  = {
  plain = {
    nvim_lsp   = "  LSP",
    nvim_lua   = "  Lua",
    copilot    = "  Copi",
    luasnip    = "擄 Snip",
    buffer     = "  Buff",
    path       = "  Path",
    treesitter = "  TS",
    rg         = "  Rg",
    cmdline    = "  Cmd",
    dap        = "  DAP",
    emoji      = "  Emoji",
    git        = "  Git",
    spell      = "  Spell",
    codeium    = "  AI"
  }, 
  fancy = {
      nvim_lsp   = "👐 LSP",
      nvim_lua   = "🌙 Lua",
      copilot    = "🤖 AI",
      luasnip    = "🧩 Snip",
      buffer     = "📄 Buff ",
      path       = "📁 Path",
      treesitter = "🌲 TS",
      rg         = "🔎 Rg",
      cmdline    = "💲 Cmd",
      dap        = "🐛 DAP",
      emoji      = "😀 Emoji",
      git        = "🐙 Git",
      spell      = "📝 Spell",
    }
  },
  dap = {
    fancy = {
    BreakpointStopped     = "🛑",
    BreakpointNormal      = "🟠",
    BreakpointConditional = "🔵",
    BreakpointLog         = "⚪",
    BreakpointRejected    = "⭕",
  },
  plain = {
        BreakpointStopped     = "",
        BreakpointNormal      = "ﱣ",
        BreakpointConditional = "",
        BreakpointLog         = "喝",
        BreakpointRejected    = "",
      }
  },
    alt_kind        = {
      Array         = " ",
      Boolean       = " ",
      Class         = " ",
      Color         = " ",
      Constant      = " ",
      Constructor   = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Folder        = "󰉋 ",
      Function      = " ",
      Interface     = " ",
      Key           = " ",
      Keyword       = " ",
      Method        = " ",
      Module        = " ",
      Namespace     = " ",
      Null          = "󰟢 ",
      Number        = " ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      Reference     = " ",
      Snippet       = " ",
      String        = " ",
      Struct        = " ",
      Text          = " ",
      TypeParameter = " ",
      Unit          = " ",
      Value         = " ",
      Variable      = " ",
    },
}
