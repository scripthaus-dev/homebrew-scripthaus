class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "93c423f38100bf6f762b1efed4ce7cb31a965d01f9f25d413276a2b86581e5fc"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.2.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "77edcfd39043f39dde40f885e5c5470227665fafee43def48970ceb2aabfcd9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6288a55ac68a77e76cbbad7067306014f071c20a22406a4ccbf6b2fd6b12c7a0"
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
    assert_match "[^scripthaus] v0.2.1", shell_output("#{bin}/scripthaus version")
  end
end
