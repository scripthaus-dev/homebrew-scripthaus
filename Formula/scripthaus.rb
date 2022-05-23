class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a9d18f6567ea16931e563cc52e456d2305a8b4f22ad89654e25d739ed01c61d8"
  license "MPL-2.0"

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
    assert_match "^ScriptHaus v0.1.0", shell_output("#{bin}/scripthaus version")
  end
end
