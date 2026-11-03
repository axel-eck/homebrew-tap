class Berth < Formula
  desc "SSH client for the terminal, built on nothing but ~/.ssh/config"
  homepage "https://github.com/axel-eck/berth"
  url "https://github.com/axel-eck/berth/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1823ed4229b99a26326490b39827e6351cb93973b8f4514afc14e8230c85b004"
  license "MIT"
  head "https://github.com/axel-eck/berth.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=v#{version}")
  end

  test do
    assert_match "berth v#{version}", shell_output("#{bin}/berth -version")
    (testpath/"config").write "Host alpha\n  HostName 203.0.113.5\n"
    assert_equal "alpha\n", shell_output("#{bin}/berth -config #{testpath}/config ls")
  end
end
