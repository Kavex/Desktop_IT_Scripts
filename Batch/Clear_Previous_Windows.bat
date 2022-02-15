rem clear out wiindows.old - Remove Previous of Windows Installation
cd C:\
attrib -r -a -s -h C:\Windows.old /S /D
takeown /f Windows.old /a /r
rd /s /q Windows.old