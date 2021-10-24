@echo OFF

setlocal

for /f "usebackq tokens=*" %%a in (`%~dp0paste\paste.exe`) do (
  copy "%%a" . > nul
  echo %%a
)