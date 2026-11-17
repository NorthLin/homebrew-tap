class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.0-cli.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.3/plane_1.5.0-cli.3_darwin_arm64.tar.gz"
      sha256 "e5a1ea55500cf84ba7fd61c6569aafe5114919f9d407e551aced83ef633ed2c0"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.3/plane_1.5.0-cli.3_darwin_amd64.tar.gz"
      sha256 "d36929ef87a86bac52ae1795f4f238fc30d5099c5e3a5ae8bbb8a292b5c29914"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.3/plane_1.5.0-cli.3_linux_arm64.tar.gz"
      sha256 "9a9bd02f274829ca89dbe526e4531bcbeba784e4c392bee6085b47a52f49b346"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.3/plane_1.5.0-cli.3_linux_amd64.tar.gz"
      sha256 "373487b1c2c333c96aeed12a44b5947a21bbbcf3fd0a79363177561fef793fe6"
    end
  end

  def install
    bin.install "plane"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plane --version")
    assert_match "callbacks", shell_output("#{bin}/plane --help")
    assert_match "--event", shell_output("#{bin}/plane callbacks add --help")
    assert_match "not supported", shell_output("#{bin}/plane comments add --help")
    assert_match "asset_url", shell_output("#{bin}/plane comments list --help")
  end
end
