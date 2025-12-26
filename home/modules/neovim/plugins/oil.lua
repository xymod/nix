--#########################-------------------------------------------
--      Плагин: oil      ##     Файловый менеджер (буфферный)       --
--#########################-------------------------------------------
require("oil").setup({
  -- 1. Общие настройки --
  default_file_explorer         = true,           -- Файловый менеджер по умолчанию
  skip_confirm_for_simple_edits = true,           -- Не показывать подтверждения для простых операций
  delete_to_trash               = false,          -- Удаление в корзину (false - перманентно)
  use_default_keymaps           = false,          -- Использовать стандартные биндинги
  columns                       = { "icon" },     -- Что показывать слева от директории/файла
  -- 2. Отображение --
  view_options = {
    show_hidden                 = true,           -- Показывать скрытые файлы
    -- 2.1 Какие файлы всегда скрывать --
    is_always_hidden = function(name, bufnr)
      return name == ".."                         -- Список "что не показывать"
    end,
  },
  -- 2.2 Внешний вид окна 
  float = {
    padding = 1,                                  -- Отступ
    border = "single",                            -- Вид рамки
  },
  git = {
    add = function(path)
      return true  -- git add file
    end,
    mv = function(src, dest)
          return true  -- git mv src dest
    end,
    rm = function(path)
          return true  -- git rm file
    end,
  },
  -- 3. Биндинги в буфере oil --
  keymaps = {
    ["<Esc>"] = "actions.close",                  -- (ESC) Закрыть буфер Oil
    ["<CR>"]  = "actions.select",                 -- (Enter) Открыть файл/зайти в директорию
    ["gx"]    = "actions.open_external",          -- Открывать файлы в ассоциирующихся программах 
  },
})
-- 4. Биндинги глобальные
-- 4.1 Открытие oil в текущей директории на "-" 
vim.keymap.set("n", "-", function()                             -- Нормальный режим, клавиша "-"
    return vim.bo.filetype == "oil"                             -- Если текущий буфер oil
        and vim.cmd("Oil")                                      -- Выполнить команду :Oil (подняться на уровень выше) 
        or require("oil").open_float(vim.fn.expand("%:p:h"))    -- Иначе открыть oil в текущей директории в флоат окне 
end)

