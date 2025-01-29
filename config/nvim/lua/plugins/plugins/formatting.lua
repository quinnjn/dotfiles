formatOptions = {
  lsp_fallback = true,
  async = true,
  timeout_ms = 1000,
}

return {
  {
    "stevearc/conform.nvim",
    event = { "LspAttach", "BufReadPost", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          graphql = { "prettier" },
        },
        format_after_save = formatOptions,
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format(formatOptions)
      end, { desc = "Format file or range (in visual mode)" })
    end,
  }
}
