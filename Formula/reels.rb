class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.4"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.4/reels-darwin-arm64"
    sha256 "69f50111be53b083badb5595c06e041ecbd8eca8e7c8f195d974654cb808171c"
  end

  on_linux do
    url "https://github.com/njyeung/reels/releases/download/v1.2.4/reels-linux-amd64"
    sha256 "1218db5422e5f023a0b2cce7b4bf3b3e416bd075bb01c10eff9abaffc0c26a8b"
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
