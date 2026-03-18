{
  description = "Dev shell with hack tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    ghost-nur.url = "path:..";
  };

  outputs = { self, nixpkgs, ghost-nur }: let
    pkgs = import nixpkgs { 
      system = "x86_64-linux"; 
      overlays = [ ghost-nur.overlays.securityTools ghost-nur.overlays.aiTools ];
    };
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = 
        pkgs.hacktoolsBundle
        pkgs.aitoolsBundle
      ;
      # optional: set environment variables
      shellHook = ''
        echo "Hack tools dev shell ready!"
        echo "ai tools dev shell ready!"
      '';
    };
  };
}