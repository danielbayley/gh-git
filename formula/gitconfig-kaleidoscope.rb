class GitconfigKaleidoscope < Formula
  NAME = name.demodulize.titlecase.split.last.freeze
  desc "Integrate #{NAME} directly with git"
  homepage "https://#{NAME.downcase}.app/ksdiff"
  remote = `git -C #{__dir__} ls-remote --get-url`
  url "#{remote.chomp}/trunk", using: :svn
  version "1.0.0"
  license "MIT"

  INI = "#{NAME.downcase}.ini".freeze

  def install
    doc.install_metafiles

    appdir ||= Pathname Cask::Config::DEFAULT_DIRS[:appdir]
    app = appdir/"#{NAME}.app"
    html = app/"Contents/Resources/en.lproj/#{NAME}Help/Pages/integration_git.html"

    system HOMEBREW_BREW_FILE, "install", "--cask", NAME.downcase unless app.directory?

    require "nokogiri"
    dom = Nokogiri::HTML.parse html.read
    config = dom.css "pre"

    (buildpath/INI).write config.map(&:text).join
    prefix.install INI
  end

  def caveats
    <<~EOS
      To configure #{NAME}, run:
        git config --global include.path #{opt_prefix/INI}

      See also:
        #{homepage}#reading
    EOS
  end

  test do
    system "git init && git config include.path #{opt_prefix/INI}"
    tool = shell_output "git config diff.tool"
    assert_match NAME, tool
  end
end
