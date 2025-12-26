{
  description = "Vintage Story flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true; # Vintage Story is unfree
          };
        };

        vintagestory = pkgs.callPackage ./package.nix { };

      in
      {
        packages = {
          inherit vintagestory;
          default = vintagestory;
        };

        apps = {
          default = {
            type = "app";
            program = "${vintagestory}/bin/vintagestory";
          };
          server = {
            type = "app";
            program = "${vintagestory}/bin/vintagestory-server";
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ vintagestory ];
        };

        formatter = pkgs.nixfmt-rfc-style;
      });
}
