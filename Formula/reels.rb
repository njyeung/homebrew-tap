class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.1/reels-darwin-arm64"
    sha256 "88cc0af75d9117d1890ff4066dd051153652407e37f518a8cd211d6a818547a2"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.1/reels-linux-amd64"
      sha256 "f632097addec905f6e796f95cbc5bba6814a4f556a4722b8ef72077b71d054de"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.1/reels-linux-arm64"
      sha256 "f6bea0c72ea8d28650a4b0b60681ac7a5e13cc49a60080193556aad363ac4716"
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
