{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    rust-module.url = "github:garnix-io/rust-module";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.rust-module.garnixModules.default
    ];
    config = { pkgs, ... }: {
      rust.backend = {
        src = ./sample-rust-project;
        webServer.command = "sample-rust-project";
        webServer.port = 3000;
        devTools = [ pkgs.jq ];
      };

      garnix.deployBranch = "main";

      foo.bar = 42;
    };
  };
}
