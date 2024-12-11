{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib/ad/add-mk-modules";
    rust-module.url = "github:garnix-io/rust-module";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.rust-module.garnixModules.default
    ];
    config = {
      rust.backend = {
        src = ./sample-rust-project;
        serverCommand = "sample-rust-project";
      };
    };
  };
}
