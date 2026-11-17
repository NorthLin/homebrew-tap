class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.0-cli.4"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.4/plane_1.5.0-cli.4_darwin_arm64.tar.gz"
      sha256 "d4fe3b01e0e18f8894c5f0ff5812fc29f1430f2f7485cd9f7f34d1e6a58a6ea8"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.4/plane_1.5.0-cli.4_darwin_amd64.tar.gz"
      sha256 "0cb3073a1e4561e9fdf99c0c09a166cfbf86adcbe3777e83be6cc097c7edd6de"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.4/plane_1.5.0-cli.4_linux_arm64.tar.gz"
      sha256 "9bcd2099fb37c692f38b23270c300d3024b98acbcf1a3c10d37a4aeaa24fbe92"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.4/plane_1.5.0-cli.4_linux_amd64.tar.gz"
      sha256 "b46db4aa7ead33bfe4dccd6c9b6eae41a956470336b281f049f7b9856349f77c"
    end
  end

  def install
    bin.install "plane"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plane --version")
    assert_match "callbacks", shell_output("#{bin}/plane --help")
    assert_match "--event", shell_output("#{bin}/plane callbacks add --help")
    assert_match "--image", shell_output("#{bin}/plane comments add --help")
    assert_match "{{image:1}}", shell_output("#{bin}/plane comments add --help")
    assert_match "asset_url", shell_output("#{bin}/plane comments list --help")
  end
end
