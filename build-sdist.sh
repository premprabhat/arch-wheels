#!/usr/bin/env bash

if [[ ${SDIST} == true ]]; then
    echo $PWD
    pip install numpy cython
    cd $REPO_DIR
    echo $PWD
    python --version
    python setup.py sdist
    ls -l dist
    ls -l ../
    echo mv -v dist/* ../wheelhouse/
    # mv -v dist/* ../wheelhouse/
    cd ${TRAVIS_BUILD_DIR}
else
    echo "sdist is disabled"
fi
