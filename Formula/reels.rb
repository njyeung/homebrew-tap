class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.3.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.3.1/reels-darwin-arm64"
    sha256 "7a8dc48f838f7dc2a16d8cb9b74fb3f491a9bfa17b6297ac7287b1640605822c"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.3.1/reels-linux-amd64"
      sha256 "faf3577562cc6cbec64640c5540ba3b1b1e39673023ab75cfbca3c8feb8729fa"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.3.1/reels-linux-arm64"
      sha256 "b0a7c5b1bf9cbce908f8e90a98a86fb98cc6b91fb1aace38bb1017ef335e2794"
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
      Requires Chrome, Chromium, or Brave browser to be installed.
      Requires a terminal with Kitty graphics protocol support (Kitty, WezTerm, Konsole).
    EOS
  end
end
