{ ... }:

{
  programs.neovim = {
    enable       = true;
    defaultEditor = true;  # sets $EDITOR to nvim
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;

    initLua = ''
      -- ─────────────────────────────────────────────
      --  Options
      -- ─────────────────────────────────────────────
      local opt = vim.opt

      opt.number         = true
      opt.relativenumber = true

      opt.tabstop        = 2
      opt.shiftwidth     = 2
      opt.expandtab      = true
      opt.smartindent    = true

      opt.wrap           = false
      opt.scrolloff      = 8
      opt.sidescrolloff  = 8
      opt.signcolumn     = "yes"

      opt.ignorecase     = true
      opt.smartcase      = true
      opt.hlsearch       = false
      opt.incsearch      = true

      opt.termguicolors  = true
      opt.splitbelow     = true
      opt.splitright     = true
      opt.updatetime     = 50

      -- Use system clipboard
      opt.clipboard      = "unnamedplus"

      -- Persistent undo, no swap/backup clutter
      opt.swapfile = false
      opt.backup   = false
      opt.undodir  = vim.fn.stdpath("data") .. "/undodir"
      opt.undofile = true

      -- ─────────────────────────────────────────────
      --  Leader
      -- ─────────────────────────────────────────────
      vim.g.mapleader      = " "
      vim.g.maplocalleader = " "

      -- ─────────────────────────────────────────────
      --  Keymaps
      -- ─────────────────────────────────────────────
      local map = vim.keymap.set

      -- Window navigation
      map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
      map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
      map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
      map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

      -- Resize windows
      map("n", "<C-Up>",    "<cmd>resize +2<CR>")
      map("n", "<C-Down>",  "<cmd>resize -2<CR>")
      map("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
      map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

      -- Move selected lines up/down in visual mode
      map("v", "J", ":m '>+1<CR>gv=gv")
      map("v", "K", ":m '<-2<CR>gv=gv")

      -- Keep cursor centred when scrolling/searching
      map("n", "<C-d>", "<C-d>zz")
      map("n", "<C-u>", "<C-u>zz")
      map("n", "n",     "nzzzv")
      map("n", "N",     "Nzzzv")

      -- Paste without clobbering the register
      map("x", "<leader>p", [["_dP]], { desc = "Paste without losing register" })

      -- Yank to system clipboard explicitly
      map({ "n", "v" }, "<leader>y", [["+y]])
      map("n",          "<leader>Y", [["+Y]])

      -- Delete to void register
      map({ "n", "v" }, "<leader>d", [["_d]])

      -- Clear search highlight
      map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

      -- Buffer navigation
      map("n", "<leader>bn", "<cmd>bnext<CR>",     { desc = "Next buffer" })
      map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
      map("n", "<leader>bd", "<cmd>bdelete<CR>",   { desc = "Delete buffer" })

      -- Quick save / quit
      map("n", "<leader>w", "<cmd>w<CR>",  { desc = "Save" })
      map("n", "<leader>q", "<cmd>q<CR>",  { desc = "Quit" })
      map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

      -- Indent and stay in visual mode
      map("v", "<", "<gv")
      map("v", ">", ">gv")

      -- ─────────────────────────────────────────────
      --  Add plugins via programs.neovim.plugins
      -- ─────────────────────────────────────────────
    '';
  };
}
