::For execution in Windows.
::Everything below is taken from https://discussion.evernote.com/forums/topic/124273-how-to-batch-file-script-to-backup-evernote-to-google-drive/. 
:: Make sure to remove all slashes and ampersand signs from the notebook names. Notebook names containing "/" and "& " will not be exported.

@echo off

@rem Use Unicode/65001 code page to support notebooks with non-English locale names
chcp 65001 > nul

@rem Make sure the Evernote script file is in the right path.
set ProgPath="C:\Program Files (x86)\Evernote\Evernote\ENScript.exe"
if Not Exist %ProgPath% echo Error: Cannot find %ProgPath% program file. Exiting. & goto :EOF

@rem Build the timestamp to be used for the backup file name
for /F %%A In ('WMIC OS GET LocalDateTime ^| Findstr \.') Do @Set B=%%A
set Timestamp=%B:~0,8%-%B:~8,6%
@rem echo Timestamp=%Timestamp%

@rem Specify the backup folder using the generated timestamp
set BackupFolder=D:\evernote_lib\%Timestamp%
@echo Backup Folder = "%BackupFolder%"
if Not Exist "%BackupFolder%." Mkdir "%BackupFolder%"

@rem For each Evernote notebook, call the subroutine to back it up.
for /F "delims==" %%i In ('%ProgPath% listNotebooks') Do Call :BackupNotebook "%%i"
@echo Done
Goto :EOF

@rem Subroutine to backup Evernote notebooks
:BackupNotebook
set NotebookName=%~1
@echo Backing up notebook %NotebookName% ...
%ProgPath% exportNotes /q "notebook:\"%NotebookName%\"" /f "%BackupFolder%\%NotebookName%.enex"
exit /b
