-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

wk.add({
  {
    "<leader>r",
    desc = "Register actions",
    icon = "",
  },
  {
    "<leader>rr",
    function()
      vim.cmd("reg")
    end,
    desc = "Open register",
  },
  {
    "<leader>ry",
    function()
      vim.fn.setreg("+", vim.fn.expand("%:p:."))
      vim.fn.getreg("+")
    end,
    desc = "Copy file path",
  },
  {
    "<leader>rx",
    function()
      vim.fn.setreg("+", vim.fn.expand("%:h"))
      vim.fn.getreg("+")
    end,
    desc = "Copy directory path",
  },
  {
    "<leader>rz",
    function()
      vim.fn.setreg("+", vim.fn.expand("%:t"))
      vim.fn.getreg("+")
    end,
    desc = "Copy file name",
  },
})
