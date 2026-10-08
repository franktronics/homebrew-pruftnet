class PruftnetServerNightly < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1-nightly.20261008.25"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.25/pruftnet-server-nightly-0.2.1-nightly.20261008.25-darwin-arm64.tar.gz"
      sha256 "0e0ed52181be47a29dea5d943bcd0ca6421abe63d0de9c6ae783eb011f210e4e"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.25/pruftnet-server-nightly-0.2.1-nightly.20261008.25-darwin-x64.tar.gz"
      sha256 "48c517b7a47abb6dd7e632f7bfc58ae5672b06e87a057dfa727378c559323fee"
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
    assert_match "0.2.1-nightly.20261008.25", shell_output("#{bin}/pruftnet-nightly --version")
  end
end
