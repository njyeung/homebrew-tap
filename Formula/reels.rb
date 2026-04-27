class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.11"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.11/reels-darwin-arm64"
    sha256 "cbcf9b92b0efef1571a71fcb4d84ef461d35bb710c3381558f5208f5baafc9f9"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.11/reels-linux-amd64"
      sha256 "b321dbc1d0803a7fac68e25775cd1105bfb640ce7ae30c0eee56a246ff775793"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.11/reels-linux-arm64"
      sha256 "d451c355c45b11b4740a89a107d0d9651e82ca9d1b50de3dcabc9fecf342bcfe"
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
