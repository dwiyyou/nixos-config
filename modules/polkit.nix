{ config, pkgs, ... }:

{
  security.polkit.enable = true;  # Aktifkan Polkit

  # Paket Gnome Polkit (GUI Authentication)
  environment.systemPackages = with pkgs; [
    polkit_gnome
    pkgs.gnome-settings-daemon  # Opsional: Untuk integrasi Gnome
  ];

  # Autostart Polkit-Gnome saat login
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "Polkit Gnome Authentication Agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
