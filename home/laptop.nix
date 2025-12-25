{ config, pkgs, lib, ... }:

{
  home.username = "mod";
  home.homeDirectory = "/home/mod";
  home.stateVersion = "25.11";

  imports = [
    ./modules/neovim/neovim.nix
    ./modules/firefox.nix
    ./modules/foot.nix
    ./modules/git.nix
    ./modules/bash.nix
    ./modules/waybar/waybar.nix
    ./modules/fonts.nix
    ./modules/dircolors.nix
    ./modules/udiskie.nix
    ./modules/mako.nix
    #./modules/swaylock.nix
  ];

  home.file.".config/niri/config.kdl".source = ./modules/niri/config.kdl;
}
