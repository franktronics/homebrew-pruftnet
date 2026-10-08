class PruftnetServerNightly < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1-nightly.20261008.23"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.23/pruftnet-server-nightly-0.2.1-nightly.20261008.23-darwin-arm64.tar.gz"
      sha256 "b0775771b07f0d003637070201a804779eedee6c10ea7274d42c6eea7e53df8b"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.23/pruftnet-server-nightly-0.2.1-nightly.20261008.23-darwin-x64.tar.gz"
      sha256 "bddbc9258aed63bc5e8bbec3a6dabfd831d4f4c3d1b88b1e294a813dad5d210c"
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
    assert_match "0.2.1-nightly.20261008.23", shell_output("#{bin}/pruftnet-nightly --version")
  end
end
