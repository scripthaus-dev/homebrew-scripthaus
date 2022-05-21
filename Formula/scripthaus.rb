class Scripthaus < Formula
  desc "ScriptHaus"
  homepage "https://www.scripthaus.dev"
  url "https://github.com/scripthaus-dev/scripthaus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4d355370adbd9f7bc56729fb7111211e0e1a72e72269184142a8997ee671e552"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "^ScriptHaus v0.1.0", shell_output("#{bin}/scripthaus version", 0)
  end
end
