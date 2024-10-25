{
  programs.vscode.userTasks = {
    version = "2.0.0";
    tasks = [
      {
        type = "rust";
        label = "Hello rust";
        command = "hello";
      }
    ];
  };
}
