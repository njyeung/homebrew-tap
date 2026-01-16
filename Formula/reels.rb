class Reels < Formula
  desc "TUI Instagram Reels viewer"
  homepage "https://github.com/njyeung/reels"
  version "1.1.0"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.1.0/reels-darwin-arm64"
    sha256 "37d93ab751cbae67dde63af55b35a11404cf56b57b844925fa535e63cf62e760"
  end

  on_linux do
    url "https://github.com/njyeung/reels/releases/download/v1.1.0/reels-linux-amd64"
    sha256 "fac5323ffc599589def7366dceb1a74d82fbbaf527a4ca72aa5a2ad6a3768ce2"
  end

  def install
    if OS.mac?
      bin.install "reels-darwin-arm64" => "reels"
    else
      bin.install "reels-linux-amd64" => "reels"
    end
  end

  def caveats
    <<~EOS
      Requires Chrome, Chromium, or Brave browser to be installed.
      Requires a terminal with Kitty graphics protocol support (Kitty, WezTerm, Konsole).
    EOS
  end
end
