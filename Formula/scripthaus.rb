class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5a07b34e5a3cee8f8c4c34affcd35809edd208a0edc998f142df3e4b8139213a"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "c1dbf1d3307b0af017724cfd44062d6e0bc127080d239554276f9f6abc2e4ef9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "115d3768eae8464781856bb77f371e5e9e5255e179d1c1ee30d397fa8e1294e6"
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
    assert_match "[^scripthaus] v0.3.1", shell_output("#{bin}/scripthaus version")
  end
end
