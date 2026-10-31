class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.10"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.10/reels-darwin-arm64"
    sha256 "af9a673c1095ca6af001c3fac09c9a9abd2ed2fe43be91cd942980c3e4462858"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.10/reels-linux-amd64"
      sha256 "3b46b412dd4fdaa3d9e6faa91b125e9127aaec00a4fde65eb5931aeb76355d21"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.10/reels-linux-arm64"
      sha256 "fcea1d1db450fe09cf039365838fa79484bb9732537e2017c2944677d2daae5f"
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
      Requires a terminal with Kitty graphics protocol support (Kitty, WezTerm, Konsole).
    EOS
  end
end
