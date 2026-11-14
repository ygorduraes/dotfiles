return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "harper-ls") then
        table.insert(opts.ensure_installed, "harper-ls")
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.lsp.config("harper", {
        cmd = { "harper-ls", "--stdio" },
        filetypes = { "markdown", "mdx", "text", "tex", "typst" },
        root_markers = { ".git" },
        -- Harper doesn't yet have dedicated MDX support, so send MDX buffers
        -- as Markdown without changing their Neovim filetype/highlighting.
        get_language_id = function(_, filetype)
          return filetype == "mdx" and "markdown" or filetype
        end,
        settings = {
          ["harper-ls"] = {
            dialect = "British",
          },
        },
      })

      vim.api.nvim_create_user_command("Harper", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filetype = vim.bo[bufnr].filetype
        local supported = { markdown = true, mdx = true, text = true, tex = true, typst = true }

        if not supported[filetype] then
          vim.notify("Harper supports Markdown/MDX, text, TeX, and Typst buffers", vim.log.levels.WARN)
          return
        end

        if vim.fn.executable("harper-ls") ~= 1 then
          vim.notify("harper-ls is not installed yet; install it with Mason and try again", vim.log.levels.ERROR)
          return
        end

        local config = vim.lsp.config.harper
        local client_id = vim.lsp.start(config, { bufnr = bufnr })
        if client_id then
          vim.notify("Harper is checking the current buffer", vim.log.levels.INFO)
        end
      end, { desc = "Start Harper spell-checking for the current buffer" })
    end,
  },
}
