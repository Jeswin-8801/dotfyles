return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,

    ---@class CatppuccinOptions
    opts = function()
      return {
        flavour = "auto",
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        highlight_overrides = {
          mocha = function(color)
            return {
              TabLineSel = { bg = color.pink },
              CmpBorder = { fg = color.surface2 },
              Pmenu = { bg = color.none },
              TelescopeBorder = { link = "FloatBorder" },
              CmpItemKindSnippet = { fg = color.base, bg = color.mauve },
              CmpItemKindKeyword = { fg = color.base, bg = color.red },
              CmpItemKindText = { fg = color.base, bg = color.teal },
              CmpItemKindMethod = { fg = color.base, bg = color.blue },
              CmpItemKindConstructor = { fg = color.base, bg = color.blue },
              CmpItemKindFunction = { fg = color.base, bg = color.blue },
              CmpItemKindFolder = { fg = color.base, bg = color.blue },
              CmpItemKindModule = { fg = color.base, bg = color.blue },
              CmpItemKindConstant = { fg = color.base, bg = color.peach },
              CmpItemKindField = { fg = color.base, bg = color.green },
              CmpItemKindProperty = { fg = color.base, bg = color.green },
              CmpItemKindEnum = { fg = color.base, bg = color.green },
              CmpItemKindUnit = { fg = color.base, bg = color.green },
              CmpItemKindClass = { fg = color.base, bg = color.yellow },
              CmpItemKindVariable = { fg = color.base, bg = color.flamingo },
              CmpItemKindFile = { fg = color.base, bg = color.blue },
              CmpItemKindInterface = { fg = color.base, bg = color.yellow },
              CmpItemKindColor = { fg = color.base, bg = color.red },
              CmpItemKindReference = { fg = color.base, bg = color.red },
              CmpItemKindEnumMember = { fg = color.base, bg = color.red },
              CmpItemKindStruct = { fg = color.base, bg = color.blue },
              CmpItemKindValue = { fg = color.base, bg = color.peach },
              CmpItemKindEvent = { fg = color.base, bg = color.blue },
              CmpItemKindOperator = { fg = color.base, bg = color.blue },
              CmpItemKindTypeParameter = { fg = color.base, bg = color.blue },
              CmpItemKindCopilot = { fg = color.base, bg = color.teal },
            }
          end,
        },
        color_overrides = {
          latte = {
            text = "#202027",
            subtext1 = "#102128",
            subtext0 = "#4c4f69",
            overlay2 = "#737994",
            overlay1 = "#838ba7",
            base = "#fcfcfa",
            mantle = "#EAEDF3",
            crust = "#DCE0E8",
            pink = "#EA7A95",
            mint = "#B5FCCD",
            mauve = "#986794",
            red = "#EC5E66",
            peach = "#FF8459",
            yellow = "#CAA75E",
            green = "#87A35E",
          },
          mocha = {
            -- ⬇️
            -- https://htmlcolorcodes.com/color-picker/
            -- https://catbbrew.com/
            -- ⬆️

            surface2 = "#535763",
            surface1 = "#525252", -- Line Numbers, Current Line highlight in all non-editor pannels
            surface0 = "#20202b", -- Code Block highlight default, Current Line Highlight
            text = "#E4E1FA",

            -- mint = "#B5FCCD",
            rosewater = "#DFD3C3",
            lavender = "#F4E7E1",
            red = "#f38ba8", -- exit, echo, return
            peach = "#ffc8b2",
            yellow = "#FFF2B5",
            pink = "#FFE2D9",
            green = "#d6efd3", -- strings
            teal = "#FBFCCB", -- diagnostics
            blue = "#b4befe", -- main: funtion calls
            mauve = "#9e84f4", -- keywords
            flamingo = "#be5046",
            maroon = "#e06c75",
            sky = "#87ccdc", -- operator, operator/special character diagnostics

            subtext1 = "#F4E1FA",
            subtext0 = "#A6ADC8",
            overlay2 = "#9399B2", -- Comments, Unused Var
            overlay1 = "#7F849C",
            overlay0 = "#6C7086",

            base = "#0a0b16", -- editor background, File Explorer search border surround
            mantle = "#101014", -- Background colors for: File Explorer, Lazy Pannel, Floating Windows, Status bar bottom
            crust = "#1F2131", -- File Explorer and Editor Line separator
          },
        },
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic" },
          operators = { "bold" },
          conditionals = { "bold" },
          loops = { "bold" },
          booleans = { "bold", "italic" },
        },
        integrations = {
          cmp = true,
          copilot_vim = true,
          gitsigns = true,
          mason = true,
          -- neotest = true,
          noice = true,
          notify = true,
          treesitter = true,
          treesitter_context = false,
          snacks = true,
          illuminate = true,
          which_key = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      }
    end,
  },

  -- secondary
  {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    name = "eldritch",
    opts = {
      transparent_background = true,
      -- Overriding colors globally using a definitions table
      on_colors = function(global_colors)
        -- Define all color overrides in a single table
        local color_definitions = {
          -- https://github.com/eldritch-theme/eldritch.nvim/blob/master/lua/eldritch/colors.lua
          bg = "#0D1116",
          fg = "#ebfafa",
          selection = "#e9b3fd",
          comment = "#a5afc2",
          red = "#5fa9f4", -- default #f16c75
          orange = "#1682ef", -- default #f7c67f
          yellow = "#19dfcf", -- default #f1fc79
          green = "#37f499",
          purple = "#987afb", -- default #a48cf2
          cyan = "#04d1f9",
          pink = "#949ae5", -- default #f265b5
          bright_red = "#5fa9f4",
          bright_green = "#37f499",
          bright_yellow = "#19dfcf",
          bright_blue = "#987afb",
          bright_magenta = "#949ae5",
          bright_cyan = "#04d1f9",
          bright_white = "#ebfafa",
          menu = "#0D1116",
          visual = "#e9b3fd",
          gutter_fg = "#e9b3fd",
          nontext = "#e9b3fd",
          white = "#ebfafa",
          black = "#0D1116",
          git = {
            change = "#04d1f9",
            add = "#37f499",
            delete = "#f16c75",
          },
          gitSigns = {
            change = "#04d1f9",
            add = "#37f499",
            delete = "#f16c75",
          },
          bg_dark = "#232e3b",
          -- Lualine line across
          bg_highlight = "#141b22",
          terminal_black = "#232e3b",
          fg_dark = "#ebfafa",
          fg_gutter = "#232e3b",
          dark3 = "#232e3b",
          dark5 = "#232e3b",
          bg_visual = "#e9b3fd",
          dark_cyan = "#04d1f9",
          magenta = "#949ae5",
          magenta2 = "#949ae5",
          magenta3 = "#949ae5",
          dark_yellow = "#19dfcf",
          dark_green = "#37f499",
        }

        -- Apply each color definition to global_colors
        for key, value in pairs(color_definitions) do
          global_colors[key] = value
        end
      end,

      -- This function is found in the documentation
      on_highlights = function(highlights)
        local highlight_definitions = {
          -- nvim-spectre or grug-far.nvim highlight colors
          DiffChange = { bg = "#04d1f9", fg = "black" },
          DiffDelete = { bg = "#f16c75", fg = "black" },
          DiffAdd = { bg = "#37f499", fg = "black" },
          TelescopeResultsDiffDelete = { bg = "#949ae5", fg = "black" },

          -- horizontal line that goes across where cursor is
          CursorLine = { bg = "#232e3b" },

          -- Set cursor color, these will be called by the "guicursor" option in
          -- the options.lua file, which will be used by neovide
          Cursor = { bg = "#f94dff" },
          lCursor = { bg = "#f94dff" },
          CursorIM = { bg = "#f94dff" },

          -- I do the line below to change the color of bold text
          ["@markup.strong"] = { fg = "#f94dff", bold = true },

          -- Inline code in markdown
          ["@markup.raw.markdown_inline"] = { fg = "#37f499" },

          -- Change the spell underline color
          SpellBad = { sp = "#f16c75", undercurl = true, bold = true, italic = true },
          SpellCap = { sp = "#f1fc79", undercurl = true, bold = true, italic = true },
          SpellLocal = { sp = "#f1fc79", undercurl = true, bold = true, italic = true },
          SpellRare = { sp = "#987afb", undercurl = true, bold = true, italic = true },

          MiniDiffSignAdd = { fg = "#19dfcf", bold = true },
          MiniDiffSignChange = { fg = "#37f499", bold = true },

          -- Codeblocks for the render-markdown plugin
          RenderMarkdownCode = { bg = "#141b22" },

          -- This is the plugin that shows you where you are at the top
          TreesitterContext = { sp = "#0D1116" },
          MiniFilesNormal = { sp = "#0D1116" },
          MiniFilesBorder = { sp = "#0D1116" },
          MiniFilesTitle = { sp = "#0D1116" },
          MiniFilesTitleFocused = { sp = "#0D1116" },

          NormalFloat = { bg = "#0D1116" },
          FloatBorder = { bg = "#0D1116" },
          FloatTitle = { bg = "#0D1116" },
          NotifyBackground = { bg = "#0D1116" },
          NeoTreeNormalNC = { bg = "#0D1116" },
          NeoTreeNormal = { bg = "#0D1116" },
          NvimTreeWinSeparator = { fg = "#0D1116", bg = "#0D1116" },
          NvimTreeNormalNC = { bg = "#0D1116" },
          NvimTreeNormal = { bg = "#0D1116" },
          TroubleNormal = { bg = "#0D1116" },

          NoiceCmdlinePopupBorder = { fg = "#0D1116" },
          NoiceCmdlinePopupTitle = { fg = "#0D1116" },
          NoiceCmdlinePopupBorderFilter = { fg = "#0D1116" },
          NoiceCmdlineIconFilter = { fg = "#0D1116" },
          NoiceCmdlinePopupTitleFilter = { fg = "#0D1116" },
          NoiceCmdlineIcon = { fg = "#0D1116" },
          NoiceCmdlineIconCmdline = { fg = "#04d1f9" },
          NoiceCmdlinePopupBorderCmdline = { fg = "#37f499" },
          NoiceCmdlinePopupTitleCmdline = { fg = "#04d1f9" },
          NoiceCmdlineIconSearch = { fg = "#987afb" },
          NoiceCmdlinePopupBorderSearch = { fg = "#04d1f9" },
          NoiceCmdlinePopupTitleSearch = { fg = "#987afb" },
          NoiceCmdlineIconLua = { fg = "#19dfcf" },
          NoiceCmdlinePopupBorderLua = { fg = "#949ae5" },
          NoiceCmdlinePopupTitleLua = { fg = "#19dfcf" },
          NoiceCmdlineIconHelp = { fg = "#f1fc79" },
          NoiceCmdlinePopupBorderHelp = { fg = "#5fa9f4" },
          NoiceCmdlinePopupTitleHelp = { fg = "#f1fc79" },
          NoiceCmdlineIconInput = { fg = "#0D1116" },
          NoiceCmdlinePopupBorderInput = { fg = "#0D1116" },
          NoiceCmdlinePopupTitleInput = { fg = "#0D1116" },
          NoiceCmdlineIconCalculator = { fg = "#0D1116" },
          NoiceCmdlinePopupBorderCalculator = { fg = "#0D1116" },
          NoiceCmdlinePopupTitleCalculator = { fg = "#0D1116" },
          NoiceCompletionItemKindDefault = { fg = "#0D1116" },

          NoiceMini = { bg = "#0D1116" },
          StatusLine = { bg = "#0D1116" },
          Folded = { bg = "#0D1116" },

          DiagnosticInfo = { fg = "#04d1f9" },
          DiagnosticHint = { fg = "#37f499" },
          DiagnosticWarn = { fg = "#f1fc79" },
          DiagnosticOk = { fg = "#987afb" },
          DiagnosticError = { fg = "#f16c75" },
          RenderMarkdownQuote = { fg = "#f1fc79" },

          -- visual mode selection
          Visual = { bg = "#e9b3fd", fg = "#0D1116" },
          PreProc = { fg = "#1682ef" },
          ["@operator"] = { fg = "#37f499" },

          KubectlHeader = { fg = "#987afb" },
          KubectlWarning = { fg = "#04d1f9" },
          KubectlError = { fg = "#949ae5" },
          KubectlInfo = { fg = "#37f499" },
          KubectlDebug = { fg = "#19dfcf" },
          KubectlSuccess = { fg = "#37f499" },
          KubectlPending = { fg = "#04d1f9" },
          KubectlDeprecated = { fg = "#5fa9f4" },
          KubectlExperimental = { fg = "#a5afc2" },
          KubectlNote = { fg = "#04d1f9" },
          KubectlGray = { fg = "#0D1116" },

          -- Colorcolumn that helps me with markdown guidelines
          ColorColumn = { bg = "#232e3b" },

          FzfLuaFzfPrompt = { fg = "#987afb", bg = "#0D1116" },
          FzfLuaCursorLine = { fg = "#37f499", bg = "#0D1116" },
          FzfLuaTitle = { fg = "#04d1f9", bg = "#0D1116" },
          FzfLuaSearch = { fg = "#ebfafa", bg = "#0D1116" },
          FzfLuaBorder = { fg = "#37f499", bg = "#0D1116" },
          FzfLuaNormal = { fg = "#ebfafa", bg = "#0D1116" },

          TelescopeNormal = { fg = "#ebfafa", bg = "#0D1116" },
          TelescopeMultiSelection = { fg = "#37f499", bg = "#0D1116" },
          TelescopeSelection = { fg = "#ebfafa", bg = "#232e3b" },
        }

        -- Apply all highlight definitions at once
        for group, props in pairs(highlight_definitions) do
          highlights[group] = props
        end
      end,
    },
  },

  -- secondary
  {
    "rebelot/kanagawa.nvim",
  },

  -- secondary
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
}
