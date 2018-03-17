if "%TESTPYPI_UPLOAD%" == "true" (
    twine upload --repository-url https://test.pypi.org/legacy/ -u %TESTPYPI_USERNAME% -p %TESTPYPI_PASSWORD% randomgen/dist/*
)
if "%PYPI_UPLOAD%" == "true" (
    twine upload --repository-url https://upload.pypi.org/legacy/ -u %PYPI_USERNAME% -p %PYPI_PASSWORD% randomgen/dist/*
)
