class PruftnetServer < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1/pruftnet-server-0.2.1-darwin-arm64.tar.gz"
      sha256 "00440d632ddf2f36daa1529705e15db62516c610b842ce5cd1ef9164f2f756f8"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1/pruftnet-server-0.2.1-darwin-x64.tar.gz"
      sha256 "25c6ec2f5553282720a91605e6e7571647a64f8556943eaa15af5a54d749d2d4"
    end
  end
  depends_on macos: :sequoia
  def install
    libexec.install Dir["*"]
    (bin/"pruftnet").write <<~SH
      #!/bin/sh
      exec "#{libexec}/pruftnet" "$@"
    SH
  end
  service do
    run [opt_bin/"pruftnet", "serve", "--strict-port", "--log-format", "logfmt"]
    keep_alive crashed: true
    log_path var/"log/pruftnet-server.log"
    error_log_path var/"log/pruftnet-server.log"
  end
  def caveats
    "Run \"pruftnet doctor\" to check capture permissions. Start in the background with: brew services start pruftnet-server"
  end
  test do
    assert_match "0.2.1", shell_output("#{bin}/pruftnet --version")
  end
end
