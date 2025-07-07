{ config, pkgs, ... }:

{


  # Konfigurasi GRUB
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";  # Untuk sistem EFI
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # ... (tambahkan bagian lain dari config Anda di sini)
}
