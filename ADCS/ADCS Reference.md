# Active Directory Certificate Services Command Line Refence

**Requesting Certificates on a Server Core Only**

Ex: This command will install Kerberos Authentication Certificate on a Domain Controller

```
Get-Certificate -Template KerberosAuthentication -CertStoreLocation cert:\LocalMachine\My
```
