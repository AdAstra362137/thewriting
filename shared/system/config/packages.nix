{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    playerctl
    wl-clipboard
    testdisk
    ntfs3g
    exfat
    python314Packages.send2trash
  ];
}
