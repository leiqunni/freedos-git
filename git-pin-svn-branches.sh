#!/bin/bash

# svn/trunk, svn/tags/*, svn/*@xxx を除いたリモートブランチを checkout
for BRANCH_NAME in $(git branch -r | grep -ve 'svn/tags\|svn/trunk\|.*@\d*' | sed -e 's:svn/::'); do
    git checkout -b "$BRANCH_NAME" "svn/$BRANCH_NAME"
done;

# この時点でループの最後のブランチになっているので一応 master に戻しておく
git checkout master

