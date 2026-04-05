class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.8"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.8/reels-darwin-arm64"
    sha256 "06738158806ed48807a3163ec676a6894338ddb69e2380ea6bfaf9a53081ae2a"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.8/reels-linux-amd64"
      sha256 "9c5d755aaee359d14ffeafcef18e50a01ccbd5182cbb27104264349c00671153"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.8/reels-linux-arm64"
      sha256 "d37df85660184bda8f91738c293ea861d9e3177051315713a014d26f43b96caf"
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
