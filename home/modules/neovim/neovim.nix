{ config, pkgs, lib, ... }:
## На проверку
let
  oilLspDiagnostics = pkgs.vimUtils.buildVimPlugin {
    pname = "oil-lsp-diagnostics.nvim";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "JezerM";
      repo = "oil-lsp-diagnostics.nvim";
      rev = "master";
      sha256 = "oAoAQagOOwP4bJioGL8qC79oBWggldg2RivzTqgbYos=";
    };
    doCheck = false;
  };
in
{
    home.packages = with pkgs; [
      wl-clipboard
      ripgrep
    ];  

    programs.neovim = {
    ##########################
    ### Основные настройки ###
    ##########################
    enable = true;                        ## Включаем neovim
    defaultEditor = true;                 ## Редактор по умолчанию

    ##########################
    ### Установка плагинов ###
    ##########################
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      lualine-nvim                        ## Строка статуса внизу
      nvim-web-devicons
      indent-blankline-nvim               ## Вертикальные линии отступов (структура кода)
      oil-nvim                            ## Файловый менеджер (буфферный)
      oil-git-nvim                        ## Ототбражение git статуса в oil 
      oilLspDiagnostics                   ## Ототбражение lsp инфо в oil (справа от файла)
      noice-nvim                          ## Командная строка + уведомления
      nvim-notify
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
      ${builtins.readFile ./plugins/noice.lua}   -- Командная строка + уведомления
      ${builtins.readFile ./plugins/lualine.lua}   -- Командная строка + уведомления
      ${builtins.readFile ./plugins/catppuccin.lua}          -- Файловый менеджер буфферный


    '';
  };
}
