# Git Refresher

## Add `.gitignore `

```
git rm --cached .DS_Store

# -r for directories
git rm -r --cached .idea
git rm -r --cached out
git rm -r --cached build

# commit & push the changes
git add .
git commit -m "remove ignored files"
git push

```