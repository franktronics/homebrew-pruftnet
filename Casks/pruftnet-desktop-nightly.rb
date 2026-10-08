cask "pruftnet-desktop-nightly" do
  version "0.2.1-nightly.20261008.25"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.25/pruftnet-desktop-nightly-0.2.1-nightly.20261008.25-mac-arm64.dmg"
    sha256 "bc354caa464335004dd936257bbee6131386b1d71a80172afbb7ae4993b50b1c"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.25/pruftnet-desktop-nightly-0.2.1-nightly.20261008.25-mac-x64.dmg"
    sha256 "b40b8fc599e5161b6c2fa0a5834d3fc390f82edec7654b6f72a3bccf6fff5ca4"
  end
  name "Pruftnet Nightly"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet Nightly.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
