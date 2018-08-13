# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]


function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.

    # Work around for statsmodels when wheel doesn't exist
    echo "----------------- PRE_BUILD -----------------"
    echo uname -a
    uname -a
    # if [ -z "$IS_OSX" ]; then
        # apt-get install libfreetype6-dev pkg-config libpng12-dev
    # fi
    pip install numpy scipy cython  
    if [ -n "$IS_OSX" ]; then
        # Only x86_64 by default
        ARCH_FLAGS=${ARCH_FLAGS:-"-arch x86_64"}
    fi
    echo "----------------- PRE_BUILD -----------------"
}

function pip_opts {
    # Define extra pip arguments
    :
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    MPLBACKEND="agg" pytest --pyargs arch.tests
}
