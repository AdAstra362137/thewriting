{ lib, config, pkgs-stable, ... }:

{ 
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "modrinth-app"
  ];
  home.packages = with pkgs-stable; [
    modrinth-app
  ];
}
