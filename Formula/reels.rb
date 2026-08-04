class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.2/reels-darwin-arm64"
    sha256 "0f2dc75784287118de1a84daad6ef5e75b774c4ce1bdcfe923a6babc5a23f448"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.2/reels-linux-amd64"
      sha256 "78d651da60dd538e704d5452ea359bda75c9c1fd1b976c5a7c76e3c6a77f5c7f"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.2/reels-linux-arm64"
      sha256 "28af786ff06f532ad52f2bd19728f023f3749f126580fcf3c8fa41784b90bf7e"
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
