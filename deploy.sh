#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo -e '\033[32;40m

  ____        U  ___ u    ____      ____     U _____ u   __   __
 / __"| u      \/"_ \/ U /"___|u U |  _"\ u  \| ___"|/   \ \ / /
<\___ \/       | | | | \| |  _ /  \| |_) |/   |  _|"      \ V /
 u___) |   .-,_| |_| |  | |_| |    |  _ <     | |___     U_|"|_u
 |____/>>   \_)-\___/    \____|    |_| \_\    |_____|      |_|
  )(  (__)       \\\\      _)(|_     //   \\\\_   <<   >>  .-,//|(_
 (__) .github.io(__)    (__)__)   (__)  (__) (__) (__)  \_) (__)  
 
'

echo -e "\033[32;40m [1/3] \033[0m commit 2 master branch"

git init
git add -A
git commit -m 'deploy master'

git push -f https://github.com/Sogrey/vue-webpack-start.git master

echo -e "\033[32;40m [2/3] \033[0m Building static files"
# 生成静态文件
npm run build

echo -e "\033[32;40m [3/3] \033[0m commit 2 gh-pages branch"
# 进入生成的文件夹
cd dist/

git init
git add -A
git commit -m 'deploy gh-pages'

git push -f https://github.com/Sogrey/vue-webpack-start.git master:gh-pages

echo -e "\033[32;40m done \033[0m "

cd -