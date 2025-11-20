{ config, pkgs, lib, ... }:

{
  home.username = "mod";
  home.homeDirectory = "/home/mod";
  home.stateVersion = "25.05";

  imports = [
    ./modules/neovim.nix
    ./modules/firefox.nix
    ./modules/foot.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/waybar.nix
    ./modules/fonts.nix
  ];

  home.file.".config/niri/config.kdl".source = ./modules/niri/config.kdl;
}
