class Berth < Formula
  desc "SSH client for the terminal, built on nothing but ~/.ssh/config"
  homepage "https://github.com/axel-eck/berth"
  url "https://github.com/axel-eck/berth/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "acfb70766aeb7dcd7c5f121fb78d78d4b177a876595013ba2369ff95988e77ff"
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
