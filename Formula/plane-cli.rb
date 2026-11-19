class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.3/plane_1.5.3_darwin_arm64.tar.gz"
      sha256 "bf7a191033c21b7a573d1eab4b6544f60b008dd1111220f4fecf7ae13af2dfcb"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.3/plane_1.5.3_darwin_amd64.tar.gz"
      sha256 "d8ddeb43cc88a25c4ffecccbc3925245e60a928cc031484aa27b705f3992bddc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.3/plane_1.5.3_linux_arm64.tar.gz"
      sha256 "7da56d1bab3c91b055bdf9920fe54aca788057b6dc7a868df704656263b7ba99"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.3/plane_1.5.3_linux_amd64.tar.gz"
      sha256 "7f899d90d3340e4f8f0144b68b1cb09669b3888b32e3e9fb4cb209bd2e4c8417"
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
