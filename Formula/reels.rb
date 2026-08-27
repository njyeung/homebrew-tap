class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.4/reels-darwin-arm64"
    sha256 "0a438617a955988f6a4c889c071923a271b7148b590bfb2bead9e2537a40a1d6"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.4/reels-linux-amd64"
      sha256 "4d54de09419cc6648bcda22944be4ba435ea88721b8ffecdec34be1f74cc4989"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.4/reels-linux-arm64"
      sha256 "2caf46798a69afbfa5b320af8727f16a75c13089a22dd98642f3d40a9ea727ec"
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
