#! /bin/bash

mkdir -p .deploy_git/region

cp server/world/region/r.0.0.mca .deploy_git/region
cp server/world/region/r.0.-1.mca .deploy_git/region
cp server/world/region/r.-1.0.mca .deploy_git/region
cp server/world/region/r.-1.-1.mca .deploy_git/region

cp world/level.dat .deploy_git

git -C .deploy_git init
git -C .deploy_git add -A
git -C .deploy_git commit -m "Contents updated: ${}"
git -C .deploy_git push -u "https://github.com/HaneServer/docker-minecraft" "HEAD:world_data" --force