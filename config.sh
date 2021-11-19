# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]


function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function build_wheel {
    # Prevent spurious numpy upgrade by using bdist_wheel
    wrap_wheel_builder build_pip_wheel $@
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -m pip list
    MPLBACKEND="agg" python -c "import arch; arch.test()"
}
