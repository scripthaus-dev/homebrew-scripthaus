class Scripthaus < Formula
  desc "Command-line tool that helps organize your scripts and bash one-liners"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0d057dd7f359c2124c23e4b07bd6c6cb49876fea83c1576e5f8b6b7f6580c561"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/scripthaus-dev/homebrew-scripthaus/releases/download/scripthaus-0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "d8c8987dcbb060aa2b9ce50dab1abe05ea7716e8384acf0ba4cf83f614351df9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "64529a81b529685192cc1e869acd35bd035f37c940a9eca2f47795bdfaf6e412"
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
    assert_match "[^scripthaus] v0.3.0", shell_output("#{bin}/scripthaus version")
  end
end
