# RDP Restricted Admin Mode

RDP restricted admin mode is just one piece of a larger solution to mitigate credential theft especially on machines that may already be compromised and you want to reduce the risk of leaving credentials on member servers or client machines for the purpose of troubleshooting issues through RDP.

Keep in mind the following:

- Domain Admins should never use RDP from an account that has the following roles: Domain Admin, Enterprise Admin, Schema admin.

- RDP should only be used on the accounts above to Domain controllers only and nothing else.

- RDP restricted admin mode should be used with what I’d call tier 2 administrator ID’s, Desktop/helpdesk employees. They need to have the understanding that they will not have access to network resources in restricted admin mode.

- One of the common myths with restricted admin mode is that it is only available on Windows 8/2012 R2 server and above. As of Oct. 14 2014 restricted admin was actually backported to Windows 7/2008 R2 with the following KB’s:

- 2984972 for supported editions of Windows 7 and Windows Server 2008 R2

- 2984976 for supported editions of Windows 7 and Windows Server 2008 R2 that have update 2592687 (Remote Desktop Protocol (RDP) 8.0 update) installed. Customers who install update 2984976 must also install update 2984972.
2984981 for supported editions of Windows 7 and Windows Server 2008 R2 that have update 2830477 (Remote Desktop Connection (RDC) 8.1 client update) installed. Customers who install update 2984981 must also install update 2984972.
Bottom line: If you patch your systems with critical updates and are current. Then you should be covered. Updating to RDC 8.1 clients are optional updates. So if you don’t have them then there is no worry. Restricted Admin mode still works.

AS with any RDP hardening you would be better served to look at CIS benchmarks or DISA Stig’s when hardening RDP as well as various other OS mitigation's. Below is what I’d consider best practices when enabling RDP and rolling out restricted mode.

You will want to restrict certain groups from using RDP to a certain class of users at a minimum Remote Desktop Users and Administrators should only have access to use RDP. I would personally create a global security group to maintain control of people that would have access to use RDP. Also deny local accounts and guests access to RDP.
