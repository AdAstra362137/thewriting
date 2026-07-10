{ lib, ... }:

let
  dir = builtins.readDir ./.;
  isImport = name: type:
    (type == "directory") ||
    (type == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name);
in
{
  imports = lib.mapAttrsToList (name: _: ./. + "/${name}")
    (lib.filterAttrs isImport dir);
}
