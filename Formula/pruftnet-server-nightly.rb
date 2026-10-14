class PruftnetServerNightly < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1-nightly.20261014.31"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261014.31/pruftnet-server-nightly-0.2.1-nightly.20261014.31-darwin-arm64.tar.gz"
      sha256 "4880e2666fc2516b2828a3fdb815e5ec17fdd38fa2da9bd48106aaa8aec7c267"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261014.31/pruftnet-server-nightly-0.2.1-nightly.20261014.31-darwin-x64.tar.gz"
      sha256 "d30557f2145e5ad9c74f358e9f1b95db255995a4f239fc594429ae73cb012031"
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
    assert_match "0.2.1-nightly.20261014.31", shell_output("#{bin}/pruftnet-nightly --version")
  end
end
