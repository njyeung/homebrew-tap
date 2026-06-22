class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.3.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.3.3/reels-darwin-arm64"
    sha256 "949e262c7211a4c2e2b16a6a0ca131e33617a76e2d435ad3a282e096532424ee"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.3.3/reels-linux-amd64"
      sha256 "4fddbdefcf4c751de4d3704f481fa79e64fbcc951182e4a20f2d1f2c7014d5e8"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.3.3/reels-linux-arm64"
      sha256 "3d4ae1c2e10242e781a03ac10d6ac773c3f62ba6188465c37621fcfba03978a0"
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
