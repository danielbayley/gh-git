#! /bin/zsh --no-rcs --err-exit
git commit --amend --no-verify --no-edit --date "$*"

# https://htmlpreview.github.io?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html
if (($+commands[git-filter-repo])) then
  git filter-repo --commit-callback commit.committer_date=commit.author_date --force --refs HEAD
else
  export FILTER_BRANCH_SQUELCH_WARNING=1
  git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE' --force
fi
