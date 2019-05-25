REM SPECULATIVE CPU Update 

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 72 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f

REM Resolve MS15-124 Shows up on nessus scan even on server core
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING" /v iexplore.exe /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING" /v iexplore.exe /t REG_DWORD /d 1 /f

REM Install Windows Defender Definition Update
D:\mpam-fe.exe

REM Install MS Patches
wusa.exe D:\windows10.0-kb4494175-x64_0b88bce7114b93eb6067d52270f6abf3ac0a241c.msu /quiet /norestart
wusa.exe D:\windows10.0-kb4498947-x64_97b6d1b006cd564854f39739d4fc23e3a72373d7.msu /quiet /norestart
wusa.exe D:\windows10.0-kb4499177-x64_8cb59049b792ea4f7b9c09635200b91a2b121470.msu /quiet /norestart


shutdown /r
