local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set

-------------------------------------------
----------------- 正常模式 ----------------
-------------------------------------------
keymap("n", ";", ":")
keymap("n", "H", "^")
keymap("n", "L", "$")
-- 窗口
keymap("n", "ss", "<C-w>v")
keymap("n", "sv", "<C-w>s")
keymap("n", "<Down>", ":res +5<CR>", opt)
keymap("n", "<Up>", ":res -5<CR>", opt)
keymap("n", "<Left>", ":vertical resize-5<CR>", opt)
keymap("n", "<Right>", ":vertical resize+5<CR>", opt)
map("n", "<C-a>", "gg<S-v>G", opt)

-- buffer
vim.api.nvim_create_user_command("BufferCloseOther", function()
	require("kide.core.utils").close_other_bufline()
end, {})
map("n", "tn", ":BufferLineCycleNext <CR>", opt)
map("n", "tp", ":BufferLineCyclePrev <CR>", opt)
map("n", "tt", ":tabedit", opt)
map("n", "tmn", "-tabmove<CR>", opt)
map("n", "tmp", "+tabmove<CR>", opt)

-- 取消高亮
keymap("n", "<leader>nh", ":nohl<CR>")

-------------------------------------------
----------------- 插入模式 ----------------
-------------------------------------------
keymap("i", "jk", "<ESC>")
map("i", "<C-j>", "<Down>", opt)
map("i", "<C-k>", "<Up>", opt)
map("i", "<C-l>", "<Right>", opt)
map("i", "<C-h>", "<Left>", opt)

map("n", "<C-a>", "gg<S-v>G", opt)
map("n", "+", "<C-a>", opt)
map("n", "-", "<C-x>", opt)

-------------------------------------------
----------------- 视觉模式 ----------------
-------------------------------------------
-- 单行或多行移动
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

map("v", "H", "^", opt)
map("v", "L", "$", opt)

-- bufferline.nvim
keymap("n", "<Space>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opt)
keymap("n", "<Space>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opt)
keymap("n", "<Space>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opt)
keymap("n", "<Space>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opt)
keymap("n", "<Space>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opt)
keymap("n", "<Space>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opt)
keymap("n", "<Space>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opt)
keymap("n", "<Space>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opt)
keymap("n", "<Space>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opt)

map("n", "<space>t", ":ToggleTerm<CR>", opt)
map("n", "<space>o", ":<C-u>SymbolsOutline<CR>", opt)
map("n", "<leader>tm", ":TableModeToggle<CR>", opt)
