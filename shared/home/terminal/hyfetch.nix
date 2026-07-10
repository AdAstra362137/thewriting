
{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    hyfetch
  ];
}
