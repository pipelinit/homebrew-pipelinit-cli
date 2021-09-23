class PipelinitCli < Formula
  desc "Automatically generates pipelines for your project"
  homepage "https://pipelinit.com"
  url "https://github.com/pipelinit/pipelinit-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5872d56d277d5eba598ee4ebde19a4e0b5ff00ed07424be492087b5eebe23af3"
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
