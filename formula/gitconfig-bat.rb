class GitconfigBat < Formula
  NAME = name.demodulize.titlecase.split.last.freeze
  desc "Git configuration for #{NAME}"
  remote = `git -C #{__dir__} ls-remote --get-url`
  url "#{remote.chomp}/trunk", using: :svn
  homepage "https://github.com/sharkdp/#{NAME.downcase}#git"
  version "1.0.0"
  license "MIT"

  INI = "#{NAME.downcase}.ini".freeze

  def install
    doc.install_metafiles
    prefix.install "share/#{INI}"
  end

  def caveats
    <<~EOS
      To configure #{NAME}, run:
        git config --global include.path #{opt_prefix/INI}
    EOS
  end

  test do
    system "git init && git config include.path #{opt_prefix/INI}"
    stdout = shell_output "git config alias.bat"
    assert_match NAME.upcase, stdout
  end
end
