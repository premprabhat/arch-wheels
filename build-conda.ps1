if "%CONDA_BUILD%" == "true" (
    :: Needed for building extensions in python2.7 x64 with cmake.
    :: Since python version and arch is not known at this point, install it everywhere.
    set CPU_COUNT=2
    set PYTHONUNBUFFERED=1

    deactivate
    conda install anaconda-client conda-verify
    if "%CONDA_UPLOAD%" == "true" (
        conda config --set anaconda_upload yes
    ) else (
        conda config --set anaconda_upload no
    )
    echo conda build --python %PYTHON_VERSION% --numpy %CONDA_NUMPY_VERSION% ./conda-recipe
    conda build --python %PYTHON_VERSION% --numpy %CONDA_NUMPY_VERSION% --user %ANACONDA_USERNAME% --token %ANACONDA_TOKEN% ./conda-recipe
) else (
    echo "conda build is disabled"
)
