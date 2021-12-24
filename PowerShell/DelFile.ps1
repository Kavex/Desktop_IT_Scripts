param(
    [parameter(Mandatory=$true)]
	[string] $path
)

# the code below has been used from
#    https://blogs.technet.com/b/heyscriptingguy/archive/2013/10/19/weekend-scripter-use-powershell-and-pinvoke-to-remove-stubborn-files.aspx
# with inspiration from
#    http://www.leeholmes.com/blog/2009/02/17/moving-and-deleting-really-locked-files-in-powershell/
# and error handling from
#    https://blogs.technet.com/b/heyscriptingguy/archive/2013/06/25/use-powershell-to-interact-with-the-windows-api-part-1.aspx

Add-Type @'
    using System;
    using System.Text;
    using System.Runtime.InteropServices;
       
    public class Posh
    {
        public enum MoveFileFlags
        {
            MOVEFILE_DELAY_UNTIL_REBOOT         = 0x00000004
        }
 
        [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
        static extern bool MoveFileEx(string lpExistingFileName, string lpNewFileName, MoveFileFlags dwFlags);
        
        public static bool MarkFileDelete (string sourcefile)
        {
            return MoveFileEx(sourcefile, null, MoveFileFlags.MOVEFILE_DELAY_UNTIL_REBOOT);         
        }
    }
'@

$path = (Resolve-Path $path -ErrorAction Stop).Path
try {
    Remove-Item $path -ErrorAction Stop
} catch {
    $deleteResult = [Posh]::MarkFileDelete($path)
    if ($deleteResult -eq $false) {
        throw (New-Object ComponentModel.Win32Exception) # calls GetLastError
    } else {
        # write-host "(Delete of $path failed: $($_.Exception.Message)  Deleting at next boot.)"
    }
}