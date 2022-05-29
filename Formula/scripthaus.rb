class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "619d54fd207aeba535ceccc289f49b65283648234b57b0e872794d1f229523b8"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "b3aa51eb45e5f0dbe949b160f0dc3d20d0a0ef8a11cd01f70b0c7312ead6354f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "60a20a1254625de0b02f1222d22a6f5f7f836b20cdf33bb4f9e6e170024ce20f"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", "scripthaus", "cmd/main.go"
    bin.install "scripthaus"
  end

  def caveats
    <<~EOS
      [^scripthaus] is OpenSource and licensed under the MPLv2

      Resources:
      * Homepage - https://www.scripthaus.dev
      * Source Code - https://github.com/scripthaus-dev/scripthaus
      * Discord - https://discord.gg/XfvZ334gwU

      If you have questions, want to report a bug, or request a new feature
      please create a GitHub issue or post in Discord.
    EOS
  end

  test do
    assert_match "[^scripthaus] v0.4.0", shell_output("#{bin}/scripthaus version")
  end
end
