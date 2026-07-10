{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    qgis
    grass
  ];
}
