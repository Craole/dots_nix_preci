{ nixosConfig, editor, ... }:
{
  # nixosConfig.programs.home-manager.enable = true;
  home = {
    inherit (nixosConfig.system) stateVersion;
    sessionVariables = {
      EDITOR = editor;
    };
  };
}
