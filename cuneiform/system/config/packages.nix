{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    playerctl
    wl-clipboard
    testdisk
    ntfs3g
    exfat
    python314Packages.send2trash
  ];
}
