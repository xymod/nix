-- бинды
vim.g.mapleader = " "                                                                  -- ЛИДЕР - пробел
vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { desc = "Close current buffer" })    -- Закрыть буфер
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })               -- Следующий буфер (вправо)
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })       -- Предыдущий буфер (влево)

-- Вставка из системного буфера
vim.keymap.set({'n', 'i'}, '<C-v>', '"+p', { silent = true, desc = "Paste from system clipboard" })
vim.keymap.set('i', '<C-v>', '<C-r>+', { silent = true, desc = "Paste from system clipboard" })

-- Копирование в системный буфер
vim.keymap.set({'v', 'i'}, '<C-c>', '"+y', { silent = true, desc = "Copy selection to system clipboard" })
vim.keymap.set('n', '<C-c>', '"+yy', { silent = true, desc = "Copy current line to system clipboard" })

vim.keymap.set("n", "-", function()
  local parent = vim.fn.expand("%:p:h")  -- путь к родительской папке текущего файла
  require("oil").open_float(parent)       -- открываем float
end, { desc = "Open parent directory in floating Oil" })

for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
    { desc = "Go to buffer " .. i }
  )
end
