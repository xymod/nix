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
  ];
}
