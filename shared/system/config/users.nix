{ pkgs, ... }:

{
  users.users.adastra = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
}
