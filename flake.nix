{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    #home manager
    home-manager = {
      url = "github:nix-community/home-manager"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #zen-browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake"; 
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
 #  niri = {
 #    url = "github:sodiboo/niri-flake"; 
 #    inputs.nixpkgs.follows = "nixpkgs";
 #  };
    noctalia = {
      url = "github:noctalia-dev/noctalia"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    creamlinux-installer = {
      type = "github";
      owner = "Novattz";
      repo = "creamlinux-installer";
      flake = false;
    };
 #  tagstudio = {
 #    url = "github:TagStudioDev/TagStudio";
 #    inputs.nixpkgs.follows = "nixpkgs";
 #  };
 #  millennium = {
 #    url = "github:SteamClientHomebrew/Millennium/next?dir=packages/nix";
 #  };
    niri-screen-time = {
      url = "github:probeldev/niri-screen-time";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      packages = [
        ./shared/system
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        cuneiform = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = packages ++ [
            ./cuneiform/system
            {
              home-manager = {
                users.adastra = { pkgs, self, inputs, ... }: { 
		  imports = [
		    ./cuneiform/home
		    ./shared/home
		  ];
		};
                extraSpecialArgs = { inherit self inputs; };
              };
            }
          ];
        };
      };
    
  };
}
