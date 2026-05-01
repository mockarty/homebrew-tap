# typed: false
# frozen_string_literal: true

class MockartyCli < Formula
  desc "Mockarty CLI — mock, test, and automate your APIs"
  homepage "https://mockarty.ru"
  version "0.0.5-beta"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.5-beta/mockarty-cli-darwin-arm64"
      sha256 "851a844ca35d97e598631dc059fd8b51197d0dca1af78bf5f788fd270f7373a4"
    else
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.5-beta/mockarty-cli-darwin-amd64"
      sha256 "b1aa90d07aa26d52b7dc4f3c8c1c3c0e0b2df7db4e66e9d5ea9e07fdae572dc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.5-beta/mockarty-cli-linux-arm64"
      sha256 "258fd527c3af2abd260e944586832a098d0a25b59f9fe6ef5db6c0331b04d4ad"
    else
      url "https://github.com/mockarty/mockarty-cli/releases/download/v0.0.5-beta/mockarty-cli-linux-amd64"
      sha256 "2eab9adedc6c76ca67114d1ac131ac1cb3ccf58ecd2363f71ef52a2f7b3fe7c8"
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
