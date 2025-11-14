{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
  
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.mod = import ./home.nix;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Network
  networking.hostName = "nixos-laptop";
  networking.wireless = {
      enable = true;
      networks = {
          "MO-home" = {
	      hidden = true;
	      psk = "Dk3109mo!?@";
	  };
      };
  };

  # Time zone.
  time.timeZone = "UTC";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  hardware.graphics.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  programs.bash.promptInit = ''
PS1='\n\[\e[38;5;245m\](\[\e[38;5;245m\]\A\[\e[38;5;245m\])\[\e[0m\] \[\e[38;5;40m\]\u\[\e[38;5;45m\]@\h\[\e[0m\] \[\e[38;5;245m\]in\[\e[0m\] \[\e[38;5;220m\]\w\[\e[0m\] \[\e[38;5;46m\]\$\[\e[0m\] '
  '';
  # Users
  users.users.mod = {
  isNormalUser = true;
  extraGroups = [ "wheel" ];
  };
  
  programs.niri.enable = true;
  programs.firefox.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
     wget
     neovim
     git
     foot
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

