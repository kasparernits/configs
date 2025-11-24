-----------------------
-- General options
-----------------------
vim.g.mapleader = " "

vim.o.number = true              -- absolute line numbers
vim.o.relativenumber = true      -- relative line numbers
vim.o.termguicolors = true       -- 24-bit colors
vim.o.expandtab = true           -- use spaces instead of tabs
vim.o.shiftwidth = 2             -- indent width
vim.o.tabstop = 2
vim.o.mouse = "a"                -- enable mouse
vim.o.clipboard = "unnamedplus"  -- use system clipboard if available
vim.o.updatetime = 300
vim.o.signcolumn = "yes"

-----------------------
-- Keymaps
-----------------------
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic convenience
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>e", ":Ex<CR>", opts)  -- simple file explorer (netrw)

-- Telescope (after plugins)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-----------------------------------------------------------
-- Plugin manager: lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup({
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          telescope = true,
          treesitter = true,
          lualine = true,
        },
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },

  -- Telescope: fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter: better syntax highlighting / indentation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Completion (buffer + paths, no LSP)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
})

-----------------------------------------------------------
-- Treesitter configuration
-----------------------------------------------------------
local ok_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok_ts then
  ts_configs.setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "c",
      "cpp",
      "javascript",
      "typescript",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

-----------------------------------------------------------
-- Completion (nvim-cmp) without LSP
-----------------------------------------------------------
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  cmp.setup({
    snippet = {
      -- no snippet engine for now
      expand = function(_) end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<C-e>"] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
      { name = "buffer" },
      { name = "path" },
    }),
  })
end

