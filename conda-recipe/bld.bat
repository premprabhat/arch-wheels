REM Python command to install
python setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1
