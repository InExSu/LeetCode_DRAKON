@echo off

rem Drakon Editor путается, если в каталоге generators 
rem одновременно есть файлы php.tcl и TypeScript.tcl
rem поэтому оставляю один.

chcp 65001

set sourceFile=C:\Portable\drakon_editor1.31\generators\Spare\php.tcl
set destinationDir=C:\Portable\drakon_editor1.31\generators\
set deleteFile=C:\Portable\drakon_editor1.31\generators\TypeScript.tcl

rem Копирование файла php.tcl
copy "%sourceFile%" "%destinationDir%"

rem Удаление файла TypeScript.tcl
del "%deleteFile%"

echo Операции выполнены успешно.
