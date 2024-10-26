{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
# with filesystem;
with types;
{
  options.DOTS.sessionVariables = mkOption {
    default = with Applications; {
      EDITOR = editor.primary.command;
      EDITOR_SECONDARY = editor.secondary.command;
      VISUAL = visual.primary.command;
      VISUAL_SECONDARY = visual.secondary.command;
      BROWSER = browser.primary.command;
      BROWSER_SECONDARY = browser.secondary.command;
      TERMINAL = terminal.primary.command;
      TERMINAL_SECONDARY = terminal.secondary.command;
      LAUNCHER = launcher.primary.command;
      LAUNCHER_SECONDARY = launcher.secondary.command;
    };
    description = ''
      A set of environment variables used in the global environment.
      These variables will be set on shell initialisation (e.g. in /etc/profile).
      The value of each variable can be either a string or a list of
      strings.  The latter is concatenated, interspersed with colon
      characters.
    '';
    type = attrsOf (oneOf [
      (listOf (oneOf [
        float
        int
        str
      ]))
      float
      int
      str
      path
    ]);
    apply = mapAttrs (n: v: if isList v then concatMapStringsSep ":" toString v else toString v);
  };
}
