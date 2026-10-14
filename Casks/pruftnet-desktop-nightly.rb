cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261014.31"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261014.31/pruftnet-desktop-nightly-0.2.1-nightly.20261014.31-mac-arm64.dmg"
    sha256 "755dce44f5a073b4d1f3d9b956b2e80b42a7a94d388321216219a8f99583dfab"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261014.31/pruftnet-desktop-nightly-0.2.1-nightly.20261014.31-mac-x64.dmg"
    sha256 "f9b9e382e680168e2c2d20fe13a3f6c590c45ebda69229b79b0b883fd3295261"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
