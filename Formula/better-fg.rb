class BetterFg < Formula
  desc "A more userfriendly and interactive version of fg"
  homepage "https://github.com/super-smooth/better-fg"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.6/better-fg_Darwin_arm64.tar.gz"
      sha256 "d711d1b16584f03f9188c3b3d51f81eea0527868cf36b7867f52a5035a057ee6"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.6/better-fg_Darwin_x86_64.tar.gz"
      sha256 "sha256:030ba8533f90c547b3777ad18f6f75270b21240593b099a07960db22ca0c380d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.6/better-fg_Linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.6/better-fg_Linux_x86_64.tar.gz"
      sha256 "sha256:53002c3068a5bc525434936dee5fb832918b554d8bdb498c5956ede22e38a3dd"
    end
  end

  def install
    bin.install "better-fg"
  end

  def caveats
    <<~EOS
      To use better-fg, add this to your shell config (~/.bashrc, ~/.zshrc):
        eval "$(better-fg init)"
      
      Then restart your shell and use the 'bfg' command.
    EOS
  end

  test do
    system "#{bin}/better-fg", "init"
  end
end
