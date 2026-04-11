class Ntd < Formula
  desc "A CLI/TUI tool for deploying NixOS configurations via Tailscale"
  homepage "https://github.com/super-smooth/ntd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Darwin_arm64.tar.gz"
      sha256 "22a8a51221948607c399c3d930102f81a5154f985319c55e3e71d85e68bc46a4"
    else
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Darwin_x86_64.tar.gz"
      sha256 "4bd43ee73ec4f7e8d9fb38b525e71bf3b78cd598212d7d9de2d5b1ddbcda2d4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Linux_x86_64.tar.gz"
      sha256 "20b0ccccececb9b3889d0cc39fcaf11b16e1d2c5a4420f3cfb18cf703bb9bc77"
    end
  end

  def install
    bin.install "ntd"
  end

  def caveats
    <<~EOS
      To use ntd, add this to your shell config (~/.bashrc, ~/.zshrc):
        eval "$(ntd init)"
      
      Then restart your shell.
      
      Requirements:
      - Nix with flakes enabled
      - Tailscale CLI installed and configured
    EOS
  end

  test do
    system "#{bin}/ntd", "--help"
  end
end
