cd c:\temp\
echo | powershell Invoke-WebRequest -Uri "https://www.adobe.com/devnet-docs/acrobatetk/tools/Labs/AcroCleaner_DC2015.zip" -OutFile AcroCleaner_DC2015.zip
echo | powershell Expand-Archive c:\temp\AcroCleaner_DC2015.zip -DestinationPath c:\temp\
"AdobeAcroCleaner_DC2015.exe" /product=1 /silent