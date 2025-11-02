class BetterFg < Formula
  desc "A more userfriendly and interactive version of fg"
  homepage "https://github.com/super-smooth/better-fg"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.8/better-fg_Darwin_arm64.tar.gz"
      sha256 "08ca53dc50246a45591efa0f089e6ae0fde5fe9106ef6ae45f3e9a3c2b52bc3c"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.8/better-fg_Darwin_x86_64.tar.gz"
      sha256 "eb110f5e3a0e4c99ee61effb6c8ae3a78d7828d8b02ecddc9f9a42de71378b8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.8/better-fg_Linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.0.1.8/better-fg_Linux_x86_64.tar.gz"
      sha256 "112b2a14ed18d014101ab263ed37e8e8e103970e18cad2c95f5c617b74c7d573"
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
