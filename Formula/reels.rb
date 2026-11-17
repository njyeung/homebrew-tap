class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.11"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.11/reels-darwin-arm64"
    sha256 "b16fe576cda847ce2c7447d2e3aa3144dc6ee0dcd979219746d29045dd2d736c"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.11/reels-linux-amd64"
      sha256 "c7398a3e1335263a2f0f015ffc3a619609fab01ec78a0556d5cfd484b35f0b65"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.11/reels-linux-arm64"
      sha256 "c39f0d29ebea7485e1cb66f35c02cf0a60cce03280a0fb41343ac7b0dd21cf60"
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
