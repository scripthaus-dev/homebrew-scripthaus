class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "12e715dc23c908ffb66059fd1bdd9ace60cdcddbefb832a9d13fbdf1240e90bc"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "a8c102db882d20c76ee0d33d31d1f24b085d6ad01ab1ba48a0ceecabc9bd7852"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8475840fd137041771e3291213567a60ed2f7b8d83ff482bc1d89e2d0b5de532"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", "scripthaus", "cmd/main.go"
    bin.install "scripthaus"
  end

  test do
    assert_match "^ScriptHaus v0.1.0", shell_output("#{bin}/scripthaus version")
  end
end
