class CodebaseMemoryMcp < Formula
  desc "Code intelligence MCP server that indexes codebases into a knowledge graph"
  homepage "https://github.com/DeusData/codebase-memory-mcp"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v0.12.1/codebase-memory-mcp-darwin-arm64.tar.gz"
      sha256 "9bfcbe38414b47969a3e1d1c1999f5357409387c86fa3d24221b5458267660d2"
    end
    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v0.12.1/codebase-memory-mcp-darwin-amd64.tar.gz"
      sha256 "ca6e64397a8ae80cec898a8205a6aa16750ac798acc05a0c3ed983837944a581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v0.12.1/codebase-memory-mcp-linux-arm64.tar.gz"
      sha256 "8575f126092660b93b170bdc2e06f3ef2dd28d3cc49ad6d0895dc3e4767219cd"
    end
    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v0.12.1/codebase-memory-mcp-linux-amd64.tar.gz"
      sha256 "8453015145f072c1b9b019cbdd02cea8cc6f18cc5e116036dd20992631c638c7"
    end
  end

  def install
    bin.install "codebase-memory-mcp"
    pkgshare.install "install.sh" if File.exist?("install.sh")
    doc.install "THIRD_PARTY_NOTICES.md" if File.exist?("THIRD_PARTY_NOTICES.md")
  end

  def caveats
    <<~EOS
      This formula installs only the binary. It does not run
      `codebase-memory-mcp install`, which edits shell rc files and
      agent configs (Claude Code, VS Code, Copilot, ...).
      Wire agents up explicitly, for example:
        claude mcp add -s user codebase-memory-mcp -- #{opt_bin}/codebase-memory-mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codebase-memory-mcp --version")
  end
end
