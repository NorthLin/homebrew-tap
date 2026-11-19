class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.2/plane_1.5.2_darwin_arm64.tar.gz"
      sha256 "ac50fcda8ddd1b2e1a64298e127429e86204dca50f0305684f3a5efcc2b6f7ce"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.2/plane_1.5.2_darwin_amd64.tar.gz"
      sha256 "60cd7b49fba41d0ddb1d5d50c6524f4fa1dbe4b59e87681658ac9bfc4b1e3bbb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.2/plane_1.5.2_linux_arm64.tar.gz"
      sha256 "674e482348c17629b319896f0c40ed09ca846c9270e2d48288b7976321b26846"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.2/plane_1.5.2_linux_amd64.tar.gz"
      sha256 "5b9abe7cbd486ca00fc430264ed6bc13435224c9a473a55b7de4ab87e8157187"
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
