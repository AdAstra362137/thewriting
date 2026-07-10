{ config, lib, pkgs, ... }:
{
# nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
 #  "steam"
 #  "steam-original"
 #  "stean-unwrapped"
 #  "steam-run"
 #  "nvidia-x11"
 #  "nvidia-settings"
# ];
  nixpkgs.config.allowUnfree = true;
}
