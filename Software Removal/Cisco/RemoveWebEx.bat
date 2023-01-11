cd c:\temp\
echo | powershell Invoke-WebRequest -Uri "https://www.cisco.com/c/dam/en/us/td/docs/collaboration/webex_centers/Collaboration-Help/TS-Help-Portal-Support-Utilities/CiscoWebexRemovalTool/CiscoWebexRemoveTool.exe" -OutFile CiscoWebexRemoveTool.exe
CiscoWebexRemoveTool.exe /s