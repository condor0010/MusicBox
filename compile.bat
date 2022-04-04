@ECHO OFF
rem Author: Marius Silaghi, 2019
SET FILEBASE=%~n1
echo Handling Source: %FILEBASE%
setlocal

rem You may use quotes only once, for the whole parameter
set "PATH=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin;C:\Program Files (x86)\Windows Kits\8.1\bin\x86;C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools;C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\tools;C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\ide;C:\Program Files (x86)\HTML Help Workshop;C:\Program Files (x86)\MSBuild\14.0\bin\;C:\windows\Microsoft.NET\Framework\v4.0.30319\;C:\windows\SysWow64;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\ProgramData\Oracle\Java\javapath;C:\windows\system32;C:\windows;C:\windows\System32\Wbem;C:\windows\System32\WindowsPowerShell\v1.0\;C:\Users\Test\.dnx\bin;C:\Program Files\Microsoft DNX\Dnvm\;C:\Program Files\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files (x86)\Microsoft Emulator Manager\1.0\;C:\Program Files (x86)\nodejs\;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\Users\Test\AppData\Local\Microsoft\WindowsApps;%PATH%"

rem Or you should use quotes only for special characters, Beware to have no final undesired spaces...





set PATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\bin\HostX86\x86;C:\Program Files (x86)\Windows Kits\10\bin\10.0.17763.0\x86;;C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\tools;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\ide;C:\Program Files (x86)\HTML Help Workshop;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin;C:\Windows\Microsoft.NET\Framework\v4.0.30319\;C:\Windows\SysWow64;;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\ProgramData\chocolatey\bin;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\Users\condor0010\AppData\Local\Microsoft\WindowsApps;
set LIB=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\lib\x86;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\atlmfc\lib\x86;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\VS\lib\x86;;C:\Program Files (x86)\Windows Kits\10\lib\10.0.17763.0\ucrt\x86;;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\VS\UnitTest\lib;C:\Program Files (x86)\Windows Kits\10\lib\10.0.17763.0\um\x86;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6.1\lib\um\x86;;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6.1\Lib\um\x86
set LIBPATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\atlmfc\lib\x86;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\lib\x86;
set INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\include;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\atlmfc\include;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\VS\include;;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17763.0\ucrt;;;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\VS\UnitTest\include;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17763.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17763.0\shared;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17763.0\winrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17763.0\cppwinrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6.1\Include\um;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6.1\Include\um;







rem ml.exe /c /nologo /Sg /Zi /Fo"%FILEBASE%.obj" /Fl"%FILEBASE%.lst" /I "c:\Irvine" /W3 /errorReport:prompt /Ta%FILEBASE%.asm


FOR %%F IN (%*) DO (
echo Handling %%~nF
ml.exe /c /nologo /Sg /Zi /Fo"%%~nF.obj" /Fl"%%~nF.lst" /I "c:\Irvine" /W3 /errorReport:prompt /Ta%%~nF.asm
)

link.exe /ERRORREPORT:PROMPT /OUT:"%FILEBASE%.exe" /NOLOGO /LIBPATH:c:\Irvine user32.lib irvine32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE:NO /MACHINE:X86 /SAFESEH:NO %FILEBASE%.obj

endlocal

