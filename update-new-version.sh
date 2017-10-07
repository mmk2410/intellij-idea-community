#!/bin/bash
function main {
    local old=$1
    local new=$2
    local now=`date -R`
    local author=`git config --get user.name`
    local email=`git config --get user.email`
    local username=`git config --get remote.origin.url | sed 's,.*:\(.*\)/.*,\1,'`
    local tempfile=`tempfile`

    git checkout -b version-$new

    mv intellij-idea-community_{$old,$new}
    mv intellij-idea-community_{$old,$new}.orig.tar.gz

    # 4. Edit README.md to update latest version number.
    sed "s/$old/$new/g" ./README.md > ./README.md.tmp 
    mv ./README.md.tmp ./README.md

    echo "intellij-idea-community ($new-1) artful; urgency=low

  * Upstream Version $new

 -- $author ($username) <$email>  $now
 " >> $tempfile

    cat intellij-idea-community_$new/debian/changelog >> $tempfile
    mv $tempfile intellij-idea-community_$new/debian/changelog

    sed -i "s/$old/$new/g" intellij-idea-community_$new/debian/preinst

    (cd intellij-idea-community_$new/ && debuild -us -uc )

    rm intellij-idea-community_${old}*

    sudo dpkg -i intellij-idea-community_$new-1_all.deb
}



main $1 $2
