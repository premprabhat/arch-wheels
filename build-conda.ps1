if ($env:CONDA_BUILD -eq "true") {
    $env:CPU_COUNT=2
    $env:PYTHONUNBUFFERED=1

    wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe" -OutFile "c:\Miniconda.exe"
    Start-Process -Wait "C:\Miniconda.exe" "/S /D=C:\Py"
    $env:Path ="C:\Py;C:\Py\Scripts;C:\Py\Library\bin;" + $env:Path
    conda config --set always_yes yes
    conda update conda
    conda install anaconda-client conda-verify conda-build numpy
    if ($env:CONDA_UPLOAD -eq "true") {
        conda config --set anaconda_upload yes
    }
    else
    {
        conda config --set anaconda_upload no
    }
    echo "conda build ./conda-recipe"
    conda build --user $env:ANACONDA_USERNAME --token $env:ANACONDA_TOKEN ./conda-recipe
    echo "conda build is enabled. Exiting"
    exit 0
}

# Exit if false, use skip to avoid existing
if ($env:CONDA_BUILD -eq "false") {
    echo "conda build is disabled. Exiting"
    exit 0
}
