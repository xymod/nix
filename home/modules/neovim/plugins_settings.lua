----------------------------------------------------------
--      tokyonight         --       Цветовая тема       --
----------------------------------------------------------
require("tokyonight").setup({
  style = "night",                    -- Выбрал его как самый контрастный и темный
  transparent = false,                -- Фон не прозрачный
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
})

vim.cmd.colorscheme("tokyonight")
----------------------------------------------------------
--        lualine          --    Строка статуса снизу   --
----------------------------------------------------------
require("lualine").setup {
  options = {
    globalstatus = true,                                 -- Единая строка статуса внизу 
    theme = "auto",                                      -- Тема
  },
  sections = {
    lualine_a = { "mode" },                              -- Режим NORMAL/INSERT/…
    lualine_b = { "filename" },                          -- Имя файла
    lualine_c = { "branch" },                            -- Ветка git
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

-----------------------------------------------------------
--        bufferline       --    Вкладки буферов сверху  --
-----------------------------------------------------------
local bufferline = require('bufferline')                 --
bufferline.setup {
  options = {
    mode                    = "buffers",                 -- Показывать буферы как вкладки
    separator_style         = "slant",                   -- Внешний вид формы вкладок
    color_icons             = true,                      -- Показывать цветные иконки
    show_buffer_icons       = true,                      -- Показывать иконки файлов в вкладке
    show_buffer_close_icons = false,                     -- Не показывать иконку закрытия (крестик)
    move_wraps_at_ends      = true,                      -- Зацикленный переход между вкладками
    always_show_bufferline  = true,                      -- Показывать bufferline всегда
    numbers                 = "ordinal",                 -- Показывать порядковые номера вкладок
    indicator = {
      style                 = 'none',                    -- Убираем индикатор активного буффера (подчеркивание)
    },
    style_preset            = bufferline.style_preset.no_italic,  -- Убирает весь курсивный текст
  },
}

----------------------------------------------------------
--      toggleterm         --         Терминал          --
----------------------------------------------------------
require("toggleterm").setup({
  size            = 15,                                 -- Высота терминала
  open_mapping    = [[<leader>t]],                      -- Сочетание клавиш для открытия/закрытия терминала
  hide_numbers    = true,                               -- Скрывать номера строк
  start_in_insert = true,                               -- Сразу входить в режим ввода
  insert_mappings = true,                               -- Разрешить хоткеи 
  persist_size    = true,                               -- 
  direction       = "float",                            -- Терминал как всплывающее окно
  close_on_exit   = true,                               -- Выход при вводе 'exit'
  shell           = vim.o.shell,                        -- Использовать системный shell
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])          -- Выход из terminal mode в normal mode по Esc

--------------------------------------------------------------
--           oil           -- Файловый менеджер (буфферный) --
--------------------------------------------------------------
require("oil").setup({
  -- Общие настройки
  default_file_explorer         = true,                -- Oil открывается при 'nvim .' или :e папка
  delete_to_trash               = false,               -- Удаление сразу полностью, без корзины
  skip_confirm_for_simple_edits = true,                -- Не показывать подтверждающие окна для простых операций
  -- Что показывать слева от директории/файла
  columns = {                    
    "permissions",                                     -- Права доступа
    "size",                                            -- Размер
    "icon",                                            -- Иконка
  },
})

----------------------------------------------------------
--       scrollbar         --                           --
----------------------------------------------------------
require("scrollbar").setup({
  hide_if_all_visible = false,
})

----------------------------------------------------------
--       gitsigns          --
----------------------------------------------------------
require("gitsigns").setup({
  signcolumn = true,                                    -- 
})

vim.cmd([[
  highlight GitSignsAdd           guifg=#7fff5f guibg=NONE  " Для новых строк
  highlight GitSignsChange        guifg=#e0af68 guibg=NONE  " Для измененных строк 
  highlight GitSignsDelete        guifg=#f7768e guibg=NONE  " Для удаленных строк
  highlight GitSignsChangeDelete  guifg=#bb9af7 guibg=NONE  " 
  highlight GitSignsUntracked     guifg=#7dcfff guibg=NONE  " 
]])

----------------------------------------------------------
--      langmapper         --
----------------------------------------------------------
require("langmapper").setup({
  map_all_ctrl = true,
})

----------------------------------------------------------
--      colorizer          --
----------------------------------------------------------
require('colorizer').setup()

----------------------------------------------------------
--    indent-blankline     --
----------------------------------------------------------
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed",     { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow",  { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue",    { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange",  { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen",   { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet",  { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan",    { fg = "#56B6C2" })
end)

require("ibl").setup {
  indent = {
    highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowGreen",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowViolet",
      "RainbowCyan",
    },
	},
}
