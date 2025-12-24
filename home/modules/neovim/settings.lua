--#########################--
------Настройки Neovim-------
--#########################--
-----------------------------
--        Основные         --
vim.opt.number         = true          -- Показывать абсолютный номер текущей строки
vim.opt.relativenumber = true          -- Нумерация остальных строк - относительно текущей строки 
vim.opt.mouse          = "a"           -- Включаем поддержку мыши во всех режимах
vim.opt.clipboard      = "unnamedplus" -- Включаем системный буфер (для копирования глобального)
vim.opt.whichwrap      = "<,>,h,l"     -- Для перемещения между строк при нажатии вправо/влево 
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
--         Поиск           --
vim.opt.ignorecase     = true          -- Игнорировать регистр при поиске
vim.opt.smartcase      = true          -- Большая буква в поиске = чувствительный регистр 
vim.opt.incsearch      = true          -- Neovim показывает совпадения по мере ввода поискового запроса
vim.opt.hlsearch       = true          -- Включаем подсветку совпадений
-----------------------------
--           UI            --
vim.opt.cursorline     = true          -- Выделять текущую строку на которой курсор
vim.opt.termguicolors  = true          -- Включаем поддержку 24-битных цветов
vim.opt.wrap           = false         -- Отключаем перенос строки на новую строку
vim.opt.showmode       = false         -- Скрыть мод -- INSERT -- (делает lualine)
vim.opt.showcmd        = false         -- Скрыть вводимые команды
vim.opt.cmdheight      = 1             -- Высота строки ввода команд
vim.opt.scrolloff      = 8             -- При прокрутке jk курсор держится от края 
vim.opt.sidescrolloff  = 8             -- При прокрутке hl курсор держится от края 
vim.opt.splitbelow     = true          -- Новый горизонтальный сплит всегда снизу 
vim.opt.splitright     = true          -- Новый вертикальный сплит всегда справа 
vim.opt.numberwidth    = 4             -- Ширина столбца нумерации строк
vim.opt.guicursor      = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,a:blinkon400-blinkoff250" -- Настройки курсора
----------------------------------------------------
-- Переключение из insert в normal от бездействия --
vim.opt.updatetime     = 8000                         -- Время неактивности в ms
vim.api.nvim_create_autocmd("CursorHoldI", { 
  callback = function()
    vim.cmd("stopinsert")                             -- Команда выйти из Insert Mode
  end,
})
------------------------------------------------------
-- Переключение на английскую раскладку при вводе : --
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = ":",                                       --
  callback = function()
    vim.fn.system("niri msg action switch-layout 0")   -- Переключение на английскую расскладку через niri msg
  end,
})


