@Echo off
Setlocal EnableDelayedExpansion

Rem Make a file with all the computer names list on each line and this will transfer the files to the computer

for /f "tokens=*" %%a in (c:\temp\computers.txt) do (
	echo Running commands for %%a
	
copy c:\temp\program.exe \\%%a\c$\temp\program.exe
   
)
echo script done
PAUSE