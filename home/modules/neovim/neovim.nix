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
      nvim-colorizer-lua
      nvim-hlslens
      nvim-autopairs                      ## Автозакрытие кавычек/скобок 
      smear-cursor-nvim                   ## Анимация курсора
      modicator-nvim                      ## Цвет номера текущей строки от режима
      (nvim-treesitter.withPlugins (plugins: [
        plugins.bash
        plugins.lua
        plugins.nix
        plugins.json
        plugins.css
        plugins.html
        plugins.javascript
      ]))
    ];

    #######################
    ###   LUA конфиги   ###
    #######################
    extraLuaConfig = ''
      ${builtins.readFile ./bindings.lua}
      ${builtins.readFile ./settings.lua}
      ${builtins.readFile ./terminal.lua}
      ${builtins.readFile ./plugins_settings.lua}
      --     Плагины       --
      ${builtins.readFile ./plugins/oil.lua}          -- Файловый менеджер буфферный
    '';
  };
}
