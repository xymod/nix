{ config, pkgs, lib, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
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
    };
  };
}
