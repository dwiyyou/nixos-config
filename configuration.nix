{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hyprland.nix
    ./modules/greetd.nix
    ./modules/file-manager.nix
    ./modules/gaming.nix
    ./modules/app.nix
    ./modules/grub.nix
    ./modules/polkit.nix
    ./modules/fonts.nix
  ];

  # System-wide settings
  system.stateVersion = "23.11";
  hardware.graphics.enable = true;
  nixpkgs.config.allowUnfree = true;

users.users.dwiy = {
isNormalUser = true ;
description = "dwiy";
extraGroups = [ "networkmanager"  "wheel"];
};

networking.hostName = "dwiy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";




  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
environment.pathsToLink = ["/bin"];
environment.binsh = "${pkgs.bash}/bin/bash";

}
