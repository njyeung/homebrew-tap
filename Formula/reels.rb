class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.9"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.9/reels-darwin-arm64"
    sha256 "8cc60c5bfe3e7110b1d558aa5d645dd8222dc4053d98707d5a8718f1089cfea8"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.9/reels-linux-amd64"
      sha256 "2dfae7dd34372fde09f4a8d84adccb7067d5c08ac04a9eb83f339e6e6e28b842"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.9/reels-linux-arm64"
      sha256 "46dd260ed9d5586350cdd5639ae0e73181889ea436c9626dfbd1c3ff1b302230"
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
