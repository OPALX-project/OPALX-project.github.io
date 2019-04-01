# OPAL/Git development workflow

## QA and more
* QA is importent
  * wrong physics (many users do not question the results)
  * users tries once or twice before giving
  * losing potential new developers
* more than QA
  * bug hunting is time consuming(!)
  * quick and dirty code usually stays forever once it is in
  * we save time if we follow some rules
     * coding style
     * error handling
     * proper Git workflow
     * ...
* do it right from the beginning
     * otherwise someone spends more time in bug hunting

## Git workflow

> Proposal to be discussed

> we already have something: https://gitlab.psi.ch/OPAL/src/wikis/git-workflow

* branches and tags on upstream repository (http://gitlab.psi.ch/OPAL/src)
  * stable versions (like OPAL 1.6, 2.0)
     * tags for released versions
  * master for development
     * versioning?
  * fixes
* forks
  * big changes
  * research
  * non core developers (master-, PhD. students)
  * Git newbies
  * as playground
* merge requests (upstream repository)
  * all changes to upstream repository via merge request
  * create a branch for all changes
  * do one thing per branch/merge request
  * for all merge request file an issue
    * can be used in a Changelog
  * must be reviewed
    * review process must be defined
    * proposal: all core developers can review 
    * must be reviewed by at least 2 core developers
    * merge assigned to creator
    * Gitlab provides
       * comments on commits
       * comments on merge requests
  * more a "formal" review:
    * coding style
    * code duplications
    * error handling
    * obvious errors
    * unit tests
    * regression test(s)?
    ...
