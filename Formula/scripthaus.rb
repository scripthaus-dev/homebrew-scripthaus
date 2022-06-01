class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d7f8120a7f629fad6959769d540f91218ebdc13595da9edb5d87f0d4bfcba73a"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "a351993d120a3ea3b4330b8b057f86db6c1a55c35122f8880780171bc9b181c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bd55c473ee8b98aa60e2a60db389a37ea408dd38b69350eff28c9605d8aa65bb"
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
    assert_match "[^scripthaus] v0.5.0", shell_output("#{bin}/scripthaus version")
  end
end
