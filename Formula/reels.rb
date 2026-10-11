class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.9"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.9/reels-darwin-arm64"
    sha256 "2365c8b0dd3307b60ca9cb5c6fc9c07ed6916508d1683528f37093f2f48c70ff"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.9/reels-linux-amd64"
      sha256 "5e6c7a7b1fe7842231edee7d2b7d56d3a205ba368d2c19111d338e01293be3a1"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.9/reels-linux-arm64"
      sha256 "0d760611443372c0dd90b73267b3027f5d1a24a9747263a42bf4ffab577938fa"
    end
  end

  def install
    if OS.mac?
      bin.install "reels-darwin-arm64" => "reels"
    else
      if Hardware::CPU.arm?
        bin.install "reels-linux-arm64" => "reels"
      else
        bin.install "reels-linux-amd64" => "reels"
      end
    end
  end

  def caveats
    <<~EOS
      Requires a terminal with Kitty graphics protocol support (Kitty, WezTerm, Konsole).
    EOS
  end
end
