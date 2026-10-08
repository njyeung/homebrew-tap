class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.8"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.8/reels-darwin-arm64"
    sha256 "c43fa85e6fa0737877ba76bc327e9df1b84bac518b9c0527589ffd654bb7fef3"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.8/reels-linux-amd64"
      sha256 "94bb13ccb4acec630c947fe3ce04060137db2a6ba66827b3441c7b51e576d872"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.8/reels-linux-arm64"
      sha256 "52e925b64ec67be9bf7b0eb8ed800945f15998673af95638b5085bca2f3baaa7"
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
