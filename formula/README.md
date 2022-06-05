[_Home_`brew`]
==============
[_Formula_]e to [`config`]ure [`git`] for:

* [`bat`][[-extras]]
* [`delta`]
* _[Kaleidoscope]_

[`install`]
-----------
~~~ sh
brew tap danielbayley/gitconfig https://github.com/danielbayley/gitconfig
brew install gitconfig-bat #-extras #delta #kaleidoscope
~~~
or with [`brew bundle`]\[`install`] from a _[Brewfile]_:
~~~ ruby
repo = "danielbayley/gitconfig"
tap repo, "https://github.com/#{repo}"
brew "gitconfig-bat" #-extras #delta #kaleidoscope
~~~

[_home_`brew`]:   https://brew.sh
[`tap`]:          https://docs.brew.sh/Taps
[_formula_]:      https://docs.brew.sh/Formula-Cookbook
[`install`]:      https://docs.brew.sh/Manpage#install-options-formulacask-
[`brew bundle`]:  https://docs.brew.sh/Manpage#bundle-subcommand
[brewfile]:       https://github.com/Homebrew/homebrew-bundle#usage

[`git`]:          https://git-scm.com
[`config`]:       https://git-scm.com/docs/git-config

[kaleidoscope]:   https://kaleidoscope.app/ksdiff

[`bat`]:          https://github.com/sharkdp/bat#git
[-extras]:        https://github.com/eth-p/bat-extras#readme
[`delta`]:        https://github.com/dandavison/delta#get-started
