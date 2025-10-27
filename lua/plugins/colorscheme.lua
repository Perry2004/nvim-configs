return {
  -- 1. Tell LazyVim to use Catppuccin as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- 2. Configure Catppuccin using the defaults you provided,
  --    but adding the auto-switching logic.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure this loads first
    opts = {
      -- ADDED: This is the magic for auto-switching
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },

      -- KEPT: All the LazyVim defaults you referenced
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    -- KEPT: The default spec for bufferline integration
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
      },
    },
  },

  -- 3. Add the plugin to sync with the macOS system theme
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false, -- Make sure this plugin loads on startup
    priority = 1001, -- Load after Catppuccin
    config = function()
      require("auto-dark-mode").setup({
        -- This function runs when "dark" mode is detected
        set_dark_mode = function()
          vim.o.background = "dark"
        end,
        -- This function runs when "light" mode is detected
        set_light_mode = function()
          vim.o.background = "light"
        end,
      })
    end,
  },
}
