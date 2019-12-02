"C:\Users\TechFast Australia\AppData\Local\Programs\Python\Python38-32\python.exe" "%~dp0Rearrange.py"
set /p texte=< %~dp0\FileAtoB.txt  
processing-java.exe --sketch=%~dp0\..\%texte% --run
pause