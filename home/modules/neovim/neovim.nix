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
      nvim-colorizer-lua
      nvim-hlslens
    ];

    #######################
    ###   LUA конфиги   ###
    #######################
    extraLuaConfig = ''
      ${builtins.readFile ./bindings.lua}
      ${builtins.readFile ./settings.lua}
      ${builtins.readFile ./plugins_settings.lua}
    '';
  };
}
