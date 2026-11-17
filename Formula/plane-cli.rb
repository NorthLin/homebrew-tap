class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.1/plane_1.5.1_darwin_arm64.tar.gz"
      sha256 "94d23804ec373cc21fa305fdc2fd3cfba1d6dc57fee390a784fcba86913df5cd"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.1/plane_1.5.1_darwin_amd64.tar.gz"
      sha256 "b20015ad274709bb9957a47490eb32f63f35fb32d27dcb47d839714bcaaab747"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.1/plane_1.5.1_linux_arm64.tar.gz"
      sha256 "62431e6e3d11b27a631f41356fd038c8bdfb2698d1ea46d2f4c47c905788f2d0"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.1/plane_1.5.1_linux_amd64.tar.gz"
      sha256 "99fe8a25a7566a442db1afd83278346f2e644098f88038d45667bc72ff5def83"
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
