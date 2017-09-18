# intellij-idea-community
.deb Packages of IntelliJ IDEA Community Edition for Ubuntu

The latest upstream version is 2017.2.4 which is included in the package version 2017.2.4.

## Adding the ppa to Ubuntu

```
sudo apt-add-repository ppa:mmk2410/intellij-idea
sudo apt-get update
sudo apt-get install intellij-idea-community
```

## Updating the package

To update the version follow the following steps (the old version is here 2017.2.3 and the new one 15.0.2):

 1. Fork the repo
 2. Create your own feature branch

 ```
 git checkout -b version-2017.2.4
 ```

 3. Rename the following

 ```
 mv intellij-idea-community_2017.2.3 intellij-idea-community_2017.2.4
 mv intellij-idea-community_2017.2.3.orig.tar.gz intellij-idea-community_2017.2.4.orig.tar.gz
 ```

 4. Edit the README.md and update the version numbers

 5. Go into the build files directory

 ```
 cd intellij-idea-community_2017.2.4/debian
 ```

 6. Edit the changelog file and prepend a new changelog entry. You can just copy an old one and update the values in it

 7. Edit the preinst file and update the download url. Normally this is done by updating the version number

 8. Go one directory back

 ```
 cd ..
 ```

 9. Run the following command to build the package for testing purposes

 ```
 debuild -us -uc
 ```

 10. Go another directory back

 ```
 cd ..
 ```

 11. Remove the old files

 ```
 rm intellij-idea-community_2017.2.3-1*
 ```

 12. Install the package to test it

 ```
 sudo dpkg -i intellij-idea-community_2017.2.4_all.deb
 ```

 13. If everything works, add yourself to the CONTRIBUTORS.txt

 14. Commit your changes

 ```
 git add -A
 git commit -m "Version 2017.2.4"
 ```

 15. Push to the branch

 ```
 git push origin version-2017.2.4
 ```

 16. Create new pull request

## Automatically do steps 2 to 12

Run `./update-new-version.sh 2017.2.3 2017.2.4`

## Setting up the build environment

Run `sudo apt install devscripts debhelper`.
