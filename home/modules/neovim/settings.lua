--#########################--
------Настройки Neovim-------
--#########################--
-----------------------------
--        Основные         --
vim.opt.number         = true          -- Показывать абсолютный номер текущей строки
vim.opt.relativenumber = true          -- Нумерация остальных строк - относительно текущей строки 
vim.opt.mouse          = "a"           -- Включаем поддержку мыши во всех режимах
vim.opt.clipboard      = "unnamedplus" -- Включаем системный буфер (для копирования глобального)
vim.opt.langmap        = "йцукенгшщзфывапролдячсмитьЖ;qwertyuiopasdfghjklzxcvbnm:"  -- Использование команд vim независимо от раскладки 
-----------------------------
--         Файлы           --
vim.opt.swapfile       = false         -- Отключаем свап файл 
vim.opt.backup         = false         -- Отключаем создание физических резервных копий файлов при сохранении 
vim.opt.writebackup    = false         -- Отключаем создание временной резервной копии во время записи файла 
vim.opt.undofile       = true          -- Сохраняет историю undo, она восстанавливается при следующем открытии файла 
-----------------------------
--        Отступы          --
vim.opt.expandtab      = true          -- Таб делает пробелы а не табы
vim.opt.tabstop        = 2             -- Tab равен 2 пробелам
vim.opt.shiftwidth     = 2             -- Отступ уровней 2 пробела
vim.opt.smartindent    = true          -- Neovim сам увеличивает отступ после {, if, for и т.п.
-----------------------------
--           UI            --
vim.opt.cursorline     = true          -- Выделять текущую строку на которой курсор
vim.opt.termguicolors  = true          -- Включаем поддержку 24-битных цветов
vim.opt.wrap           = false         -- Отключаем перенос строки на новую строку
vim.opt.showmode       = false         -- Скрыть мод -- INSERT -- (делает lualine)
vim.opt.showcmd        = false         -- Скрыть вводимые команды
vim.opt.cmdheight      = 1             -- Высота строки ввода команд
vim.opt.scrolloff      = 8             -- Держать 8 строк вокруг курсора при прокрутке
vim.opt.guicursor      = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,a:blinkon400-blinkoff250" --
-----------------------------------------------
-- Переключение в normal mode от бездействия --
vim.opt.updatetime = 8000                         -- Время неактивности в ms
vim.api.nvim_create_autocmd("CursorHoldI", { 
  callback = function()
    vim.cmd("stopinsert")                         -- Команда выйти из Insert Mode
  end,
})
------------------------------------------------------
-- Переключение на английскую раскладку при вводе : --
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = ":",
  callback = function()
    vim.fn.system("niri msg action switch-layout 0")    -- переключаем на английскую расскладку через niri msg
  end,
})


