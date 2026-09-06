class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.5"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.5/reels-darwin-arm64"
    sha256 "f0925e0c821f4bdce868f70af4276235f053dbd86510a76fa799cec5d16b89fe"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.5/reels-linux-amd64"
      sha256 "6511755431ae7656c14a207cfd50bf42115bfede4f2648757170e3b5fe84f5e1"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.5/reels-linux-arm64"
      sha256 "cd96f8a6b59d10caa4f882e0920c87b59920079f90fdbce743398eefa9a79951"
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
