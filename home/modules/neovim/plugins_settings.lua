----------------------------------------------------------
--     Плагин tokyonight         --   Цветовая тема     --
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

--##########################------------------------------
--      Плагин lualine      --    Строка статуса снизу  --
--##########################------------------------------
require("lualine").setup {
  ---------------------
  -- Общие настройки --
  options = {
    globalstatus = false,            -- У каждого буфера свой lualine
    theme        = "auto",           -- Тема
  },
  ---------------------------
  -- Секции в активном окне--
  sections = {
    lualine_a = { "mode" },          -- Режим NORMAL/INSERT/…
    lualine_b = { "filename" },      -- Имя файла
    lualine_c = { 
      "branch",                      -- Ветка git
      "diagnostics",                 -- Ошибки 
    },                            
    lualine_x = { "searchcount" },   -- Индикатор свопадений поиска 
    lualine_y = {},
    lualine_z = { "lsp_status" },    -- Информация о LSP 
  },
  -----------------------------
  -- Секции в НЕактивном окне--
  inactive_sections = {
    lualine_a = { 'hostname' },      -- Имя хоста
    lualine_b = { 'filename' },      -- Имя файла
    lualine_c = { "lsp_status" },    -- Информация о LSP
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  ----------------
  -- Расширения -- Специальное отображение lualine в соответствующих буфферах 
  extensions = {
    "oil",                                               -- Файловый менеджер (буфферный) oil
    "toggleterm",                                        -- Терминал 
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

--#########################-------------------------------
--      toggleterm         --         Терминал          --
--#########################-------------------------------
require("toggleterm").setup({
  ---------------------
  -- Общие настройки --
  open_mapping    = [[<leader>t]],  -- Сочетание клавиш для открытия/закрытия терминала
  autochdir       = true,           -- Терминал открывается там, где ткущая директория Neovim
  hide_numbers    = true,           -- Скрывать номера строк
  start_in_insert = true,           -- Сразу входить в режим ввода
  insert_mappings = true,           -- Разрешить хоткеи 
  persist_size    = false,          -- При открытии предыдущие размеры терминала (false - всегда дефолтные) 
  direction       = "float",        -- Терминал как всплывающее окно
  close_on_exit   = true,           -- Выход при вводе 'exit'
  shell           = vim.o.shell,    -- Использовать системный shell
  ---------------------
  --    Вид окна     --
  highlights = {
    Normal = {
      guibg   = "#262733",          -- Цвет фона не в плавающем окне
    },
    NormalFloat = {
      guibg   = "#262733",          -- Цвет фона в плавающем окне
    },
    FloatBorder = {
      guifg   = "#9d7cd8",          -- Цвет рамки
      guibg   = "NONE",             -- Цвет фона рамки
    },
  },
  float_opts = {
    border    = 'curved',           -- Вид рамки
    winblend  = 0,                  -- Прозрачность (0 - непрозрачное)
  },
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])          -- Выход из terminal mode в normal mode по Esc

--------------------------------------------------------------
--           oil           -- Файловый менеджер (буфферный) --
--------------------------------------------------------------
require("oil").setup({
  ---------------------
  -- Общие настройки --
  default_file_explorer         = true,     -- Oil открывается при 'nvim .' или :e папка
  delete_to_trash               = false,    -- Удаление сразу полностью, без корзины
  skip_confirm_for_simple_edits = true,     -- Не показывать подтверждающие окна для простых операций
  ----------------------------------------------
  -- Что показывать слева от директории/файла --
  columns = {                    
    "permissions",                                     -- Права доступа
    "size",                                            -- Размер
    "icon",                                            -- Иконка
  },
})

--#########################-------------------------------
--       scrollbar         --                           --
--#########################-------------------------------
require("scrollbar").setup({
  ---------------------
  -- Общие настройки --
  show                = true,     -- Показывать скроллбар
  show_in_active_only = true,     -- Показывать скроллбар только в активном буфере
  set_highlights      = true,     -- 
  ---------------------
  --  Вид ползунка   --
  handle = {
    blend             = 30,       -- Прозрачность ползунка 0-100 (0 - непрозрачный)
    color             = "#9b59b6",-- Цвет ползунка
  },
  ---------------------
  -- Содержимое бара --
  handlers = {
    cursor            = false,    -- Показывать текущую позицию курсора на скроллбаре
    diagnostic        = true,     -- Показывать ошибки/предупреждения из LSP 
    gitsigns          = true,     -- Показывать изменения git (требует gitsigns)
    handle            = true,     -- Отображать сам ползунок скроллбара
    search            = true,     -- Показывать результаты поиска (требует hlslens)
    ale               = false,    -- Requires ALE
  },
})

--#########################-------------------------------
--         hlslens         --                           --
--#########################-------------------------------
require('hlslens').setup({})

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
