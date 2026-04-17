# typed: false
# frozen_string_literal: true

class MockartyCli < Formula
  desc "Mockarty CLI — mock, test, and automate your APIs"
  homepage "https://mockarty.ru"
  version "0.0.4-beta"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.4-beta/mockarty-cli-darwin-arm64"
      sha256 "f6d1cec833b8ff8985341743387a917e9a0501656080ab7c6dce64b2c8f28535"
    else
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.4-beta/mockarty-cli-darwin-amd64"
      sha256 "e5e7d6fcef712908ee74cc4fef71e2a98dd666b616759b929aa01485f93757fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.4-beta/mockarty-cli-linux-arm64"
      sha256 "bd100512a5c9023a95b729e7d7d4eb01f68796edcbb259b2005400ad3e2efde4"
    else
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.4-beta/mockarty-cli-linux-amd64"
      sha256 "0e68a2ac8504fe2e2bdbca2300f9663581559af49fee726807f231ff89fa658a"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "mockarty-cli-darwin-arm64" => "mockarty-cli"
    elsif OS.mac?
      bin.install "mockarty-cli-darwin-amd64" => "mockarty-cli"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "mockarty-cli-linux-arm64" => "mockarty-cli"
    else
      bin.install "mockarty-cli-linux-amd64" => "mockarty-cli"
    end
  end

  test do
    system "#{bin}/mockarty-cli", "--version"
  end
end
