#!/bin/bash
version=$1

if [ -z $version ]; then
    echo 'You have to provide version number'
    echo 'ex: for 1.1.17'
    exit
fi

rsync -av xivo-gallifrey-1.1.1/ xivo-gallifrey-$version/ > /dev/null 2>&1
sed -i "s/1.1.1/$version/" xivo-gallifrey-$version/postinst_script
git add xivo-gallifrey-$version

git status

echo 'You have to commit your modification'
