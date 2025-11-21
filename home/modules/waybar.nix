{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        height = 25;
      };
    };
  };
}
