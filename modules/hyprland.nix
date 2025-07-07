{ config, pkgs, ... }:

{
  # Enable Hyprland with XWayland support
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # Enable NixOS patches for better integration
  };

  # Essential system packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Hyprland essentials
    waybar                  # Status bar
    rofi-wayland            # App launcher (Wayland-native)
    swaybg                  # Background setter
    swaylock-effects        # Lockscreen with effects
    wl-clipboard            # Clipboard utilities (wl-copy/wl-paste)
    grim                    # Screenshot tool
    slurp
    zenity
    swaynotificationcenter
    kdePackages.qt6ct
    kdePackages.qt5compat
    themechanger
    sassc
    gtk3
    gjs

    # Hyprland utilities
    hyprpaper               # Wallpaper daemon
    hyprpicker              # Color picker
    hyprcursor              # Cursor theme manager
    hyprnotify              # Notification daemon

    # Media/UI
    mpv                     # Video player
    mpvScripts.mpv-notify-send  # MPV notifications
    swww                    # Animated wallpapers
    yad                     # GUI dialogs/notifications
    wlogout                 # Logout menu

    # Hardware control
    wl-gammactl             # Gamma adjustment
    networkmanagerapplet    # NetworkManager GUI
    brightnessctl           # Backlight control

    # Theming
    wallust                 # Dynamic wallpaper colors
    adw-gtk3                # Consistent GTK theme
    pkgs.gnome-themes-extra
    adwaita-qt
    arc-theme 
 ];

  # Enable necessary services
  services = {
    dbus.enable = true;
  };

  # Environment variables for Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";   # Enable Wayland for Electron apps
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };



  # Untuk memastikan tema dikenali, bisa pakai environment variables juga:
  environment.sessionVariables = {
    GTK_THEME = "Arc-Dark"; # contoh nama tema
  };





}
