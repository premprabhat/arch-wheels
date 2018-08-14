#!/usr/bin/env bash

if [[ ${SDIST} == true ]]; then
    echo '----------------- SDIST Start ----------------'
    echo $PWD
    pip install numpy cython
    cd $REPO_DIR
    echo $PWD
    echo python --version
    python --version
    echo python setup.py sdist
    python setup.py sdist
    echo mv -v dist/* ../wheelhouse/
    mv -v dist/* ../wheelhouse/
    ls -l ../wheelhouse/
    cd ${TRAVIS_BUILD_DIR}
    echo '----------------- SDIST End ----------------'
else
    echo "sdist is disabled"
fi
