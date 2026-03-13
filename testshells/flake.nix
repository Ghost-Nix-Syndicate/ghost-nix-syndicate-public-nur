{
  description = "Dev shell with hack tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    ghost-nur.url = "github:Ghost-Nix-Syndicate/ghost-nix-syndicate-public-nur";
  };

  outputs = { self, nixpkgs, ghost-nur }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        ghost-nur.packages.x86_64-linux.hacktoolsBundle
        # or pick individual packages:
        # ghost-nur.packages.x86_64-linux.nmap
        # ghost-nur.packages.x86_64-linux.hashcat
      ];

      # optional: set environment variables
      shellHook = ''
        echo "Hacktools dev shell ready!"
      '';
    };
  };
}