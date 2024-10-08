return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },
  
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
},
-- language server protocol
{ "neovim/nvim-lspconfig",
dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim"
},
config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  require('mason').setup()
  local mason_lspconfig = require 'mason-lspconfig'
  mason_lspconfig.setup {
    ensure_installed = { "pyright" }
  }
  require("lspconfig").pyright.setup {
    capabilities = capabilities,
  }
end
},

-- autocompletion
{ "hrsh7th/nvim-cmp",
dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip"
},
config = function()
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local cmp = require('cmp')
  local luasnip = require('luasnip')

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    completion = {
      autocomplete = false
    },
    mapping = cmp.mapping.preset.insert ({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select=true }),
    }),
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }
  })
end
},
-- linting + formatting
{ "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
      }
    })
  end
}
