class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.3.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.3.2/reels-darwin-arm64"
    sha256 "d6e12db49e9e1419fabf3cde5e65732a513ce3940025ff8ff89c96febefcc1f0"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.3.2/reels-linux-amd64"
      sha256 "85f64628394b06bf8353475fdfad6ff38a0acb6e40d508f57a64725a98a8213e"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.3.2/reels-linux-arm64"
      sha256 "8cf79adec4b6a954a45482e145b641393c1342cb0ab441a66cbbf83071ef3938"
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
