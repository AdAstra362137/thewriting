{ inputs, config, lib, pkgs, ... }:

{ 
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
# nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
 #  package = pkgs.millennium-steam;
  };
}
