{ inputs, pkgs, ... }:

{ 
  home.packages = with pkgs; [
    (import inputs.creamlinux-installer { inherit pkgs; })
  ];
}
