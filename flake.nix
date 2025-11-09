{
  description = "Awesome Frappe - Jekyll development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Ruby version for Jekyll
        ruby = pkgs.ruby_3_4;

        # Create a gemset for Jekyll dependencies
        gems = pkgs.bundlerEnv {
          name = "awesome-frappe-gems";
          inherit ruby;
          gemdir = ./.;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ruby
            bundler
            nodejs
            git
          ];

          shellHook = ''
            echo "🚀 Awesome Frappe development environment"
            echo ""
            echo "Available commands:"
            echo "  bundle install    - Install Jekyll dependencies"
            echo "  bundle exec jekyll serve - Start development server"
            echo "  bundle exec jekyll build - Build static site"
            echo ""
            echo "Quick start:"
            echo "  1. bundle install"
            echo "  2. bundle exec jekyll serve"
            echo "  3. Open http://localhost:4000"
            echo ""
          '';
        };

        # Optional: package the built site
        packages.default = pkgs.stdenv.mkDerivation {
          name = "awesome-frappe-site";
          src = ./.;

          buildInputs = [ ruby pkgs.bundler ];

          buildPhase = ''
            export HOME=$TMPDIR
            bundle install --path vendor/bundle
            bundle exec jekyll build
          '';

          installPhase = ''
            cp -r _site $out
          '';
        };
      }
    );
}
