if ($env:CONDA_BUILD -eq "true") {
    $env:CPU_COUNT=2
    $env:PYTHONUNBUFFERED=1

    curl -fsS -o c:\Miniconda.exe "https://repo.continuum.io/miniconda/Miniconda%PY_MAJOR_VER%-latest-Windows-%PYTHON_ARCH%.exe"
    Start-Process -Wait C:\Miniconda.exe /S /D=C:\Py
    $env:Path ="C:\Py;C:\Py\Scripts;C:\Py\Library\bin;" + $env:Path
    conda config --set always_yes yes
    conda update conda --quiet
    conda install anaconda-client conda-verify conda-build
    if ($env:CONDA_UPLOAD -eq "true") {
        conda config --set anaconda_upload yes
    }
    else
    {
        conda config --set anaconda_upload no
    }
    echo conda build --user $env:ANACONDA_USERNAME --token $env:ANACONDA_TOKEN ./conda-recipe
    conda build --user $env:ANACONDA_USERNAME --token $env:ANACONDA_TOKEN ./conda-recipe
}
else
{
    echo "conda build is disabled"
}
