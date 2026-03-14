class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.0"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.0/reels-darwin-arm64"
    sha256 "a1ad20cc51149a223256c329f3fc5e7759c6d4dee995708abedf1c415565082f"
  end

  on_linux do
    url "https://github.com/njyeung/reels/releases/download/v1.2.0/reels-linux-amd64"
    sha256 "e59f4645d22b638c95cc4edceea9fe885661c583cc063a5e17ee2dd12c43a4cd"
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
      bin.install "reels-linux-amd64" => "reels-bin"
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
