# Configures fonts for NixOS.
#
# Defines a `fonts` attribute that sets up font packages, default fonts for
# fontconfig, and enables the fontDir module.
#
# The font packages include various fonts like Operator Mono, JetBrains Mono,
# Lexend, Noto Color Emoji etc.
#
# The defaultFonts config sets Operator Mono as the default monospace font,
# Lexend as the default sans-serif font, Noto Serif as the default serif font,
# and Noto Color Emoji as the default emoji font.
#
# fontDir is enabled to allow user-specific font directories.
#
# Default font packages from NixOS are disabled.
{ pkgs, ... }:
{
  fonts =
    let
      nerdfonts = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      awesomeFonts = pkgs.fetchgit {
        url = "https://github.com/rng70/Awesome-Fonts.git";
        rev = "3733f56e431608878d6cbbf2d70d8bf36ab2c226";
        sha256 = "0m41gdgp06l5ymwvy0jkz6qfilcz3czx416ywkq76z844y5xahd0";
      };
    in
    # TODO Move to broot in home packages
    # broot = pkgs.fetchgit {
    #   url = "https://github.com/Canop/broot.git";
    #   rev = "d1dba3cb1f8f51d653cbe93e789a45348a21656f";
    #   sha256 = "0mgw43s2plzvw5y4wbw8jyxvwjppc0gjbcbq72nyjyhjb5zw3jlk";
    # };
    # vscodeIcons = "${broot}/resources/icons/vscode";
    {
      packages = with pkgs; [
        awesomeFonts
        comfortaa
        comic-neue
        dejavu_fonts
        inter
        jost
        lato
        lexend
        material-design-icons
        material-icons
        nerdfonts
        noto-fonts-emoji
        roboto
        source-sans
        twemoji-color-font
        # vscodeIcons
        work-sans
      ];
      fontconfig.defaultFonts = {
        monospace = [
          "Operator Mono Lig Medium"
          "Operator Mono Lig"
          "Cascadia Code PL"
          "JetBrainsMono Nerd Font"
          # "vscodeIcons"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Lexend"
          "Noto Color Emoji"
        ];
        serif = [
          "Noto Serif"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
      fontDir.enable = true;
      enableDefaultPackages = false;
    };
}
