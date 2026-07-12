{ inputs, config, pkgs, lib, ... }:
#let
# repoRoot = "${config.home.homeDirectory}/NixOS";
# storeSelf = toString ./.;
# storeRoot = toString inputs.self;
# subpath = lib.removePrefix "${storeRoot}/" storeSelf;
# realPath = "${repoRoot}/${subpath}";
# name = builtins.baseNameOf realPath;
# create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
#in

{ 
# xdg.configFile.${name} = {
#   source = create_symlink realPath;
#   recursive = true;
# };
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
      settings = {
        show_banner = false;
      };
    };
  };
}
