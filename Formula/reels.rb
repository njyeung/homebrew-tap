class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.3.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.3.0/reels-darwin-arm64"
    sha256 "349fd03ab40635bd4f9c9728eec80625fe9a2c548852c070e9a18cee46bc50af"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.3.0/reels-linux-amd64"
      sha256 "c82f7cbda7be64698c368bf92b42a18bc1192ffce3289c1f868f4e16716ae1f2"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.3.0/reels-linux-arm64"
      sha256 "62c9a764d045956304698b6708c9402afd89e1779f68bcbda128d844a40f03ca"
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
