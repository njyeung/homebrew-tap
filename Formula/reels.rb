class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.4.6"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.4.6/reels-darwin-arm64"
    sha256 "b140cf116a7c173f9506e66ca3a8409eb50ca0bbeec0f45df60721ab85a7cace"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.4.6/reels-linux-amd64"
      sha256 "71daed376bddd64eb366722bc67f746c1ba9e893eecd1814936570c5697820f6"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.4.6/reels-linux-arm64"
      sha256 "a83fb31b874b43fafc0771a07ab9fe9db16ecfe4b42c1d36ec29f488ae45afa1"
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
