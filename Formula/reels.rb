class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.6"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.6/reels-darwin-arm64"
    sha256 "70669172daa56a6af989c1313fcf16e53ca3160fb27802fa622fc986adec2a10"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.6/reels-linux-amd64"
      sha256 "7a2c2f68b37c828902eee6c6b604c16ebd3178f8dd98850ae562d7242eb6cb4b"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.6/reels-linux-arm64"
      sha256 "9e223fcfce7567e1a5e694427d88bbb7706a0e4995fb7f6a35432d9308f93ba4"
    end
  end

  def install
    if OS.mac?
      bin.install "reels-darwin-arm64" => "reels-bin"
      # Create wrapper script to set library paths
      (bin/"reels").write <<~EOS
        #!/bin/bash
        FFMPEG_PREFIX="$(brew --prefix ffmpeg-full)"
        export DYLD_LIBRARY_PATH="${FFMPEG_PREFIX}/lib:${DYLD_LIBRARY_PATH}"
        exec "#{bin}/reels-bin" "$@"
      EOS
    else
      if Hardware::CPU.arm?
        bin.install "reels-linux-arm64" => "reels-bin"
      else
        bin.install "reels-linux-amd64" => "reels-bin"
      end
      # Create wrapper script to set library paths
      (bin/"reels").write <<~EOS
        #!/bin/bash
        FFMPEG_PREFIX="$(brew --prefix ffmpeg-full)"
        export LD_LIBRARY_PATH="${FFMPEG_PREFIX}/lib:${LD_LIBRARY_PATH}"
        exec "#{bin}/reels-bin" "$@"
      EOS
    end
  end

  def caveats
    <<~EOS
      Requires Chrome, Chromium, or Brave browser to be installed.
      Requires a terminal with Kitty graphics protocol support (Kitty, WezTerm, Konsole).
    EOS
  end
end
