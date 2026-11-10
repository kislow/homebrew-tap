class Muxrail < Formula
  desc "tmux window sidebar and cross-agent session search"
  homepage "https://github.com/kislow/muxrail"
  url "https://github.com/kislow/muxrail/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "28c311a9e1032dba32f1c26b4757e2d5a3eb0ca4e37fab6abb91829559979db7"
  license "Apache-2.0"
  head "https://github.com/kislow/muxrail.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/muxrail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/muxrail version")
    assert_match "usage:", shell_output("#{bin}/muxrail 2>&1", 2)
  end
end
