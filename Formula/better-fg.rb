class BetterFg < Formula
  desc "A more userfriendly and interactive version of fg"
  homepage "https://github.com/super-smooth/better-fg"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.1.0.0/better-fg_Darwin_arm64.tar.gz"
      sha256 "b44e88a665d03ce01f03b04a63f3f5da5d41b2aa5474877276ac88ed2fdd0d3e"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.1.0.0/better-fg_Darwin_x86_64.tar.gz"
      sha256 "89e67721d5823bb3a2c91a1ed761bd9415fa6304116714356a34deb5663777e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/super-smooth/better-fg/releases/download/v.1.0.0/better-fg_Linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA"
    else
      url "https://github.com/super-smooth/better-fg/releases/download/v.1.0.0/better-fg_Linux_x86_64.tar.gz"
      sha256 "255601236f759d1c7ed5f641b8bbc624b8157a9005fd02529461bd720cd68822"
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
