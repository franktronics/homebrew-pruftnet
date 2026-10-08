class PruftnetServerNightly < Formula
  desc "Pruftnet local web server (beta)"
  homepage "https://pruftnet.app"
  version "0.2.1-nightly.20261008.27"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.27/pruftnet-server-nightly-0.2.1-nightly.20261008.27-darwin-arm64.tar.gz"
      sha256 "7979598c33028f015f017f2944f2b442fbcd35aca9d16f4df5a380b13834dfdf"
    end
    on_intel do
      url "https://github.com/franktronics/pruftnet.app/releases/download/v0.2.1-nightly.20261008.27/pruftnet-server-nightly-0.2.1-nightly.20261008.27-darwin-x64.tar.gz"
      sha256 "8ba8d4e0d8fb812652761cb5fd5dd391aafc147723a4dcfd2fe516826751598b"
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
    assert_match "0.2.1-nightly.20261008.27", shell_output("#{bin}/pruftnet-nightly --version")
  end
end
