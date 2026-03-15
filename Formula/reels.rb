class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.1"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.1/reels-darwin-arm64"
    sha256 "11587371bf2026b479e6113738f2a82297c7ad95453db7690944d0f02dbc9468"
  end

  on_linux do
    url "https://github.com/njyeung/reels/releases/download/v1.2.1/reels-linux-amd64"
    sha256 "7707f784920947b5be5ec11aa640265f4cd048b0b63673e36b7a18e5c4e718f5"
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
