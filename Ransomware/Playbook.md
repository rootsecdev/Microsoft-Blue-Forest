#Ransomeware playbook and references

Notes: This area is for various ransomeware and containment strategies I have come across and is useful in allow orgs to assess weaknesses in the current network security hardening environment.

**Ransomware Protection and Containment Strategies**

URL: https://www.fireeye.com/content/dam/fireeye-www/current-threats/pdfs/wp-ransomware-protection-and-containment-strategies.pdf

**CISA Ransomware Guide**

URL: https://www.cisa.gov/publication/ransomware-guide

**On Demand Mandiant Ransomware Series from the front lines**

URL: https://www.fireeye.com/company/events/mandiant-ransomware-series.html

**Microsoft Human Operated Ransomware Guidance**

URL: https://docs.microsoft.com/en-us/security/compass/human-operated-ransomware


**List of protection techniques**
- Use Microsoft LAPS for local admin password rotation
- Limit Administrative rights given to workstations
- Separate workstations for admins in different departments such as Helpdesk/Desktop Support, Server teams, Domain Admins..etc. These workstations should have no internet access. 
- Disable SMB1 on Domain Controllers, Member Servers, and Windows Clients
- Protect Lateral movement by banning your most sensitive accounts from logging into workstations, member servers. (Ex. Domain Admins, Enterprise Admins)
- Inplement Windows Defender Attack Surface Reduction even if you are running another thrid party antivirus. Allow ASR to work along side with defender. Works on Windows 10 Pro and above. 
- Lower the attack surface of your domain controllers by using server core only. 

