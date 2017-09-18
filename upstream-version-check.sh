#!/bin/bash

cd /tmp

if [[ -d intellij ]]; then
    echo "An 'intellij' directory already exists. Aborting..."
fi

git clone -q  https://gitlab.com/mmk2410/intellij-idea-community.git intellij

cd intellij

uscan --nodownload
RESULT=$?

if [[ $RESULT -eq 0 ]]; then
    echo "New IntelliJ IDEA Version" | mail -s "New IntelliJ IDEA Version" opensource@mmk2410.org
fi

cd ..
rm -rf intellij

exit $RESULT
