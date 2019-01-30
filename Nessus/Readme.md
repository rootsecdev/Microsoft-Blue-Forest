# Nessus setup for Lab Puposes only

This doument discusses in detail on how to set up a nessus scanner using Cent OS 7. There are two paths for setup depending on your level of comfort. The first path is to install using a Minimal ISO install of Cent OS 7. The second path is setting up a using via gnome desktop. The second path is for those that are intimidated by CLI. 

Personally I prefer using a minimal based CLI install of Cent OS. Along with being less resource intensive it will lower your threat surface risk. A good question is why Cent OS? I like Cent OS for two reasons. 

1. Longivity of the OS and its strict adherance to stable updates. 

2. Firewall is on by default and the ability to choose a security hardening baseline on install.

## Setting up Cent OS7 and Nessus using the minimal install ISO with Hyper-V

1. To download the minimal install ISO for Cent OS you will need to go to the following website:

- https://www.centos.org/download/

2. Select the minimal install ISO link

3. In Hyper-V select New >> Virtual Machine

4. Select Next

5. Specify the name and location. Click on Next.

6. Select Generation 1 for the virtual machine (Cent OS 7 does support Generation 2 but for simiplicity choose Gen 1.

7. Assign 4096 MB memory and uncheck use dynamic memory for this virtual machine. This will ensure the VM does not go over it's allocated memory size.

8. Choose a hyper-v connection that has internet access and click on next.
   - Refer to the following documentation for creating hyper-v switches with internet connections:
   - (Insert Document Link Here)

9. Take the default on creating a virtual hard disk and select next.

10. Navigate to the ISO you saved from step 2 on the installation options screen and select next.

11. Click on Finish to the summary.

## Setting up Cento OS7 and Nessus using the gnome live CD.
