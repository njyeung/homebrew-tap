class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.0/reels-darwin-arm64"
    sha256 "6036fe4732a121970ecfc8ab0a6d68c0cdd6d97d427dc4c4562e6ca048a4a609"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.0/reels-linux-amd64"
      sha256 "63d1d05e92d882001dffe125d3af816c7b1c0f07ba8d5287f9ea68d6de652a89"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.0/reels-linux-arm64"
      sha256 "9ee8f6824dba26db156b1fa724cc74d950371114c2f2f13da1aa90fb038d74bd"
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
