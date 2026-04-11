class Ntd < Formula
  desc "A CLI/TUI tool for deploying NixOS configurations via Tailscale"
  homepage "https://github.com/super-smooth/ntd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64_SHA"
    else
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Darwin_x86_64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X86_64_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/super-smooth/ntd/releases/download/v1.0.0/ntd_Linux_x86_64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA"
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
