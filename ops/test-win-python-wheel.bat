echo ##[section]Setting up Python environment...
call micromamba activate dev

echo ##[section]Installing TL2cgen into Python environment...
setlocal enabledelayedexpansion
python ops\scripts\rename_whl.py python\dist %COMMIT_ID% win_amd64
if %errorlevel% neq 0 exit /b %errorlevel%
for /R %%i in (python\\dist\\*.whl) DO (
  python -m pip install "%%i"
  if !errorlevel! neq 0 exit /b !errorlevel!
)

echo ##[section]Running Python tests...
mkdir temp
python -m pytest --basetemp="%WORKING_DIR%\temp" -v -rxXs --fulltrace --durations=0 tests\python\test_basic.py
if %errorlevel% neq 0 exit /b %errorlevel%

echo ##[section]Uploading Python wheels...
for /R %%i in (python\\dist\\*.whl) DO (
  python -m awscli s3 cp "%%i" s3://tl2cgen-wheels/ --acl public-read || cd .
)
