{ nixosConfig, editor, ... }:
{
  home = {
    inherit (nixosConfig.system) stateVersion;
    sessionVariables = {
      EDITOR = editor;
    };
  };
}
