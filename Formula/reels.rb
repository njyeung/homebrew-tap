class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.7"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.7/reels-darwin-arm64"
    sha256 "bf88ad00b802275268721997780b23d03a3d7fa31413611da63583a67104177d"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.7/reels-linux-amd64"
      sha256 "a3c1b187eb38efe586dc32b115a941d00fb32ac13383e772756577fa0edfb547"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.7/reels-linux-arm64"
      sha256 "a08b45a2b958e293f554bca4a7c44ed2fd1494730fc71eadfbc7650be63c0836"
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
