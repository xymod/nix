{
  description = "NixOS + Flakes + HomeManager";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in 
   
  {
    nixosConfigurations = {
      nixos-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = { 
              useGlobalPkgs = true; 
              useUserPackages = true; 
              backupFileExtension = "backup"; 
              users.mod = import ./home/laptop.nix; 
            };
          }
        ];
      };
      server = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/server.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = { 
              useGlobalPkgs = true; 
              useUserPackages = true; 
              backupFileExtension = "backup"; 
              users.mod = import ./home/server.nix; 
            };
          }
        ];
      };
    };
  };
}

