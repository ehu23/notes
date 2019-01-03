# Git Syntax
## By: Eddie Hu

---

## Removing file from git cache

`git rm --cached file1.txt`

- This removes the file from the git repo without removing it from the filesystem.
- Without the --cached flag, will remove from both the filesystem and the git repo.

## Change a remote's URL

---

command: git remote set-url 

parameters:
1. existing remote name (i.e. origin)
2. new url for the remote

Ex: git remote set-url origin https://github.com/USERNAME/REPO.git

- also works when switching from SSH to HTTPS and vice versa

## Renaming a remote's name

---

Command: git remote rename OLD_NAME NEW_NAME

Ex: `git remote rename origin origin2`
