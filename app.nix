{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ### Terminal & CLI Tools ###
    kitty               # GPU-accelerated terminal
   # alacritty           # Alternatif terminal cepat
   # tmux                # Terminal multiplexer
    neovim              # Editor teks modern
    git                 # Version control
    wget                # Download manager
    curl                # HTTP client
    htop                # System monitor
    ripgrep             # Search tool
    fzf                 # Fuzzy finder
    geany
    zsh
    fastfetch
    neofetch
    btop
    cava
    openssl
    cmake
    meson
    cpio

   nwg-look
   nwg-displays
   ags
   rPackages.ags

  ##audio
  pamixer
  jamesdsp



  ####kebutuhanku
  discord
  rPackages.telegram
  google-chrome
  brave
  qbittorrent
  distrobox
  podman
  

  

    ### Browsers ###
    firefox             # Browser utama
   # google-chrome       # Alternatif (opsional)
   # qutebrowser         # Browser keyboard-driven

    ### File Management ###
    #thunar              # File manager GUI
    #xfce.thunar-volman  # Auto-mount removable media
    #gnome.file-roller   # Archive manager
    ranger              # CLI file manager
   # pcmanfm             # Alternatif file manager ringan

    ### Multimedia ###
    mpv                 # Video player
    vlc                 # Alternatif media player
    feh                 # Image viewer
    imv                 # Image viewer Wayland-native
    pavucontrol         #Audio control
    helvum              # PipeWire patchbay

    ### Gaming ###
    #steam               # Game platform
    lutris              # Game launcher
    mangohud            # Performance overlay
    goverlay            # MangoHUD GUI
    protonup-qt         # Proton-GE installer
               # App launcher
  ];

###pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; } 
programs.zsh.enable = true;
users.users.dwiy = {
    shell = pkgs.zsh;
};
}
