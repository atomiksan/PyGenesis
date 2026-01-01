{
  description = "Python project with UV and Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.uv
            pkgs.python311
          ];

          shellHook = ''
            echo -e "\e[32m"
            echo "  _____       _____                     _           "
            echo " |  __ \     / ____|                   (_)          "
            echo " | |__) |   | |  __  ___ _ __   ___ ___ _ ___       "
            echo " |  ___/ | | | | |_ |/ _ \ '_ \ / _ \ __| / __|     "
            echo " | |   | |_| | |__| |  __/ | | |  __\__ \ \__ \     "
            echo " |_|    \__, |\_____|\___|_| |_|\___|___/_|___/     "
            echo "         __/ |                                      "
            echo "        |___/                                       "
            echo "                                                    "
            echo "              🚀 Python + Nix + UV Skeleton 🚀      "
            echo -e "\e[0m"

            echo "Python UV environment loaded."
            echo "Python: $(python --version)"
            echo "UV: $(uv --version)"

            # Ensure venv exists and is up to date
            if [ ! -d ".venv" ]; then
                echo "Creating virtual environment..."
                uv venv
            fi
            
            # Activate venv
            source .venv/bin/activate
            
            # auto-install dependencies if pyproject.toml changes
            uv pip install -e .
          '';
        };
      }
    );
}
