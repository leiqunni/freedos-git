#!/bin/bash
for branch in `git for-each-ref --format='%(refname)' | grep tags/`
do
  git show --pretty=format:%s%n%n%b "$branch" | git tag -F - "`basename $branch`" "$branch^"
done

