class Ntd < Formula
  desc "A CLI/TUI tool for deploying NixOS configurations via Tailscale"
  homepage "https://github.com/super-smooth/ntd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.2/ntd_Darwin_arm64.tar.gz"
      sha256 "a1a20905bfeb806ddce5bb7ccaa0c7dc34646a118ab669c1bc14cd49a3205a9b"
    else
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.2/ntd_Darwin_x86_64.tar.gz"
      sha256 "3d0afa85cabd6b1e8103e91745fc84282dd012df1f68603d4045e2aff57c07b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.2/ntd_Linux_x86_64.tar.gz"
      sha256 "c3802d6b9a2f233242b09816b08560e69114b1f6e8f53f159046ddb4bd2cbe7a"
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
