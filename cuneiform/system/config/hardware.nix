{ config, lib, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
    nvidia.open = true;
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
  ];
}
