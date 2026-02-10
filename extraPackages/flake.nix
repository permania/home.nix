{
  description = "Maple font custom build as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      python = pkgs.python3;

      fontPatcherZip = pkgs.fetchurl {
        url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FontPatcher.zip";
        sha256 = "sha256-+6v0zuDXEp38w2kFChWf9iaZjSt1FAE2xhNuGPsgWYk=";
      };
      foundryTools = pkgs.python3Packages.buildPythonApplication {
        pname = "foundrytools-cli";
        version = "2.1.1";

        format = "pyproject";

        nativeBuildInputs = [
          (pkgs.python3Packages.uv-build.overrideAttrs (old: rec {
            version = "0.9.17";
            src = pkgs.python3Packages.fetchPypi {
              pname = "uv-build";
              inherit version;
              sha256 = pkgs.lib.fakeSha256;
            };
          }))
        ];

        src = pkgs.fetchFromGitHub {
          owner = "ftCLI";
          repo = "FoundryTools-CLI";
          rev = "main";
          sha256 = "sha256-l9kasxhragimlTnyrQue5FUwAF9Cm/sOMeBcQK4oKfU=";
        };

        propagatedBuildInputs = with pkgs.python3Packages; [
        ];
      };
    in
    {
      packages.x86_64-linux."maple-font-custom" = pkgs.python3Packages.buildPythonPackage {
        pname = "maple-font-custom";
        version = "1.0";

        pyproject = true;

        src = pkgs.fetchFromGitHub {
          owner = "subframe7536";
          repo = "maple-font";
          rev = "variable";
          sha256 = "sha256-eTpQIwhn5wjOB/vGzSIwi0UMnZ7hP9O+DBrx/2SmByc=";
        };

        buildInputs = with pkgs.python3Packages; [
          afdko
          ttfautohint-py
          foundryTools
        ];

        buildPhase = ''
          cp ${fontPatcherZip} FontPatcher.zip
          ${python.interpreter} $src/build.py
        '';

        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp dist/*.otf $out/share/fonts/opentype/
          fc-cache -fv
        '';
      };
    };
}
