if "%CONDA_BUILD%" == "true" (
    conda install conda-build anaconda-client
    if "%CONDA_UPLOAD%" == "true" (
        conda config --set anaconda_upload yes
    ) else (
        conda config --set anaconda_upload no
    )
    echo conda build --python %PY_VER% --numpy %CONDA_NUMPY_VERSION% ./conda-recipe
    conda build --python %PY_VER% --numpy %CONDA_NUMPY_VERSION% --user %ANACONDA_USERNAME% --token %ANACONDA_TOKEN% ./conda-recipe
)
