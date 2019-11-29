# Security Baseline 101

This section contains security baselines for Windows 10 Workstation and Server 2016/2019 OS's along with anything custom out of Microsoft's default baselines will be labled appropriately.

Reference Documentation:

**Microsoft Security Compliance Toolkit 1.0**

https://docs.microsoft.com/en-us/windows/security/threat-protection/security-compliance-toolkit-10

**Windows Security Configuration Framework**

https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-security-configuration-framework/windows-security-configuration-framework

**Windows Restricted Traffic Limited Functionality Baseline**

https://docs.microsoft.com/en-us/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services

**Microsoft Security Guidance Blog**

https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/bg-p/Microsoft-Security-Baselines

**CIS Security Baselines**

https://www.cisecurity.org/cis-benchmarks/

## Server 2016

The following is post hardening guidance for Server 2016. This guidance assumes you are doing security baselines with Microsoft's SCT 1.0. The following guidance below is for Domain controllers and member servers that are running on server 2016.

**Domain Controller Security**

Post Remediation will focus on vulnerabilities found with a nessus scan. This scan was taken on 11/27/19.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-1.PNG)

Build Script to take care of vulnerabilities identified in the registry:

```
REM https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-8529

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" /v iexplore.exe /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" /v iexplore.exe /t REG_DWORD /d 1 /f

REM https://support.microsoft.com/en-us/help/4072698/windows-server-speculative-execution-side-channel-vulnerabilities-prot

REM Only Run this portion of the script if Server runs on Intel Processor

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 72 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f

REM If the Hyper-V feature is installed, add the following registry setting:

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f

REM https://support.microsoft.com/en-us/help/4034879/how-to-add-the-ldapenforcechannelbinding-registry-entry

reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters" /v LdapEnforceChannelBinding /t REG_DWORD /d 2 /f

```
*Intel Microcode Update*

Depending on your version of intel processor you may need a Microcode Update

Refrence Link: https://support.microsoft.com/en-ca/help/4494175/kb4494175-intel-microcode-updates

Download: http://www.catalog.update.microsoft.com/Search.aspx?q=KB4494175

*Group Policy Central Store*

The following URL is instructions on how to create a group policy central store. I highly recommend creating a central store to get a consitent group policy experience when editing or modifying existing group policies. 

https://support.microsoft.com/en-us/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra

At the time of this writing Windows 10 1909 templates have not been published (11/27/19). Simply boot a Windows 10 V 1909 machine and copy the following area:

**C:\Windows\PolicyDefinitions** to **\\\Your Domain\SYSVOL\contoso.com\policies\PolicyDefinitions**

Example below:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-2.PNG)

Also copy the following templates from the Windows 10 1909 baseline to the group policy central store. Make sure to store the adml files in the "en-us" folder

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-3.PNG)

*Disable SMB1*

URL Reference: https://support.microsoft.com/en-us/help/2696547/detect-enable-disable-smbv1-smbv2-smbv3-in-windows-and-windows-server

By default SMB1 is enabled in Server 2016.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-4.PNG)

To disable through group policy:

Navigate to "Computer Configuration\Policies\Administrative Templates\MS Security Guide"

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-5.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-6.PNG)

Reboot is required for changes to take effect. 

*Disable Netbios and LLMNR**

These two protocols are legacy and if left on can disclose credential hashes to domain accounts if an attacker is insider your network. To remove this vulnerability it is recommended to remove. I've safely removed on environments running Windows7/2008 R2 and above without any issues. 

Navigate to "Computer Configuration\Policies\Administrative Templates\MS Security Guide"

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-7.PNG)

Navigate to "Computer Configuration\Policies\Administrative Templates\Network\DNS Client"

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-8.PNG)

*RDP CredSSP*

It is suggested that RDP not be enabled on domain controllers. Regardless if enabled or not Oracle Remediation should be enabled and set to "Forced Mitigated" 

Navigate to "Computer Configuration\Policies\Administrative Templates\System\Credentials Delegation"

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Screenshots/Server2016-9.PNG)


