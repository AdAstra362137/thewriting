{ inputs, config, pkgs, lib, ... }:

{
  programs.niri = {
    enable = true;
  };
  services.displayManager.defaultSession = "niri";
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
