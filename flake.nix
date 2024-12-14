{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib/ad/add-garnix-config-option";
    rust-module.url = "github:garnix-io/rust-module/ad/rework-rust-module-server-config";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.rust-module.garnixModules.default
    ];
    config = {
      rust.backend = {
        src = ./sample-rust-project;
        webServer.command = "sample-rust-project";
        webServer.port = 3000;
        webServer.deployBranch = "make-deployments-work";
      };
    };
  };
}
