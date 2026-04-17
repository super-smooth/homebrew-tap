class Ntd < Formula
  desc "A CLI/TUI tool for deploying NixOS configurations via Tailscale"
  homepage "https://github.com/super-smooth/ntd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.3/ntd_Darwin_arm64.tar.gz"
      sha256 "7c1a158d4134dd82ad2c2b6bf8689af26da8282d92965b29384f1f0a66f934b4"
    else
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.3/ntd_Darwin_x86_64.tar.gz"
      sha256 "1db6ab8af1bcbd9e61513f73233d04c24a3c591b8057617fc77c2204773f1441"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.3/ntd_Linux_x86_64.tar.gz"
      sha256 "d725960e4dad9782778e740503fc5caa8b769347cd41eeffc5ce3640f6c303f1"
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
