# intellij-idea-community
.deb Packages of IntelliJ IDEA Community Edition for Ubuntu

The latest upstream version is 15.0.1 which is included in the package version 15.0.1

## Adding the ppa to Ubuntu

`sudo apt-add-repository ppa:mmk2410/intellij-idea-community`

`sudo apt-get update`

`sudo apt-get install intellij-idea-community`

## FAQ

**Q:** How do I enable HiDPI support?

**A:** You have to add

`-Dhidpi=true`

to these files:

`/opt/intellij-idea-community/bin/idea.vmoptions`

`/opt/intellij-idea-community/bin/idea64.vmoptions`
