cd c:\temp\
echo | powershell Invoke-WebRequest -Uri "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2100120135/x64/AdobeAcroCleaner_DC2021.exe" -OutFile AdobeAcroCleaner_DC2021.exe
"AdobeAcroCleaner_DC2021.exe" /product=0 /silent