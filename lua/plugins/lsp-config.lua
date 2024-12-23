return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwind-language-server",
        "emmet-language-server",
        "gopls",
        "jedi-language-server",
      },
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        filetypes = { "html", "css", "svelte", "javascriptreact", "typescriptreact" },
        capabilities = capabilities,
      })
      lspconfig.svelte.setup({
        on_attach = on_attach,
        filetypes = { "html", "css", "svelte", "javascriptreact", "typescriptreact" },
        capabilities = capabilities,
      })

      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css", "svelte", "javascriptreact", "typescriptreact" },

        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.dartls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
    end,
  },
}
