{ config, pkgs, lib, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "IosevkaTerm NFM:weight=Light:size=11";
        "dpi-aware" = "yes";
      };

      cursor = {
        style = "beam";
        "unfocused-style" = "none";
        blink = "yes";
        "blink-rate" = 500;
        "beam-thickness" = 1.0;
      };

      scrollback = {
        lines = 1000;
        multiplier = 8.0;
        "indicator-position" = "relative";
      };

      colors = {
        background = "1a1b26";   # Фон как Tokyonight в nvim
        foreground = "c0caf5";   # Основной текст как Tokyonight в nvim
      };

      key-bindings = {
        clipboard-copy = "Alt+c";
        clipboard-paste = "Alt+v";
      };
    };
  };
}
