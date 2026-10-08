class PruftnetServerNightly < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1-nightly.20261008.26"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.26/pruftnet-server-nightly-0.2.1-nightly.20261008.26-darwin-arm64.tar.gz"
      sha256 "bad6f7e6ff766ac2bad244ea08d06d5863a1498f67debb5d7e1f2fa122bf68e8"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.26/pruftnet-server-nightly-0.2.1-nightly.20261008.26-darwin-x64.tar.gz"
      sha256 "88f2811ccfd97fb31fb1e524ae6be5d9ca5ba3a7b84bbeacb0404e84441e0904"
    end
  end
  depends_on macos: :sequoia
  def install
    libexec.install Dir["*"]
    (bin/"pruftnet-nightly").write <<~SH
      #!/bin/sh
      exec "#{libexec}/pruftnet-nightly" "$@"
    SH
  end
  service do
    run [opt_bin/"pruftnet-nightly", "serve", "--strict-port", "--log-format", "logfmt"]
    keep_alive crashed: true
    log_path var/"log/pruftnet-server-nightly.log"
    error_log_path var/"log/pruftnet-server-nightly.log"
  end
  def caveats
    "Run \"pruftnet-nightly doctor\" to check capture permissions. Start in the background with: brew services start pruftnet-server-nightly"
  end
  test do
    assert_match "0.2.1-nightly.20261008.26", shell_output("#{bin}/pruftnet-nightly --version")
  end
end
