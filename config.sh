# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]


function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function pip_opts {
    # Define extra pip arguments
    :
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    echo $PWD
    pip list
    echo "running tests"
    echo python --version
    python --version
    echo pytest --pyargs randomgen
    pytest --pyargs randomgen
    echo "test complete"
}
