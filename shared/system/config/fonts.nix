{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.victor-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.go-mono
      nerd-fonts.geist-mono
      nerd-fonts.iosevka-term
      nerd-fonts.space-mono
      work-sans
    ];
  };
}
