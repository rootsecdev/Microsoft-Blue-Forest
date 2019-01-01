REM SPECULATIVE CPU Update 

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 8 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f

REM Resolve MS15-124 Shows up on nessus scan even on server core
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING" /v iexplore.exe /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING" /v iexplore.exe /t REG_DWORD /d 1 /f

REM Install Windows Defender Definition Update
D:\mpam-fe.exe

REM Install MS Patches
wusa.exe D:\windows10.0-kb4132216-x64_9cbeb1024166bdeceff90cd564714e1dcd01296e.msu /quiet /norestart
wusa.exe D:\windows10.0-kb4465659-x64_af8e00c5ba5117880cbc346278c7742a6efa6db1.msu /quiet /norestart
wusa.exe D:\windows10.0-kb4483229-x64_6efee63e3f7d6b01da74342bf27b4540c0743420.msu /quiet /norestart
wusa.exe D:\windows10.0-kb4091664-v5-x64_206a0eeae7cc2064f2c13381dbf31cd3b8fc6f6d.msu /quiet /norestart

shutdown /r