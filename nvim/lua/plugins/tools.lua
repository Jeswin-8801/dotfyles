return {
  -- lazydocker.nvim
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({
        border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
      })
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>td",
        function()
          require("lazydocker").open()
        end,
        desc = "Lazydocker",
      },
    },
  },

  -- feature to provide function tree
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '[{' and ']}'
          vim.keymap.set("n", "[{", "<cmd>AerialPrev<CR>", { desc = "Aerial Prev", buffer = bufnr })
          vim.keymap.set("n", "]}", "<cmd>AerialNext<CR>", { desc = "Aerial Next", buffer = bufnr })
        end,
      })
      -- keymap to toggle Aerial in keymanps.lua
    end,
  },

  -- view image files
  {
    "edluffy/hologram.nvim",
    -- disabling as it is not currently supported on windows
    enabled = false,
    config = function()
      require("hologram").setup({
        auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
      })
    end,
  },

  -- search and replace in all files
  -- NOTE: This plugin comes default with Lazyvim
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      -- NOTE: The main '<leader>sr' keymap is configured in 'config/keymaps.lua'
      {
        "<leader>srr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search/Replace in all files",
      },
      {
        "<leader>srf",
        function()
          local grug = require("grug-far")
          grug.open({
            prefills = {
              paths = vim.fn.expand("%"),
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search/Replace in current File",
      },
      {
        "<leader>src",
        function()
          local grug = require("grug-far")
          grug.open({
            prefills = {
              search = vim.fn.expand("<cword>"),
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search current word under cursor",
      },
      {
        "<leader>srv",
        function()
          local grug = require("grug-far")
          grug.open({ visualSelectionUsage = "operate-within-range" })
        end,
        mode = { "n", "v" },
        desc = "Search inside current visual selection",
      },
    },
  },

  -- tags important files for quick navigation
  {
    "cbochs/grapple.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    keys = {
      { "<leader>tgm", "<cmd>Grapple toggle<CR>", desc = "Grapple toggle tag" },
      { "<leader>tgM", "<cmd>Grapple toggle_tags<CR>", desc = "Grapple open tags window" },
      { "<leader>tgn", "<cmd>Grapple cycle_tags next<CR>", desc = "Grapple cycle next tag" },
      { "<leader>tgp", "<cmd>Grapple cycle_tags prev<CR>", desc = "Grapple cycle previous tag" },
    },
  },

  -- Git Diff view
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gdd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
      { "<leader>gdc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
      { "<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", desc = "Diffview Toggle Files" },
      { "<leader>gdf", "<cmd>DiffviewFocusFiles<CR>", desc = "Diffview Focus Files" },
    },
  },

  -- Git graph
  {
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "⏣",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          print("selected commit:", commit.hash)
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          print("selected range:", from.hash, to.hash)
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },

  -- Calendar
  {
    "itchyny/calendar.vim",
    -- NOTE: The main '<leader>tc' keymap is configured in 'config/keymaps.lua'
    keys = {
      {
        "<leader>tcc",
        "<cmd>Calendar<CR>",
        desc = "Toggle Calendar!",
      },
      {
        "<leader>tcy",
        "<cmd>Calendar -view=year<CR>",
        desc = "Show Year Calendar",
      },
      -- NOTE: Toggle clock keymap is placed in 'config/keymaps.lua'
    },
  },
}
