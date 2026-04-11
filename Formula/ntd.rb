class Ntd < Formula
  desc "A CLI/TUI tool for deploying NixOS configurations via Tailscale"
  homepage "https://github.com/super-smooth/ntd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.1/ntd_Darwin_arm64.tar.gz"
      sha256 "1999ab948a9a46738743640effb3685e1999d589ae2c30cdb75063c88367ad17"
    else
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.1/ntd_Darwin_x86_64.tar.gz"
      sha256 "87004b8013542a7bc75ea1d51a841e8b0d367a6ecc62e92eb4b07214ddff6d06"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.1/ntd_Linux_x86_64.tar.gz"
      sha256 "9537f7332e6a16be8d64c444ee6354d1aa7459cca943488f3a01c5cdebebc34b"
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
