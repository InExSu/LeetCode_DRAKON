@echo off

chcp 65001

rem принимает путь к файлу и путь к папке,
rem создает копию файла, добавляя к имени дату и время
rem "2023-11-19 12-13"),
rem и помещает копию файла в указанную папку:

rem вызов:  file_Copy_Date.bat PricePaint_Drakon.drn Git_Ignore_BackUps/

rem Получаем первый аргумент
set file_path=%~1

rem Получаем второй аргумент
set folder_path=%~2

rem Получаем текущую дату и время в формате ГГГГ-ММ-ДД_HH-ММ
for /f "tokens=2 delims==." %%a in ('wmic os get localdatetime /value') do set "datetime=%%a"
set "datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%"

rem Извлекаем имя файла из пути
for %%i in ("%file_path%") do (
    set "file_name=%%~ni"
    set "extension=%%~xi"
)

rem удаляю расширение
set "file_name=%file_name:~0,-1%"

rem Объединяем новое имя файла с датой и временем
set "new_file_name=%file_name%_%datetime%%extension%"

rem Путь для копии файла
set "new_file_path=%folder_path%\%new_file_name%"

rem Создаем копию файла в указанной папке
copy "%file_path%" "%new_file_path%"

echo "Создана копия файла "%file_name%""
echo "Новый файл: "%new_file_path%""
