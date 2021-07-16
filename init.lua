O = {
  lsp = {
    document_highlight = true,
    popup_border = "single",
  },

  lang = {
    emmet = { active = true },
    json = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "python",
        args = { "-m", "json.tool" },
      },
    },
    lua = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "stylua",
        args = {},
        stdin = false,
      },
    },
    php = {
      format = {
        format = {
          default = "psr12",
        },
      },
      environment = {
        php_version = "7.4",
      },
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "php", "phtml" },
      formatter = {
        exe = "phpcbf",
        args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
        stdin = false,
      },
    },
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      formatter = {
        exe = "prettier",
        args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
        stdin = false,
      },
    },
    tsserver = {
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
        stdin = false,
      },
    },
    vim = {},
    yaml = {
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
  },
}

CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

require("settings")
require("plugins")
require("colorscheme")
require("config")
require("utils")
require("config-lsp")

require("mappings") -- should be a good idea to move all plugin bindings into this file
