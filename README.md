# intellij-idea-community
.deb Packages of IntelliJ IDEA Community Edition for Ubuntu

The latest upstream version is 2017.2.6 which is included in the package version 2017.2.6.

## Adding the ppa to Ubuntu

```
sudo apt-add-repository ppa:mmk2410/intellij-idea
sudo apt-get update
sudo apt-get install intellij-idea-community
```

## Report issues

Please report any issues at [phab.mmk2410.org](https://phab.mmk2410.org/maniphest/task/edit/form/3/). The current issues are also listed [there](https://phab.mmk2410.org/maniphest/query/J9cHtqRh7M5n/).

## Updating the package

To update the version follow these steps. Replace all instances of `[year].[major].[minor]` with the new version numbers (e.g., 2017.2.6++).

 1. Fork the repo
 2. Create your own feature branch

 ```
 git checkout -b version-[year].[major].[minor]
 ```

 3. Rename the following

 ```
 mv intellij-idea-community_2017.2.6 intellij-idea-community_[year].[major].[minor]
 mv intellij-idea-community_2017.2.6.orig.tar.gz intellij-idea-community_[year].[major].[minor].orig.tar.gz
 ```

 4. Edit the README.md and update the version numbers

 5. Go into the build files directory

 ```
 cd intellij-idea-community_[year].[major].[minor]/debian
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
 rm intellij-idea-community_2017.2.6-1*
 ```

 12. Install the package to test it

 ```
 sudo dpkg -i intellij-idea-community_[year].[major].[minor]_all.deb
 ```

 13. If everything works, add yourself to the CONTRIBUTORS.txt

 14. Commit your changes

 ```
 git add -A
 git commit -m "Version [year].[major].[minor]"
 ```

 15. Push to the branch

 ```
 git push origin version-[year].[major].[minor]
 ```

 16. Create new pull request

### Automatically do steps 2 to 12

Run `./update-new-version.sh 2017.2.6 [year].[major].[minor]`

### Setting up the build environment

Run `sudo apt install devscripts debhelper`.
