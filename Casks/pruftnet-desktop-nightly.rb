cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261008.26"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.26/pruftnet-desktop-nightly-0.2.1-nightly.20261008.26-mac-arm64.dmg"
    sha256 "8ca2eb275885d4aaef6fb98d31fa5e87fa083baf8a315709ca3ebcfd83c59bc7"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.26/pruftnet-desktop-nightly-0.2.1-nightly.20261008.26-mac-x64.dmg"
    sha256 "bfc43367b60e201c2ae28bd95888e868eea3ceaf2dfa921d4f8e954e5316db4c"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
