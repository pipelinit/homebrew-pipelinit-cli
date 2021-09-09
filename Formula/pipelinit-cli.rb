class PipelinitCli < Formula
  desc "Automatically generates pipelines for your project"
  homepage "https://pipelinit.com"
  url "https://github.com/pipelinit/pipelinit-cli/archive/refs/tags/v0.1.0-brew.tar.gz"
  sha256 "88f7dda931f1a7e3ed92618ee18b541d342105a9cd88eaae56865e4cd5d5589e"
  license "MIT"

  depends_on "deno" => :build

  def install
    cd "cli" do
      system "deno", "run", "--unstable", "--allow-read", "--allow-write", "--allow-net",
            "--allow-env", "--allow-run", "build.ts"
      bin.install "bin/pipelinit" => "pipelinit"
    end
  end

  test do
    system "#{bin}/pipelinit", "--help"
  end
end
