class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "12e715dc23c908ffb66059fd1bdd9ace60cdcddbefb832a9d13fbdf1240e90bc"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", "bin/scripthaus", "cmd/main.go"
    bin.install "scripthaus"
  end

  test do
    assert_match "^ScriptHaus v0.1.0", shell_output("#{bin}/scripthaus version")
  end
end
