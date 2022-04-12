ipconfig /release
ipconfig /flushdns
ipconfig /renew
netsh int ip reset c:\temp\resetlog.txt 
netsh winsock reset
shutdown -r -t 00
echo done