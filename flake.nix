{
  description = "Development and build environment for ramos.codes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supported_systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      for_each_system = nixpkgs.lib.genAttrs supported_systems;
    in
    {
      packages = for_each_system (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.stdenvNoCC.mkDerivation {
            pname = "ramos-codes";
            version = "1.0.0";
            src = self;
            nativeBuildInputs = [ pkgs.jekyll ];

            buildPhase = ''
              runHook preBuild
              jekyll build --destination "$out"
              runHook postBuild
            '';

            dontInstall = true;
          };
        });

      devShells = for_each_system (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              pkgs.jekyll
              pkgs.just
            ];
          };
        });
    };
}
