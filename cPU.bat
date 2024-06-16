@echo off

chcp 65001

rem Получаем текущую дату
for /f "tokens=1-3 delims=-" %%a in ('date /t') do (
    set "DATE=%%a-%%b-%%c"
)
./
rem Выполняем команды git
git pull
git add .
git commit -m "%DATE%"
git push

rem Проверяем, передан ли первый аргумент
if "%~1"=="" (
    rem Если аргумент не передан, выводим предупреждение и завершаем выполнение скрипта
    echo "Ошибка: не передано имя файла. Выход"
    exit /b 1
)

rem Проверяем, существует ли файл
if not exist "%~1" (
    rem Если файл не существует, выводим предупреждение и завершаем выполнение скрипта
    echo "Ошибка: файл '%~1' не существует."
    exit /b 1
)

rem Используем имя файла без расширения
for %%I in ("%~1") do (
    set "filename_no_extension=%%~nI"
)

set "folder_name=drn_BackUps"

rem Проверяем, существует ли папка
if not exist "%folder_name%" (
    mkdir "%folder_name%"
    echo "Папка создана: %folder_name%"
)

rem Используем имя файла без расширения, добавляем новое расширение и передаем в file_Copy_Date.bat
call file_Copy_Date.bat "%filename_no_extension%.drn" "%folder_name%"
