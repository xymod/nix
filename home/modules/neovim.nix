{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      wl-clipboard
    ];  

    programs.neovim = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;
    defaultEditor = true;

    #######################
    ###     Плагины     ###
    #######################
    plugins = with pkgs.vimPlugins; [
      lualine-nvim                        ## Строка статуса внизу
      indent-blankline-nvim               ## Вертикальные линии отступов (структура кода)
      oil-nvim                            ## Файловый менеджер (как буферы)
      bufferline-nvim                     ## Вкладки буферов сверху
      tokyonight-nvim                     ## Цветовая тема (UI + синтаксис)
      langmapper-nvim
      nvim-scrollbar
      gitsigns-nvim
      toggleterm-nvim
    ];

    #######################
    ###   LUA конфиг    ###
    #######################
    extraLuaConfig = ''
      -----------------------------
      --     Общие настройки     --
      -----------------------------
      vim.opt.number = true              -- Показывать абсолютный номер текущей строки
      vim.opt.relativenumber = true      -- Нумерация остальных строк - относительно текущей строки 
      vim.opt.cursorline = true          -- Выделять текущую строку на которой курсор
      vim.opt.termguicolors = true       -- Включаем поддержку 24-битных цветов
	    vim.opt.wrap = false
      vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,a:blinkon400-blinkoff250"

      -----------------------------
      --    Раскладка русская    --
      -----------------------------
      vim.opt.langmap = "йцукенгшщзфывапролдячсмитьЖ;qwertyuiopasdfghjklzxcvbnm:"                   -- Использование команд vim независимо от раскладки 
      vim.api.nvim_create_autocmd("CmdlineEnter", {                                                 -- переключить раскладку на английскую при вводе команды ":"
        pattern = ":",
        callback = function()
          vim.fn.system("niri msg action switch-layout 0")                                          -- переключаем на английскую расскладку через niri msg
        end,
      })


      -- отступы
      vim.opt.expandtab = true       -- пробелы, а не табы
      vim.opt.tabstop = 2            -- Tab равен 2 пробелам
      vim.opt.shiftwidth = 2         -- отступ уровней 2 пробела
      vim.opt.softtabstop = 2        -- Tab в Insert вводит 2 пробела
      vim.opt.autoindent = true      -- новая строка получает такой же отступ, как предыдущая
      vim.opt.smartindent = true     -- Neovim сам увеличивает отступ после {, if, for и т.п.

      -- бинды
      vim.g.mapleader = " "                                                                  -- ЛИДЕР - пробел
      vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { desc = "Close current buffer" })    -- Закрыть буфер
      vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })               -- Следующий буфер (вправо)
      vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })       -- Предыдущий буфер (влево)

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
      vim.opt.clipboard = "unnamedplus"
      -- Вставка из системного буфера
      vim.keymap.set({'n', 'i'}, '<C-v>', '"+p', { silent = true, desc = "Paste from system clipboard" })
      vim.keymap.set('i', '<C-v>', '<C-r>+', { silent = true, desc = "Paste from system clipboard" })

      -- Копирование в системный буфер
      vim.keymap.set({'v', 'i'}, '<C-c>', '"+y', { silent = true, desc = "Copy selection to system clipboard" })
      vim.keymap.set('n', '<C-c>', '"+yy', { silent = true, desc = "Copy current line to system clipboard" })

      -- Переключение в normal mode от бездействия
      vim.opt.updatetime = 8000                       -- время неактивности в ms
      vim.api.nvim_create_autocmd("CursorHoldI", { 
        callback = function()
          vim.cmd("stopinsert")                       -- команда выйти из Insert Mode
      end,
      })


      -----------------------------
      --        THEME            --
      -----------------------------
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

      -----------------------------
      --       scrollbar         --
      -----------------------------
      require("scrollbar").setup({
        hide_if_all_visible = false,
      })

      -----------------------------
      --       gitsigns          --
      -----------------------------
      require("gitsigns").setup({})

      -----------------------------
      --      langmapper         --
      -----------------------------
      require("langmapper").setup({
        map_all_ctrl = true,
      })

      -----------------------------
      --           oil           --
      -----------------------------
      require("oil").setup({
        -- Общие настройки
        default_file_explorer = true,                        -- Oil открывается при 'nvim .' или :e папка
        delete_to_trash = false,                             -- Удаление сразу полностью, без корзины
        skip_confirm_for_simple_edits = true,                -- Не показывать подтверждающие окна для простых операций
        -- Что показывать слева от директории/файла
        columns = {                    
          "permissions",                                     -- Права доступа
          "size",                                            -- Размер
          "icon",                                            -- Иконка
        },
      })

      -----------------------------
      --        TERMINAL         --
      -----------------------------
      require("toggleterm").setup({
        size = 15,                                          -- Высота терминала
        open_mapping = [[<leader>t]],                       -- Сочетание клавиш для открытия/закрытия терминала
        hide_numbers = true,                                -- Скрывать номера строк
        start_in_insert = true,                             -- Сразу входить в режим ввода
        insert_mappings = true,                             -- Разрешить хоткеи 
        persist_size = true,                                -- 
        direction = "horizontal",                           -- Расположение терминала снизу горизонтальное
        close_on_exit = true,                               -- Выход при вводе 'exit'
        shell = vim.o.shell,                                -- Использовать системный shell
      })

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])          -- Выход из terminal mode в normal mode по Esc

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
      require("bufferline").setup {
        options = {
          mode = "buffers",                                    -- Показывать буферы как вкладки
          separator_style = "slope",
          color_icons = true,                                  -- Показывать цветные иконки
          show_buffer_icons = true,                            -- Показывать иконки файлов в вкладке
          show_buffer_close_icons = false,                     -- Не показывать иконку закрытия (крестик)
          move_wraps_at_ends = true,                           -- Зацикленный переход между вкладками
          always_show_bufferline = false,                      -- Если буфер один, строка вкладок не показывается
          numbers = "ordinal",                                 -- Показывать порядковые номера вкладок
          indicator = {
            style = 'underline',                               -- Подсветка активного буфера снизу
          },
        },
      }

      -----------------------------
      --    indent-blankline     --
      -----------------------------
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
    '';
  };
}
