@echo off
powershell -NoProfile -Command "Expand-Archive -Path gisette_train.data.zip -DestinationPath . -Force"
echo Done. Extracted gisette_train.data
pause
