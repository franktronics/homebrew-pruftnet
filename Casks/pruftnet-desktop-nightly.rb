cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261008.27"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.27/pruftnet-desktop-nightly-0.2.1-nightly.20261008.27-mac-arm64.dmg"
    sha256 "2fe137406f4aff57ae3f18382997dabd52640549833ec4a86cb7f794f36898c1"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.27/pruftnet-desktop-nightly-0.2.1-nightly.20261008.27-mac-x64.dmg"
    sha256 "2db9052a45c313b6497d4b964214b825bb09f4488ef8972ff484b2ecd71f42ab"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
