echo off
REM call C:\Users\msimko\Anaconda3\Scripts\activate.bat
REM cd C:\Users\msimko\OneDrive - EOS ENERGY STORAGE\Desktop\python_daily_scripts
REM ipython daily_analysis_1_collection.py
REM ipython daily_analysis_2_preprocessor.py
REM ipython daily_analysis_3_execute_nbs_seq.py
REM ipython daily_analysis_4_write_htmls.py
REM ipython daily_analysis_5_file_cleanup.py






REM call C:\Users\rtchamna\Anaconda3\Scripts\activate.bat
REM call C:\ProgramData\Anaconda3\Scripts\activate.bat
echo.
REM echo  BEGINNING TIME: %time%
echo.


REM call C:\Users\tcham\Anaconda3\Scripts\activate.bat
call C:\ProgramData\Anaconda3\Scripts\activate.bat



REM Change this path to where your scripth are located
REM cd C:\Users\Rtchamna\Desktop\From_Simko\daily_reports_legacy

:::::::::::::::::::::::::::::::::
:: DATE VALUES

:: Automatically Set the date
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
REM set mytime=%time%
set start_time=%time%

:: Manually Set the date: Must be on the forme mm/dd/yyyy
:: Comment this line out if you ant to input date manually

REM There where data this date:06/16/2022
REM There where no data this date:06/20/2022

REM set mydate=06/16/2022
REM set mydate=06/24/2022




echo Current date is %mydate%

echo Start Time: %start_time%

REM echo Current time is %mytime%


REM audio_folder = os.path.join(audio_folder,"")
REM phrases_path = r"C:\Users\tcham\Downloads\nufi_english_french_phrasebook_sentences_list.txt"
REM # =============================================================================================
REM Get the current working directory
set "CWD=%CD%"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::: PARAMETERS DEFINITIONS
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set silence_threshold=1.5
set silence_padding_duration=3
set repeat_local_audio=1

set "local_language_name=nufi"

REM set "audio_path=C:\Users\tcham\Downloads\Phrasebook%language_name%\%language_name%Only - Copy"
REM set "audio_path_eng=C:\Users\tcham\Downloads\Phrasebook%language_name%\EnglishOnly"

REM REM set "audio_path=C:\Users\tcham\Downloads\PhrasebookNufi\NufiOnly - Copy"
REM REM set "audio_path_eng=C:\Users\tcham\Downloads\PhrasebookNufi\EnglishOnly"

REM set "audio_path=C:\Users\tcham\Downloads\PhrasebookNufi\NufiOnly_test"
REM set "audio_path_eng=C:\Users\tcham\Downloads\PhrasebookNufi\EnglishOnly_test"

REM set flag_pad=True

REM :: FOR VIDEO PRODUCTION 

REM set "bilingual_audios_folder=%audio_path%\bilingual_sentences"
REM set "bilingual_phrases_path=C:\Users\tcham\Downloads\PhrasebookNufi\nufi_english_french_phrasebook_sentences_list.txt"

REM set "fonts_path=C:\Users\tcham\Downloads\NufiPhrasebook-27-3-23\app\src\main\assets\fonts\CharisSIL-B.ttf"
REM set "background_image=C:\Users\tcham\Downloads\AfricanBackground.jpg"



REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM set "local_language_name=yoruba"

REM set "audio_path=C:\Users\tcham\Downloads\PhrasebookYoruba\YorubaOnly_test"
REM set "audio_path_eng=C:\Users\tcham\Downloads\PhrasebookYoruba\EnglishOnly_test"

REM set flag_pad=True

REM :: FOR VIDEO PRODUCTION 

REM set "bilingual_audios_folder=%audio_path%\bilingual_sentences"
REM set "bilingual_phrases_path=C:\Users\tcham\Downloads\PhrasebookYoruba\Yoruba_english_french_phrasebook_sentences_list.txt"

REM set "fonts_path=C:\Users\tcham\Downloads\Phrasebook-27-3-23\app\src\main\assets\fonts\CharisSIL-B.ttf"
REM set "background_image=C:\Users\tcham\Downloads\AfricanBackground.jpg"


REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set "local_language_name=yoruba"
set "base_path=C:\Users\tcham\Downloads" 
set "phrasebook_path=%base_path%\Phrasebook%local_language_name%"
set "environment=test"  ;;; set to "test" or "production"

set "audio_path=%phrasebook_path%\%local_language_name%Only_test"
set "audio_path_eng=%phrasebook_path%\EnglishOnly_test"

set "bilingual_audios_folder=%audio_path%\bilingual_sentences"
set "bilingual_phrases_path=%phrasebook_path%\%local_language_name%_english_french_phrasebook_sentences_list.txt"

set "fonts_path=C:\Users\tcham\Resulam_Phrasebooks_Audio_Processing\CharisSIL-B.ttf"
set "background_image=%base_path%\AfricanBackground.jpg"

echo Using environment: %environment%
echo Audio Path: %audio_path%
echo Audio Path Eng: %audio_path_eng%
echo Bilingual Audios Folder: %bilingual_audios_folder%



REM echo Using environment: %environment%
REM echo Audio Path: %audio_path%
REM echo Audio Path Eng: %audio_path_eng%
REM echo Bilingual Audios Folder: %bilingual_audios_folder%


REM python "%cd%\1_notebook_execution_resulam_phrasebook_audio_processing.py" "%local_language_name%" %bilingual_audio_path%  %bilingual_phrases_path%  %silence_threshold% %silence_padding_duration% %repeat_local_audio% "%cd%"

REM python "%cd%\1_notebook_execution_resulam_phrasebook_audio_processing.py" ^
REM "%local_language_name%" %bilingual_audio_path%  %bilingual_phrases_path%  ^
REM %silence_threshold% %silence_padding_duration% %repeat_local_audio% ^
REM "%cd%"

REM python "%cd%\1_notebook_execution_resulam_phrasebook_audio_processing.py" "%local_language_name%" "%silence_threshold%" "%silence_padding_duration%" "%repeat_local_audio%" "%audio_path%" "%audio_path_eng%" "%flag_pad%" "%cd%"

set CMD=python "C:\Users\tcham\Resulam_Phrasebooks_Audio_Processing\1_notebook_execution_resulam_phrasebook_audio_processing.py" ^
 "%local_language_name%" ^
 %silence_threshold% ^
 %silence_padding_duration% ^
 %repeat_local_audio% ^
 "%audio_path%" ^
 "%audio_path_eng%" ^
 "%flag_pad%" ^
 "%cd%"

call %CMD%


:: REM FOR VIDEO PRODUCTION

set CMD=python "C:\Users\tcham\Resulam_Phrasebooks_Audio_Processing\4_notebook_execution_resulam_phrasebook_video_processing.py" ^
 "%bilingual_audios_folder%" ^
 %bilingual_phrases_path% ^
 %fonts_path% ^
 %background_image% ^
 "%cd%"

call %CMD%


echo.
echo " I am done ..." 

REM echo Yaa2 maf1 laha > testTchamna.txt
date /t
echo.
echo "Check the Html Data Analysis File here:" %archive_folder%
echo.

REM echo  END TIME: %time%

echo End Time: %time%

:: Calculate execution time
for /F "tokens=1-4 delims=:.," %%a in ("%start_time%") do set /A "start=(((%%a*60)+1%%b)*60+1%%c)*100+1%%d"
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do set /A "end=(((%%a*60)+1%%b)*60+1%%c)*100+1%%d"
set /A elapsed=end-start 
set /A hh=elapsed/(60*60*100), mm=(elapsed%%(60*60*100))/(60*100), ss=(elapsed%%(60*100))/100
echo Execution Time: %hh%:%mm%:%ss%


REM pause
REM @pause
@pause



REM REM GOTO :most_frequent_weak_modules


pause