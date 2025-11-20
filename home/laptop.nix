{ config, pkgs, lib, ... }:

{
  home.username = "mod";
  home.homeDirectory = "/home/mod";
  home.stateVersion = "25.05";

  programs.git.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
