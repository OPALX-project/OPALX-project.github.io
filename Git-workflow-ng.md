# OPAL/Git development workflow

## Motivation
* QA is importent
  * users tries once or twice before giving
  * losing potential new developers
  * wrong physics, many users do not question the results
* more than QA
  * bug hunting is time consuming(!)
  * quick and dirty code usually stays forever once it is in
  * we save time if we follow some simple rules
     * coding style
     * error handling
     * proper Git workflow
     * ...
     * do it right from the beginning, otherwise someone else spends more time in bug hunting

## DevOps tools provided by Gitlab
* Gitlab provides tools for continuous integration/- deployment (CI/CD)
* maybe we can use (part of) them in the future
   * unit tests
   * coding style checker
   * syntax checker (lint)

## Git recipes/howtos
* to be written

## Git workflow

> Proposal to be discussed

> Chris already wrote something: https://gitlab.psi.ch/OPAL/src/wikis/git-workflow

* branches and tags on master upstream repository (http://gitlab.psi.ch/OPAL/src)
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
       * which checker to use?
       * once we used uncrustify
    * code duplications
    * error handling
    * obvious errors
    * unit tests written?
    * regression test(s) available and working?

## Tools

* splint, lint alternative (http://splint.org)
* cppcheck, static code analisys (http://cppcheck.sourceforge.net)
* uncrustify (http://uncrustify.sourceforge.net)
* emacs
   * flycheck