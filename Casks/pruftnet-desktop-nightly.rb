cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261008.23"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.23/pruftnet-desktop-nightly-0.2.1-nightly.20261008.23-mac-arm64.dmg"
    sha256 "753aee3b53793d40af38ac6a604f2ab8eb95e5cbfdef8be135c8523c4582b175"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.23/pruftnet-desktop-nightly-0.2.1-nightly.20261008.23-mac-x64.dmg"
    sha256 "6377c3bb240a8e1f36d4fc4f9a3065330ce19623e98d84ba61be9dee043425a6"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
