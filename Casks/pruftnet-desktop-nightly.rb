cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261009.30"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261009.30/pruftnet-desktop-nightly-0.2.1-nightly.20261009.30-mac-arm64.dmg"
    sha256 "a64c62594d2ca68e8c4c41b312e936c0cf40ec8de6a50696128f41048cd4b720"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261009.30/pruftnet-desktop-nightly-0.2.1-nightly.20261009.30-mac-x64.dmg"
    sha256 "e0d1378e7f6a31e928d16fbf8b99c60fc61c1d99ec607ebc73bd7f459b53570e"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
