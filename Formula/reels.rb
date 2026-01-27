class Reels < Formula
  desc "TUI Instagram Reels viewer"
  homepage "https://github.com/njyeung/reels"
  version "1.1.3"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.1.3/reels-darwin-arm64"
    sha256 "17e669913549278edcf8283be6f267305c7244cc6a6db7ab06d5fa071d544f2a"
  end

  on_linux do
    url "https://github.com/njyeung/reels/releases/download/v1.1.3/reels-linux-amd64"
    sha256 "4c9d49b2ebeb14a733cf6f7747797c3693bdcbf9431c28440d1330d89739ca39"
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
