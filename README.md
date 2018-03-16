Building and uploading randomgen wheels
========================================

We automate wheel building using this custom github repository that builds on the travis-ci OSX machines and the travis-ci Linux machines.

The travis-ci interface for the builds is <https://travis-ci.org/bashtage/randomgen-wheels>

The driving github repository is <https://github.com/bashtage/randomgen-wheels>

How it works
------------

The wheel-building repository:

-   builds a randomgen wheel;
-   processes the wheel using [delocate](https://pypi.python.org/pypi/delocate) (OSX) or [auditwheel](https://pypi.python.org/pypi/auditwheel) `repair` ([Manylinux1](https://www.python.org/dev/peps/pep-0513)). `delocate` and `auditwheel` copy the required dynamic libraries into the wheel and relinks the extension modules against the copied libraries;
-   uploads the built wheels to <http://test.pypi.org>.

The resulting wheels are therefore self-contained and do not need any external dynamic libraries apart from those provided as standard by OSX / Linux as defined by the manylinux1 standard.

The `.travis.yml` file in this repository has a line containing the login for Test PyPi encrypted with an RSA key that is unique to the repository - see <http://docs.travis-ci.com/user/encryption-keys>. This encrypted key gives the travis build permission to upload to test PyPi.

Triggering a build
------------------
You will likely want to edit the `.travis.yml` file to specify the `BUILD_COMMIT` before triggering a build - see below.

You can trigger a build by:

-   making a commit to the randomgen-wheels repository (e.g. with git
    commit --allow-empty); or
-   clicking on the circular arrow icon towards the top right of the travis-ci page, to rerun the previous build.

In general, it is better to trigger a build with a commit, because this makes a new set of build products and logs, keeping the old ones for reference. Keeping the old build logs helps us keep track of previous problems and successful builds.

Which randomgen commit does the repository build?
-------------------------------------------------

The randomgen-wheels repository will build the commit specified in the `BUILD_COMMIT` at the top of the `.travis.yml` file. This can be any naming of a commit, including branch name, tag name or commit hash.

Uploading the built wheels to pypi
----------------------------------

Wheels are are automatically uploaded using [twine](https://pypi.python.org/pypi/twine). 

Of course, you will need permissions to upload to PyPI, for this to work.
