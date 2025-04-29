return {
  {
    -- https://www.lazyvim.org/plugins/linting
    -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/linting.lua
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        html = { "htmlhint" },
        python = { "bandit" },
        java = { "checkstyle" },
        rust = { "ast_grep" },
        groovy = { "npm-groovy-lint" },
      },
    },
  },
}
