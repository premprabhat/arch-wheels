if "%CONDA_BUILD%" == "true" (
    conda install conda-build
    if "%CONDA_UPLOAD%" == "true" (
        conda config --set anaconda_upload yes
        anaconda login --username %ANACONDA_USERNAME% --password %ANACONDA_PASSWORD%
    )
    echo conda build --python %PY_VER% --numpy %CONDA_NUMPY_VERSION% ./conda-recipe
    conda build --python %PY_VER% --numpy %CONDA_NUMPY_VERSION% ./conda-recipe
)
