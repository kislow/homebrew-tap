class Muxrail < Formula
  desc "tmux window sidebar and cross-agent session search"
  homepage "https://github.com/kislow/muxrail"
  url "https://github.com/kislow/muxrail/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "2cbe5c9286961a58e557285bd0a049c6b27aa70ed2db31198fe9663437c19dcb"
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
