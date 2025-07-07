{ config, pkgs, ... }:

{
  hardware.graphics.extraPackages = [ pkgs.amdvlk ];
hardware.graphics.enable32Bit = true;


   environment.systemPackages = with pkgs; [
    vkbasalt
    gamescope
    gamemode
    lact 
    heroic
   ];
                                                                               
  systemd.services.lactd = {
    description = "AMDGPU Control Daemon";
    enable = true;  
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    wantedBy = ["multi-user.target"];
  };
 
  
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";  # Fix AMD cursor
    RADV_PERFTEST = "gpl";          # Enable advanced Vulkan features
  };

 
}
