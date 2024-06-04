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

```
2045  git checkout -b feature/upgrade
 2046  git diff
 2047  git status
 2048  git add .
 2049  git commit -m "upgrade encoder version and add img"
 2050  git diff
 2051  git branch
 2052  git push -u origin feature/upgrade
 2053  git branch
 2054  git checkout main 
 2055  git fetch
 2056  git checkout feature/upgrade
 2057  git log
 2058  git log --oneline
 2059  clear
 2060  git push -u origin feature/upgrade
 2061  git branch
 2062  git checkout -b bugfix
 2063  git diff
 2064  git add .
 2065  git commit -m "fix typo in src main"
 2066  git push
 2067  git push -u origin bugfix
 2068  git checkout feature/upgrade
 2069  git checkout main 
 2070  git merge feature/upgrade
 2071  git push
 2072  git checkout bugfix
 2073  git add .
 2074  git commit -m "change version to 7.2"
 2075  git merge main
 2076  git log
 2077  git status
 2078  git push
 2079  git branch
 2080  git add .
 2081  git commit -m "fixed spelling mistake"
 2082  git add .
 2083  git commit -m "set new image url"
 2084  git push
 2085  git revert HEAD~1
 2086  git log
 2087  git reset --HARD HEAD~1 # error
 2088  git reset --hard HEAD~1
 2089  git log
 2090  git revert HEAD
 2091  git log
 2092  git push
 2093  git branch
 2094  git checkout main
 2095  git merge bugfix
 2096  git push
 2097  git branch
 2098  git branch -D feature/upgrade bugfix
 2099  git log
 ```