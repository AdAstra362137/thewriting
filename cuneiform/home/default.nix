{ lib, self, inputs, ... }:
let
  dir = builtins.readDir ./.;
  isImport = name: type:
    (type == "directory") ||
    (type == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name);
  autoImports = lib.mapAttrsToList (name: _: ./. + "/${name}")
      (lib.filterAttrs isImport dir);
in
{
  imports = autoImports;
  home = {
    username = "adastra";
    homeDirectory = "/home/adastra";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
