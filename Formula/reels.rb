class Reels < Formula
  desc "Instagram reels in the terminal"
  homepage "https://github.com/njyeung/reels"
  version "1.2.5"
  license "MIT"

  depends_on "ffmpeg-full"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/njyeung/reels/releases/download/v1.2.5/reels-darwin-arm64"
    sha256 "459798d69303da1d0257c3c894930cee951a62404ce1cc75a9153f829d2dc0b4"
  end

  on_linux do
    on_intel do
      url "https://github.com/njyeung/reels/releases/download/v1.2.5/reels-linux-amd64"
      sha256 "e564676f3d6bbf62101a51523b254815f1dae4c919df3c0881493cd073818c03"
    end
    on_arm do
      url "https://github.com/njyeung/reels/releases/download/v1.2.5/reels-linux-arm64"
      sha256 "3fd87dc110ad436a0eb93ad6224a1f17ff7fc99f008190515b60a9e96753a178"
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
