{
  pkgs,
  config,
  coreArgs,
  userArgs,
  ...
}:
let
  inherit (coreArgs) modules packages lib;
  inherit (coreArgs.lib) toLower;
  inherit (userArgs.options.theme.colors) mode;
  # ./. + "/style-${mode}.css"
  invertedMode = if mode == toLower "dark" then "light" else "dark";
  cssPath = ./. + "/style" + "-" + invertedMode + ".css";
in
{
  imports = [ modules.anyrun ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with packages.anyrun.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
      # showResultsImmediately = true;
      # hideIcons = true;
    };

    extraCss = builtins.readFile cssPath;

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        terminal: Some("foot"),
      )
    '';
  };
}
