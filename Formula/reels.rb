class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.10"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.10/reels-darwin-arm64"
    sha256 "7120cea07d596377a76b31258fe25a74d32c197e6b234e17ed013bf3af473353"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.10/reels-linux-amd64"
      sha256 "3170cd036861b2f2db3134b374e35161b849a4124f66f37e48b96607cd1edddf"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.10/reels-linux-arm64"
      sha256 "6f7f144e9c3d8588f37c2c35f8710974ec113d2280918f6dac9a491d61af2eab"
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
