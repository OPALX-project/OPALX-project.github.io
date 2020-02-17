# ToDo List for OPAL release x.y

* [ ] source code and binary
  * [ ] create branch x.y
  * [ ] update version string in Doxyfile
  * [ ] update the version string in CMakeLists.txt and commit
  * [ ] tag version x.y.0
  * [ ] upload source tar-ball to `/afs/psi.ch/project/amas/webhosting/Downloads/OPAL/src`
  * [ ] compile new binary for Linux
  * [ ] compile new binary for macOS
  * [ ] upload tar-balls to `/afs/psi.ch/project/amas/webhosting/Downloads/OPAL/package/`
* [ ] manual/documentation
  * [ ] setup a repository for the new version of the manual
  * [ ] correct (the links to) the example input files, field maps also in the manual
  * [ ] compile new PDF version of manual
  * [ ] copy to `/afs/psi.ch/project/amas/webhosting/docs/opal/opal_user_guide-x.y.0.pdf`
  * [ ] add links to the binaries in the wiki
  * [ ] compile the change log/release notes and publish it in the wiki: https://gitlab.psi.ch/OPAL/src/wikis/ReleaseNotes/ReleaseNotes
* [ ] tracker
  * [ ] new label for `OPAL x.(y+1)`
  * [ ] update labels and milestones in issues
* [ ] setup the regression-tests to run the new version
* [ ] PSI module
* [ ] write e-mail to mailing list