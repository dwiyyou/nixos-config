{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # Font utama
      roboto
      inter
      jetbrains-mono
      
      # Font icon (Nerd Fonts)
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
      
      # Font emoji
      noto-fonts-emoji
      twitter-color-emoji
    ];

    # Konfigurasi fontconfig
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
