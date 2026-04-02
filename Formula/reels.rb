class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.7"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.7/reels-darwin-arm64"
    sha256 "6f98da41475a9b6649a9ec70d97171f59b0b8963f934b07868c641355b3f9326"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.7/reels-linux-amd64"
      sha256 "13e0b6bcb8d9a19be14d6ee146b1d2d3e0c632bb18ee43975c0617957913c7e9"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.7/reels-linux-arm64"
      sha256 "3e9cf773898b4502fa7126cc937b12e16518a06248168d15b6dfb44ab828f7c0"
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
