{ pkgs, ... }:

{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "cz";
        variant = "";
      };
    };
    displayManager.sddm.wayland.enable =true;
    libinput.enable = true;
    pipewire.enable = true;
    udisks2.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
	cups-browsed
      ];
    };
  };
}
