# pip install cached_property
%PYTHON% -m pip install --no-deps cached_property
# Python command to install
"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1
