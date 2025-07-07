{ config, pkgs, ... }:

{
  # Thunar with NTFS support
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };


 fileSystems."/mnt/wd500gb" = {  # Ganti path mount sesuai kebutuhan
    device = "/dev/disk/by-uuid/481E98A91E989214";
    fsType = "ntfs";
    options = [
      "rw"           # Baca/tulis
      "uid=1000"      # Ganti dengan UID user Anda (cek via `id -u username`)
      "gid=100"       # Ganti dengan GID group users (biasanya 100)
      "nofail"        # Abaikan jika drive tidak terpasang saat boot
      "windows_names"  # Kompatibilitas nama file Windows
    ];
  };



fileSystems."/mnt/midasforce256" = {  # Ganti path mount sesuai kebutuhan
    device = "/dev/disk/by-uuid/2C326BF6326BC404";
    fsType = "ntfs";
    options = [
      "rw"           # Baca/tulis
      "uid=1000"      # Ganti dengan UID user Anda (cek via `id -u username`)
      "gid=100"       # Ganti dengan GID group users (biasanya 100)
      "nofail"        # Abaikan jika drive tidak terpasang saat boot
      "windows_names"  # Kompatibilitas nama file Windows
    ];
  };



  services.gvfs.enable = true;  # Mount auto-detection
  services.udisks2.enable = true;

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfat
    xarchiver  # Archive manager
    file-roller
  ];
}
