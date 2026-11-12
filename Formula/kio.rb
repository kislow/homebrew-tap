class Kio < Formula
  desc "Scope agent sessions to a repo, its identity and a knowledge base"
  homepage "https://github.com/kislow/kio"
  url "https://github.com/kislow/kio/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "b1b896fa2509fc2f70181fd8bf3e051b2147191f15088c35f6432b7a89498c69"
  license "Apache-2.0"
  head "https://github.com/kislow/kio.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ki", ldflags: "-s -w -X main.version=#{version}"), "./cmd/ki"
  end

  def caveats
    <<~EOS
      Install the skills and agent instructions with:
        ki setup skills

      Then follow INSTALL.md for the configuration and the knowledge base:
        https://github.com/kislow/kio/blob/v#{version}/INSTALL.md
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ki version")
    assert_match "agent sessions scoped", shell_output("#{bin}/ki --help")
  end
end
