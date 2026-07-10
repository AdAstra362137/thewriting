{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    protonup-rs
  ];
}
