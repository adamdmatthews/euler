{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      myPkg = pkgs.haskellPackages.callCabal2nix "euler" (pkgs.lib.cleanSource ./.) { };
    in
    {
      packages.${system}.default = myPkg;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          ghc
          cabal-install
          haskell-language-server
        ];
        inputsFrom = [ myPkg.env ];
      };
    };
}
