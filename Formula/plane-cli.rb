class PlaneCli < Formula
  desc "Plane project management CLI with local agent callbacks"
  homepage "https://github.com/NorthLin/plane"
  version "1.5.0-cli.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.2/plane_1.5.0-cli.2_darwin_arm64.tar.gz"
    sha256 "0d1f35b5697c7c633f5a260ce76f315dccf39f9ae45438d373d9452b2733706f"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.2/plane_1.5.0-cli.2_darwin_amd64.tar.gz"
    sha256 "3a132be14c271a252233aa70f8e2bd4d3aa16ef7138838677e9ebfce872d2934"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.2/plane_1.5.0-cli.2_linux_arm64.tar.gz"
    sha256 "88ebf793b393374c65cd02431a7b5dd468cdc07f4dd5d7f672b3456d7b29b9bf"
    end
    on_intel do
      url "https://github.com/NorthLin/plane/releases/download/v1.5.0-cli.2/plane_1.5.0-cli.2_linux_amd64.tar.gz"
    sha256 "4419fbf90d4247bb28a96abc3b9ce22219b17b2892193b7ff4f2112e1c18d6ff"
    end
  end

  def install
    bin.install "plane"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plane --version")
    assert_match "callbacks", shell_output("#{bin}/plane --help")
    assert_match "--event", shell_output("#{bin}/plane callbacks add --help")
  end
end
