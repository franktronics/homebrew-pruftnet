cask "pruftnet-desktop" do
  version "0.2.1"
  on_arm do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1/pruftnet-desktop-0.2.1-mac-arm64.dmg"
    sha256 "c03fc47bc57d1398266686238336106d63809b7e7e2f38195028ade1057c6d54"
  end
  on_intel do
    url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1/pruftnet-desktop-0.2.1-mac-x64.dmg"
    sha256 "b4bc48d6fc9f3b3da22197db33a8a7cfe45fc9c63e60ba80696ed3e75be27210"
  end
  name "Pruftnet"
  desc "Network analysis software (beta)"
  homepage "https://pruftnet.app"
  depends_on macos: ">= :sequoia"
  app "Pruftnet.app"
  caveats "Ad-hoc signed beta, without Apple notarization. See the installation guide for Gatekeeper and capture permissions."
end
