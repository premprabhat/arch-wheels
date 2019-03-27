if "%TESTPYPI_UPLOAD%" == "true" (
    twine upload --repository-url https://test.pypi.org/legacy/ -u %TESTPYPI_USERNAME% -p %TESTPYPI_PASSWORD% arch/dist/*
) else (
    echo "Test PyPi upload is disabled"
)
if "%PYPI_UPLOAD%" == "true" (
    twine upload --repository-url https://upload.pypi.org/legacy/ -u %PYPI_USERNAME% -p %PYPI_PASSWORD% arch/dist/*
) else (
    echo "PyPi upload is disabled"
)