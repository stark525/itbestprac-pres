# itbestprac-pres
"DevOps Solutions to Traditional IT Challenges" presentation for IT Best Practices Greater Philadelphia User Group

This presentation is catered to IT professionals who are new to Vagrant and Puppet.  The goal was to explore possibilities with Puppet for Windows.  The primary objective is to create a pluggable workstation for a new employee.  Although there are other tools out there, Puppet handles this job reasonably well.

http://www.meetup.com/IT-Best-Practices-Greater-Philadelphia-User-Group/events/220921325/?a=wc1d.2_gnl&gj=wc1d.2_e&rv=wc1d.2_e

Vagrant known issues
---------------------
The Windows VM I'm using has the Administrator account disabled, so the powershell script to install Puppet fails by default.  A quick fix can be to re enable the Administrator account (you can even do this before the script is called)

Right click My Computer > Manage
Set Administrator password and un-disable account
Log out and log back in.
Get it done before provisioning script and itll run

You'll also want to show hidden files and folders, as most of the Puppet stuff uses C:\ProgramData which is a hidden folder.

Additionally, you'll need to tell Vagrant to use this Vagrantfile and associated scripts.  You can either copy them to the default install directory C:\HashiCorp\Vagrant\bin, or set an environment variable to wherever you clone the repo.  If you chose to do the latter, make sure to exclude the created box in .gitignore.