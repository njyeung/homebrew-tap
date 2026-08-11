class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.3/reels-darwin-arm64"
    sha256 "0d475f8faade766057438ac18c55477c0c6777af355a94b39b8cb8780d8b97e7"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.3/reels-linux-amd64"
      sha256 "a9312e6f077134ed81d13491e86e2c7510cb8a099893063bdbebc15268dac074"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.3/reels-linux-arm64"
      sha256 "28c19ba29020cac1eac441c1a8a1c0f60c7800714ac63dbc08bec63f2a21009a"
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
